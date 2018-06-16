#include "initFS.h"

block disk[BLOCK_GROUP_SIZE];
union SuperBlock *super;
union Inode *inodeTable;
uint8_t *inodeBitmap;
uint8_t *blockBitmap;
block *data;
struct FCB fcbTable[NR_FCB];

int main() {
    memset(disk, 0, BLOCK_GROUP_SIZE*sizeof(block));
    FILE *fp = fopen("bootloader/bootloader.bin", "rb");
    if(fp == NULL) {
        printf("error opening bootloader/bootloader.bin\n");
        assert(0);
    }
    block *bootBuf = &disk[0];
    int bootSize = fread(bootBuf, sizeof(block), NR_BOOT, fp);
    printf("read %d block from bootloader/bootloader/bin\n", bootSize);
    
    fp = fopen("kernel/kMain.elf", "rb");
    if(fp == NULL) {
        printf("error opening kernel/kMain.elf\n");
        assert(0);
    }
    block *kernelBuf = &disk[NR_BOOT];
    int kernelSize = fread(kernelBuf, sizeof(block), NR_KERNEL, fp);
    printf("read %d block from kernel/kMain.elf\n", kernelSize);

    fp = fopen("app/uMain.elf", "rb");
    if(fp == NULL) {
        printf("error opening app/uMain.elf\n");
        assert(0);
    }
    block *appBuf = (block *)malloc(200*sizeof(block));
    int appSize = fread(appBuf, sizeof(block), 200, fp);
    printf("read %d block from app/uMain.elf\n", appSize);

    initDisk();
    initFcbTable();
    mkdir("/sbin");
    mkdir("/dev");
    mkdir("/usr");
    mkfile("/dev/stdin");
    mkfile("/dev/stdout");
    /*
    int fd = open("/usr/test", 0);  // 创建文件"/usr/test"
    for(int i = 0; i < 512; ++i) {               // 向"/usr/test"文件中写入字母表
        char tmp = (char)(i % 26 + 'A');
        write(fd, (uint8_t*)&tmp, 1);
    }
    close(fd);
    char temp[512];
    fd = open("/usr/test", 0);
    read(fd, temp, 512);
    for(int i = 0; i < 512; ++i) {
        printf("%c", temp[i]);
    }
    printf("\n");
    */
    
    int fd = open("/sbin/init", 0);
    write(fd, appBuf, appSize*sizeof(block));
    close(fd);
    /*
    fd = open("/sbin/init", 0);
    block *appBuf2 = (block *)malloc(appSize*sizeof(block));
    read(fd, appBuf2, appSize*sizeof(block));
    for(int i = 0; i < appSize; ++i) {
        for(int j = 0; j < sizeof(block); ++j) {
            assert(appBuf[i][j] == appBuf2[i][j]);
        }
    }
    */
    
    ls("/");
    ls("/sbin");
    ls("/dev");
    ls("/usr");
    
    fp = fopen("os.img", "wb");
    fwrite(disk, sizeof(block), DISK_BLOCK, fp);
    fclose(fp);
    
    return 0;
}

void initDisk() {
    // init superblock in 201 sector
    super = (union SuperBlock *)&disk[FS_START];
    super->sectorNum = BLOCK_GROUP_SIZE;
    super->inodeNum = NR_INODE;
    super->blockNum = NR_BLOCK;
    super->availInodeNum = NR_INODE;
    super->availBlockNum = NR_BLOCK;
    super->blockSize = SECTSIZE;
    super->blocksPerGroup = NR_BLOCK;
    super->inodesPerGroup = NR_INODE;

    // init group descriptor in 202 sector
    // and inodeTable from 205 to 333 sector
    union GroupDesc *groupDesc = (union GroupDesc *)&disk[202];
    groupDesc->inodeBitmap = 203;
    groupDesc->blockBitmap = 204;
    groupDesc->inodeTable = 205;
    groupDesc->availBlockNum = NR_BLOCK;
    groupDesc->availInodeNum = NR_INODE;

    // init inodeBitmap and blockBitmap from 203 to 204 sector
    memset(&disk[203], 0, 2*sizeof(block));

    inodeBitmap = (uint8_t *)&disk[203];
    blockBitmap = (uint8_t *)&disk[204];
    inodeBitmap[0] = 1;
    blockBitmap[0] = 1;
    --super->availInodeNum;
    --super->availBlockNum;

    inodeTable = (union Inode *)&disk[205];
    union Inode *root = inodeTable;
    root->type = INODE_TYPE_DIR;
    root->linkCount = 1;
    root->blockCount = 1;
    root->size = 2;
    memset(root->pointer, -1, POINTER_NUM*sizeof(uint32_t));
    root->pointer[0] = 0;
    root->singlyPointer = -1;
    root->doublyPointer = -1;
    root->triplyPointer = -1;

    data = &disk[333];
    union DirEntry *dirEnt = (union DirEntry *)data;
    dirEnt->inode = 0;
    strcpy(dirEnt->name, ".");
    ++dirEnt;
    dirEnt->inode = -1;
    strcpy(dirEnt->name, "..");
}

void mkdir(const char *dirName) {
    assert(dirName[0] != '\0');
    
    char fileName[50];
    char path[50];
    splitFileName(dirName, path, fileName);
    int parentInode = findFile(path);

    // fill the inode and block of new directory
    int newInode = applyNewInode();
    --super->availInodeNum;
    int newBlock = applyNewBlock();
    --super->availBlockNum;
    union Inode *pInode = &inodeTable[newInode];
    
    pInode->type = INODE_TYPE_DIR;
    pInode->blockCount = 1;
    pInode->linkCount = 1;
    pInode->size = 2;
    memset(pInode->pointer, -1, POINTER_NUM*sizeof(uint32_t));
    pInode->pointer[0] = newBlock;
    pInode->singlyPointer = -1;
    pInode->doublyPointer = -1;
    pInode->triplyPointer = -1;

    union DirEntry *dirEnt = (union DirEntry *)&data[newBlock];
    dirEnt->inode = newInode;
    strcpy(dirEnt->name, ".");
    ++dirEnt;
    dirEnt->inode = parentInode;
    strcpy(dirEnt->name, "..");
    
    // add inode of new directory to its parent directory
    pInode = &inodeTable[parentInode];
    
    int pointerIdx = pInode->size/DIRENT_PER_BLOCK;
    int blockIdx = pInode->pointer[pointerIdx];
    union DirEntry *dirEntry = (union DirEntry *)&data[blockIdx];
    
    int dirIdx = pInode->size%DIRENT_PER_BLOCK;
    strcpy(dirEntry[dirIdx].name, fileName);
    dirEntry[dirIdx].inode = newInode;
    ++pInode->size;
}

void splitFileName(const char *str, char *path, char *fileName) {
    char temp[50];
    strcpy(temp, str);
    char *ptr = temp, *flag = NULL;
    while(*ptr != '\0') {
        if(*ptr == '/') {
            flag = ptr;
        }
        ++ptr;
    }
    assert(flag != NULL);
    *flag = '\0';
    strcpy(path, temp);
    *flag = '/';
    ++flag;
    strcpy(fileName, flag);
}

int findFile(const char *fileName) {
    assert(fileName != NULL);
    if(fileName[0] == '\0') {
        return 0;
    }

    assert(fileName[0] == '/');
    if(fileName[1] == '\0') {
        return 0;
    }
    char temp[50];
    strcpy(temp, fileName);

    int inodeIdx = -1;
    char *ptr = strtok(&temp[1], "/");
    int fail = 0, find = 0;
    while(ptr != NULL) {
        union Inode *pInode = &inodeTable[inodeIdx];
        int size = pInode->size;
        for(int i = 0; pInode->pointer[i] != -1; ++i) {
            int blockIdx =  pInode->pointer[i];
            union DirEntry *pDirEnt = (union DirEntry *)&data[blockIdx];
            for(int j = 0; j < DIRENT_PER_BLOCK; ++j) {
                if(strcmp(ptr, pDirEnt[j].name) == 0) {
                    inodeIdx = pDirEnt[j].inode;
                    find = 1;
                    break;
                }
                --size;
                if(size == 0) {
                    fail = 1;
                    //printf("file not found\n");
                    break;
                }
            }
            if(fail == 1 || find == 1) {
                break;
            }
        }
        ptr = strtok(NULL, "/");
    }
    if(fail == 1) {
        return -1;
    } else {
        return inodeIdx;
    }
}

void ls(const char *dirName) {
    assert(dirName != NULL);
    assert(dirName[0] != '\0');

    int parentInode = findFile(dirName);

    union Inode *pInode = &inodeTable[parentInode];
    assert(pInode->type == INODE_TYPE_DIR);

    int size = pInode->size;
    for(int i = 0; pInode->pointer[i] != -1; ++i) {
        int blockIdx = pInode->pointer[i];
        union DirEntry *pDirEnt = (union DirEntry *)&data[blockIdx];
        for(int j = 0; j < DIRENT_PER_BLOCK; ++j) {
            printf("%s\t", pDirEnt[j].name);
            --size;
            if(size == 0) {
                printf("\n");
                return;
            }
        }
    }
}

int mkfile(const char *fileName) {
    assert(fileName[0] != '\0');
    
    char file[50];
    char path[50];
    splitFileName(fileName, path, file);
    int parentInode = findFile(path);
    
    int newInode = applyNewInode();
    --super->availInodeNum;
    union Inode *pInode = &inodeTable[newInode];
    
    pInode->type = INODE_TYPE_FILE;
    pInode->blockCount = 0;
    pInode->linkCount = 1;
    pInode->size = 0;
    memset(pInode->pointer, -1, POINTER_NUM*sizeof(uint32_t));
    pInode->singlyPointer = -1;
    pInode->doublyPointer = -1;
    pInode->triplyPointer = -1;

    pInode = &inodeTable[parentInode];
    
    int pointerIdx = pInode->size/DIRENT_PER_BLOCK;
    int blockIdx = pInode->pointer[pointerIdx];
    union DirEntry *dirEntry = (union DirEntry *)&data[blockIdx];
    int dirIdx = pInode->size%DIRENT_PER_BLOCK;

    strcpy(dirEntry[dirIdx].name, file);
    dirEntry[dirIdx].inode = newInode;
    ++pInode->size;

    return newInode;
}

int applyNewInode() {
    for(int i = 0; i < NR_INODE; ++i) {
        if(inodeBitmap[i] == 0) {
            --super->availInodeNum;
            inodeBitmap[i] = 1;
            return i;
        }
    }
    printf("no empty inode\n");
    assert(0);
}

int applyNewBlock() {
    for(int i = 0; i < NR_BLOCK; ++i) {
        if(blockBitmap[i] == 0) {
            --super->availBlockNum;
            blockBitmap[i] = 1;
            return i;
        }
    }
    printf("no empty block\n");
    assert(0);
}

int appleNewFCB() {
    for(int i = 0; i < NR_FCB; ++i) {
        if(fcbTable[i].isFree == 1) {
            fcbTable[i].isFree = 0;
            return i;
        }
    }
    printf("no empty FCB\n");
    assert(0);
}

void initFcbTable() {
    for(int i = 0; i < NR_FCB; ++i) {
        fcbTable[i].isFree = 1;
        fcbTable[i].inode = -1;
        fcbTable[i].offset = 0;
    }
}

int open(const char *fileName, int priority) {
    int inode = findFile(fileName);
    if(inode == -1) {
        inode = mkfile(fileName);
    }
    int fcbIdx = appleNewFCB();
    struct FCB *fcb = &fcbTable[fcbIdx];
    fcb->isFree = 0;
    fcb->offset = 0;
    fcb->inode = inode;

    return fcbIdx;
}

void lseek(int fd, int offset, int whence) {
    int inode = fcbTable[fd].inode;
    int size = inodeTable[inode].size;
    switch(whence) {
        case SEEK_SET: fcbTable[fd].offset = offset; break;
        case SEEK_CUR: fcbTable[fd].offset += offset; break;
        case SEEK_END: fcbTable[fd].offset = size - offset; break;
        default: assert(0);
    }
}

void close(int fd) {
    fcbTable[fd].isFree = 1;
    fcbTable[fd].inode = -1;
    fcbTable[fd].offset = 0;
}

int read(int fd, void *buffer, int size) {
    int inode = fcbTable[fd].inode;
    int offset = fcbTable[fd].offset;
    int fileSz = inodeTable[inode].size;
    if(offset + size > fileSz) {
        size = fileSz - offset;
    }

    if(offset/SECTSIZE == (offset + size)/SECTSIZE) {
        int blockIdx = inodeTable[inode].pointer[offset/SECTSIZE];
        memcpy(buffer, (uint8_t *)&data[blockIdx] + offset%SECTSIZE, size);
    } else {    
        uint8_t *ptr = (char *)buffer;
        int len = size;

        int first = SECTSIZE - offset%SECTSIZE;
        int pointerIdx = offset/SECTSIZE;
        int firstBlockIdx = inodeTable[inode].pointer[pointerIdx];
        memcpy(ptr, (uint8_t *)&data[firstBlockIdx] + offset%SECTSIZE, first);
        ptr += first;
        len -= first;
        ++pointerIdx;
        fcbTable[fd].offset += first;
        
        while(len > SECTSIZE) {
            int blockIdx = inodeTable[inode].pointer[pointerIdx];
            memcpy(ptr, (uint8_t *)&data[blockIdx], SECTSIZE);
            ptr += SECTSIZE;
            len -= SECTSIZE;
            ++pointerIdx;
            fcbTable[fd].offset += SECTSIZE;
        }

        int lastBlockIdx = inodeTable[inode].pointer[pointerIdx];
        memcpy(ptr, (uint8_t *)&data[lastBlockIdx], len);
        fcbTable[fd].offset += len;
    }

    return size;
}

int write(int fd, void *buffer, int size) {
    int inode = fcbTable[fd].inode;
    int offset = fcbTable[fd].offset;
    if(offset + size > POINTER_NUM*SECTSIZE) {
        size = POINTER_NUM*SECTSIZE - offset;
    }

    if(offset + size > inodeTable[inode].size) {
        inodeTable[inode].size = offset + size;
        for(int i = 0; i <= (offset + size)/SECTSIZE; ++i) {
            if(inodeTable[inode].pointer[i] == -1) {
                inodeTable[inode].pointer[i] = applyNewBlock();
            }
        }
    }

    if(offset/SECTSIZE == (offset + size)/SECTSIZE) {
        int blockIdx = inodeTable[inode].pointer[offset/SECTSIZE];
        memcpy((uint8_t *)&data[blockIdx] + offset%SECTSIZE, buffer, size);
        fcbTable[fd].offset += size;
    } else {
        uint8_t *ptr = buffer;
        int len = size;

        int first = SECTSIZE - offset%SECTSIZE;
        int pointerIdx = offset/SECTSIZE;
        int firstBlockIdx = inodeTable[inode].pointer[pointerIdx];
        memcpy((uint8_t *)&data[firstBlockIdx] + offset%SECTSIZE, ptr, first);
        ptr += first;
        len -= first;
        ++pointerIdx;
        fcbTable[fd].offset += first;

        while(len > SECTSIZE) {
            int blockIdx = inodeTable[inode].pointer[pointerIdx];
            memcpy((uint8_t *)&data[blockIdx], ptr, SECTSIZE);
            ptr += SECTSIZE;
            len -= SECTSIZE;
            ++pointerIdx;
            fcbTable[fd].offset += SECTSIZE;
        }

        int lastBlockIdx = inodeTable[inode].pointer[pointerIdx];
        memcpy((uint8_t *)&data[lastBlockIdx], ptr, len);
        fcbTable[fd].offset += len;
    }
    return size;
}