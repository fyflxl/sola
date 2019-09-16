/*
 * Empty C++ Application
 */
#include "axilite_hw.h"

//int main()
//{
//	int x;
//	for(x=0; x<16; x++)
//	{
//		AXILITE_HW(x);
//	}
//	return 0;
//}

double what_time_is_it_now()
{
    struct timeval time;
    if (gettimeofday(&time,NULL)){
        return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * .000001;
}

//int main(int argc, char *argv[])
//{
//	unsigned long int PhysicalAddress = AXILITE_BASEADDR;
//	int map_len = 0x20;
//	int fd = open("/dev/mem", O_RDWR);
//
//	unsigned char *xbase_address;
//	xbase_address = (unsigned char *)mmap(NULL, map_len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, (off_t)PhysicalAddress);
//	if(xbase_address == MAP_FAILED)
//	{
//		perror("Sobel Init Mapping memory for absolute memory access failed.\n");
//		return -1;
//	}
//
//	int RWTimes = 100000;
//	double time1,time2;
//	int x;
//
//	if(argc>1)
//	{
//		RWTimes = atoi(argv[1]);
//	}
//
//	time1 = what_time_is_it_now();
//	for(x=0; x<RWTimes; x++)
//	{
//		WriteReg(xbase_address, AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET, x);
//		ReadReg(xbase_address, AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET);
//	}
//	time2 = what_time_is_it_now();
//	printf("Read and write %d times in %f seconds.\n",RWTimes, time2 - time1);
//	printf("Read and write once in %.5f us.\n",(time2 - time1)*1000000/RWTimes);
//
//	munmap((void *)xbase_address, map_len);
//	close(fd);
//	return 0;
//}

int main(int argc, char *argv[])
{

	int fd = open("/dev/axilitem", O_RDWR);
    if(fd < 0)
    {
    	printf("fd = %d open fialed!\n", fd);
    }

	int RWTimes = 100000;
	double time1,time2;
	int x;
	int y;

	if(argc>1)
	{
		RWTimes = atoi(argv[1]);
	}

	time1 = what_time_is_it_now();
	for(x=0; x<RWTimes; x++)
	{
    	write(fd, &x, 4);
    	read(fd, &y, 4);
//    	printf("Write x = %d;Read y=%d\n",x,y);
//		WriteReg(xbase_address, AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET, x);
//		ReadReg(xbase_address, AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET);
	}
	time2 = what_time_is_it_now();
	printf("Read and write %d times in %f seconds.\n",RWTimes, time2 - time1);
	printf("Read and write once in %.5f us.\n",(time2 - time1)*1000000/RWTimes);

	close(fd);
	return 0;
}
