#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <inttypes.h>
#include <string.h>
#include <assert.h>

#define INODE_SIZE 128
#define POINTER_NUM 25
#define DIRENTRY_SIZE 64
#define NR_FCB 16
#define INODE_TYPE_DIR 0x1
#define INODE_TYPE_FILE 0x2
#define NR_BOOT 1
#define NR_KERNEL 200
#define FS_START (NR_BOOT + NR_KERNEL)
#define DISK_BLOCK 1024
#define BLOCK_GROUP_SIZE (DISK_BLOCK - FS_START)

#define NR_INODE 512
#define NR_BLOCK 512
#define SECTSIZE 512
#define SUPER_SECTSIZE SECTSIZE
#define GROUP_DESC_SIZE SECTSIZE
#define DIRENTRY_NAME_LENGTH (DIRENTRY_SIZE - sizeof(uint32_t))
#define DIRENT_PER_BLOCK (SECTSIZE/DIRENTRY_SIZE)

typedef uint8_t block[SECTSIZE];


union SuperBlock {
    uint8_t byte[SUPER_SECTSIZE];
    struct {
        uint32_t sectorNum;
        uint32_t inodeNum;
        uint32_t blockNum;
        uint32_t availInodeNum;
        uint32_t availBlockNum;
        uint32_t blockSize;
        uint32_t inodesPerGroup;
        uint32_t blocksPerGroup;
    };
};

union GroupDesc {
    uint8_t byte[GROUP_DESC_SIZE];
    struct {
        uint32_t inodeBitmap;
        uint32_t blockBitmap;
        uint32_t inodeTable;
        uint32_t availInodeNum;
        uint32_t availBlockNum;
    };
};

extern union SuperBlock superBlock;
extern union GroupDesc groupDesc;

union Inode {
    uint8_t byte[INODE_SIZE];
    struct {
        uint16_t type;
        uint16_t linkCount;
        uint32_t blockCount;
        uint32_t size;
        uint32_t pointer[POINTER_NUM];
        uint32_t singlyPointer;
        uint32_t doublyPointer;
        uint32_t triplyPointer;

    };
};

union DirEntry {
    uint8_t byte[DIRENTRY_SIZE];
    struct {
        uint32_t inode;
        char name[DIRENTRY_NAME_LENGTH];
    };
};

struct FCB {
    int isFree;
    int offset;
    int inode;
};

extern block disk[BLOCK_GROUP_SIZE]; 
extern union SuperBlock *super;
extern union Inode *inodeTable;
extern uint8_t *inodeBitmap;
extern uint8_t *blockBitmap;
extern block *data;
extern struct FCB fcbTable[NR_FCB];

void initDisk();
void mkdir(const char *dirName);
int findFile(const char *fileName);
void splitFileName(const char *str, char *path, char *fileName);
void ls(const char *dirName);
int mkfile(const char *fileName);
int applyNewInode();
int applyNewBlock();
int applyNewFCB();
void initFcbTable();
int open(const char *fileName, int priority);
void lseek(int fd, int offset, int whence);
int read(int fd, void *buffer, int size);
int write(int fd, void *buffer, int size);
void close(int fd);