#include "x86.h"
#include "device.h"

uint8_t inodeBitmap[SECTSIZE];
uint8_t blockBitmap[SECTSIZE];
union SuperBlock superBlock;
union GroupDesc groupDesc;

void initDisk() {
    superBlock.sectorNum = BLOCK_GROUP_SIZE;
    superBlock.inodeNum = NR_INODE;
    superBlock.blockNum = NR_BLOCK;
    superBlock.availInodeNum = NR_INODE;
    superBlock.availBlockNum = NR_BLOCK;
    superBlock.blockSize = SECTSIZE;
    superBlock.inodesPerGroup = NR_INODE;
    superBlock.blocksPerGroup = NR_BLOCK;
}