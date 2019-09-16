
#ifndef _AXILITE_HW_H
#define _AXILITE_HW_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <linux/fb.h>
#include <string.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/stat.h>


#define AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET 0
#define AXILITE_TEST_S00_AXI_SLV_REG1_OFFSET 4
#define AXILITE_TEST_S00_AXI_SLV_REG2_OFFSET 8
#define AXILITE_TEST_S00_AXI_SLV_REG3_OFFSET 12

#define AXILITE_BASEADDR 0x43c00000

#define WriteReg(BaseAddress, RegOffset, Data) *(volatile unsigned int*)((BaseAddress) + (RegOffset)) = (Data)
#define ReadReg(BaseAddress, RegOffset) *(volatile unsigned int*)((BaseAddress) + (RegOffset))

void AXILITE_HW(unsigned int Value);

#endif
