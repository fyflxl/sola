
#ifndef _SPBEL_HW_H
#define _SPBEL_HW_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <linux/fb.h>
#include <string.h>
#include <time.h>

// CTRL_BUS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of rows
//        bit 31~0 - rows[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of cols
//        bit 31~0 - cols[31:0] (Read/Write)
// 0x1c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSOBEL_FILTER_CTRL_BUS_ADDR_AP_CTRL   0x00
#define XSOBEL_FILTER_CTRL_BUS_ADDR_GIE       0x04
#define XSOBEL_FILTER_CTRL_BUS_ADDR_IER       0x08
#define XSOBEL_FILTER_CTRL_BUS_ADDR_ISR       0x0c
#define XSOBEL_FILTER_CTRL_BUS_ADDR_ROWS_DATA 0x10
#define XSOBEL_FILTER_CTRL_BUS_BITS_ROWS_DATA 32
#define XSOBEL_FILTER_CTRL_BUS_ADDR_COLS_DATA 0x18
#define XSOBEL_FILTER_CTRL_BUS_BITS_COLS_DATA 32


//#define SOBEL_BASEADDR 0x43c00000
#define SOBEL_BASEADDR 0x43c00000

#define WriteReg(BaseAddress, RegOffset, Data) *(volatile unsigned int*)((BaseAddress) + (RegOffset)) = (Data)
#define ReadReg(BaseAddress, RegOffset) *(volatile unsigned int*)((BaseAddress) + (RegOffset))

void SOBEL_HW(int ncols, int nrows);

#define MM2S_DMACR     0x00
#define MM2S_DMASR     0x04
#define MM2S_SA        0x18
#define MM2S_LENGTH    0x28  //start

#define S2MM_DMACR     0x30
#define S2MM_DMASR     0x34
#define S2MM_DA        0x48
#define S2MM_LENGTH    0x58 //start

#define DMA_BASEADDR 0x40400000

void DMA_HW(int ncols, int nrows,unsigned long mm2s_addr,unsigned long s2mm_addr);

#endif
