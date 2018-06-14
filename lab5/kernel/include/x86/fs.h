#ifndef __X86_FS__
#define __X86_FS__

#include "common.h"

#define SECTSIZE 512
#define INODE_SIZE 128
#define POINTER_NUM 25
#define DIRENTRY_SIZE 64
#define INODE_TYPE_DIR 0x1
#define INODE_TYPE_FILE 0x2

#define SUPER_SECTSIZE SECTSIZE
#define GROUP_DESC_SIZE SECTSIZE
#define DIRENTRY_NAME_LENGTH (DIRENTRY_SIZE - sizeof(uint32_t))

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

#endif
