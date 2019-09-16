/*********************************** Header Section *****************************************
--
-- NAME       : Yu Jin
-- Date       : Aug, 2014
-- E-mail     : yj3119@sina.com
-- Address    : Department of Electrical Engineering, Jiangnan University

-- Filename   : base.c
-- Description: ARM and FPGA Share Data Function
--
*********************************** End Header Section***************************************/  
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <linux/fb.h>
#include <string.h>

#include "base.h"


//Write input data to AXI data stream
void copy_mem2dev(unsigned char *R, unsigned char *G, unsigned char *B, int ncols, int nrows, unsigned long in_buffer)
{
	int i, j;
	int index;
	int count = 0;
    unsigned long int map_len = ncols * nrows * 4;

	int fd = open("/dev/mem", O_RDWR);

	unsigned char *virtual_addr_in;
	virtual_addr_in = (unsigned char *)mmap(NULL, map_len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, (off_t)in_buffer);
	if(virtual_addr_in == MAP_FAILED)
	{
		perror("Virtual_addr_in mappong for absolute memory access failed!\n");
		return;
	}

	for(i = 0; i < nrows; i++)
	{
		for(j = 0; j < ncols; j++)
		{
			index = i * ncols + j;
			//the position of RGB is not sure
			REG_CHWRITE(virtual_addr_in, count, B[index]);
			REG_CHWRITE(virtual_addr_in, count + 1, G[index]);
			REG_CHWRITE(virtual_addr_in, count + 2, R[index]);
   
			//virtual_addr_in[count] = B[index];
			//virtual_addr_in[count + 1] = G[index];
			//virtual_addr_in[count + 1] = R[index];
			count += 4;
		}
	}

	munmap((void *)virtual_addr_in, map_len);
	close(fd);
}

//Read output data from AXI data stream
void copy_dev2mem(unsigned char *R, unsigned char *G, unsigned char *B, int ncols, int nrows, unsigned long out_buffer)
{
	int i, j;
	int count = 0;
	int index;
	unsigned long int map_len = ncols * nrows * 4;

	int fd = open("/dev/mem", O_RDWR);

	unsigned char *virtual_addr_out;
	virtual_addr_out = (unsigned char *)mmap(NULL, map_len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, (off_t)out_buffer);
	if(virtual_addr_out == MAP_FAILED)
	{
		perror("Virtual_addr_in mappong for absolute memory access failed!\n");
		return;
	}

	for(i = 0; i < nrows; i++)
	{
		for(j = 0; j < ncols; j++)
		{
			index = i * ncols + j;
			//the position is not sure about RGB
			B[index] = REG_CHREAD(virtual_addr_out, count);
			G[index] = REG_CHREAD(virtual_addr_out, count + 1);
			R[index] = REG_CHREAD(virtual_addr_out, count + 2);

			count += 4;
		}
	}

	munmap(virtual_addr_out, map_len);
	close(fd);
}



