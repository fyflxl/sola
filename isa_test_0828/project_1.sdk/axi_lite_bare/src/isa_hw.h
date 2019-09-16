#ifndef _ISA_HW_H
#define _ISA_HW_H

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

#define ISA_CTRL_BUS_ADDR_AP_CTRL            0x00
#define ISA_CTRL_BUS_ADDR_ISA_MODE           0x04
#define ISA_CTRL_BUS_ADDR_ISA_ADDR           0x08
#define ISA_CTRL_BUS_ADDR_WDATA              0x0c
#define ISA_CTRL_BUS_ADDR_RDATA              0x10

#define ISA_BASEADDR 0x43c00000

#define WriteReg(BaseAddress, RegOffset, Data) *(volatile unsigned int*)((BaseAddress) + (RegOffset)) = (Data)
#define ReadReg(BaseAddress, RegOffset) *(volatile unsigned int*)((BaseAddress) + (RegOffset))

int ISA_FPGA(int mode, int isa_addr, int wdata);

#endif
