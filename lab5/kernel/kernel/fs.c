#include "x86.h"
#include "device.h"
#include "debug.h"

block disk[DISK_BLOCK];
union SuperBlock *super;
union Inode *inodeTable;
uint8_t *inodeBitmap;
uint8_t *blockBitmap;
block *data;
struct FCB fcbTable[NR_FCB];
char buf1[50];
char buf2[50];
char pathBuf[50];
char fileNameBuf[50];
char pathBuf2[50];
char fileBuf[50];

void initFS() {
    for(int i = 0; i < DISK_BLOCK; ++i) {
        readSect(disk[i], i);
    }
    super = (union SuperBlock *)&disk[FS_START];
    inodeBitmap = (uint8_t *)&disk[203];
    blockBitmap = (uint8_t *)&disk[204];
    inodeTable = (union Inode *)&disk[205];
    data = &disk[333];
    initFcbTable();
}


void splitFileName(const char *str, char *path, char *fileName) {
    strcpy(buf1, str);
    char *ptr = buf1, *flag = NULL;
    while(*ptr != '\0') {
        if(*ptr == '/') {
            flag = ptr;
        }
        ++ptr;
    }
    if(flag == NULL) {
        printString("is NULL\n");
    }

    assert(flag != NULL);
    *flag = '\0';
    strcpy(path, buf1);
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
    strcpy(buf2, fileName);

    int inodeIdx = -1;
    char *ptr = strtok(buf2, "/");
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
    printDemical(parentInode);
    assert(parentInode != -1);

    union Inode *pInode = &inodeTable[parentInode];
    assert(pInode->type == INODE_TYPE_DIR);

    int size = pInode->size;
    for(int i = 0; pInode->pointer[i] != -1; ++i) {
        int blockIdx = pInode->pointer[i];
        union DirEntry *pDirEnt = (union DirEntry *)&data[blockIdx];
        for(int j = 0; j < DIRENT_PER_BLOCK; ++j) {
            kernelPrint(pDirEnt[j].name);
            kernelPrint("  ");
            printString(pDirEnt[j].name);
            putChar('\t');
            --size;
            if(size == 0) {
                putChar('\n');
                kernelPrint("\n");
                return;
            }
        }
    }
}

int mkfile(const char *fileName) {
    assert(fileName[0] != '\0');
    
    splitFileName(fileName, pathBuf2, fileBuf);
    int parentInode = findFile(pathBuf2);
    
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

    strcpy(dirEntry[dirIdx].name, fileBuf);
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
    printString("no empty inode\n");
    assert(0);
    return -1;
}

int applyNewBlock() {
    for(int i = 0; i < NR_BLOCK; ++i) {
        if(blockBitmap[i] == 0) {
            --super->availBlockNum;
            blockBitmap[i] = 1;
            return i;
        }
    }
    printString("no empty block\n");
    assert(0);
    return -1;
}

int appleNewFCB() {
    for(int i = 0; i < NR_FCB; ++i) {
        if(fcbTable[i].isFree == 1) {
            fcbTable[i].isFree = 0;
            return i;
        }
    }
    printString("no empty FCB\n");
    assert(0);
    return -1;
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
        uint8_t *ptr = (uint8_t *)buffer;
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
    //printDemical(fd);
    //printDemical(inode);
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

void cat(char *fileName) {
    int inode = findFile(fileName);
    int size = inodeTable[inode].size;
    int pointerIdx = 0;
    while(size > SECTSIZE) {
        int blockIdx = inodeTable[inode].pointer[pointerIdx];
        kernelPrintN((char *)&data[blockIdx], SECTSIZE);
        ++pointerIdx;
        size -= SECTSIZE;
    }
    int lastBlockIdx = inodeTable[inode].pointer[pointerIdx];
    kernelPrintN((char *)&data[lastBlockIdx], size);
}
