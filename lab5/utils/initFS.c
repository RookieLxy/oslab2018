#include "initFS.h"

block disk[BLOCK_GROUP_SIZE];

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

    fclose(fp);
    return 0;
}