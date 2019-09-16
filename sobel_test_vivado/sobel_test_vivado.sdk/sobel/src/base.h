/*********************************** Header Section *****************************************
--
-- NAME       : Yu Jin
-- Date       : Aug, 2014
-- E-mail     : yj3119@sina.com
-- Address    : Department of Electrical Engineering, Jiangnan University

-- Filename   : base.h
-- Description: ARM and FPGA Share Data Function
--
*********************************** End Header Section***************************************/  
#ifndef BASE_H
#define BASE_H

//Util Function
#define REG_CHWRITE(addr, off, val)  (*(volatile unsigned char *)(addr + off) = (unsigned char)(val))
#define REG_CHREAD(addr, off)  (*(volatile unsigned char *)(addr + off))
#define REG_WRITE(addr, off, val) (*(volatile unsigned int *)(addr + off)) = (val)
#define REG_READ(addr, off) (*(volatile unsigned int *)(addr + off))

//Write input data to AXI data stream
void copy_mem2dev(unsigned char *R, unsigned char *G, unsigned char *B, int ncols, int nrows, unsigned long in_buffer);

//Read output data from AXI data stream
void copy_dev2mem(unsigned char *R, unsigned char *G, unsigned char *B, int ncols, int nrows, unsigned long out_buffer);



#endif //BASE_H
