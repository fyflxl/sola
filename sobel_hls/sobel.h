

#ifndef _IMAGE_DEMO_H_
#define _IMAGE_DEMO_H_
//#include "ap_axi_sdata.h"
//#include "ap_interfaces.h"
#include "ap_bmp.h"
//#include "ap_video.h"
#include <stdio.h>
#include <stdlib.h>
#include <ap_int.h>
#include "hls_stream.h"


#define MAX_WIDTH 1920
#define MAX_HEIGHT 1080


// I/O Image Settings
#define INPUT_IMAGE_BASE "test_1080p"
#define OUTPUT_IMAGE_BASE "result_1080p"

#define ABSDIFF(x,y)	((x>y)? x - y : y - x)
#define ABS(x)          ((x>0)? x : -x)

template<int D,int U,int TI,int TD>
struct ap_axiu{
	ap_uint<D> data;
//	ap_uint<(D+7)/8> strb;
//	ap_uint<U> user;
//	ap_uint<1> last;
	//    ap_uint<TI> tid;
//	ap_uint<TD> tdest;
};

typedef ap_uint<32> AXIS;

void sobel_filter(hls::stream<AXIS> &inter_pix,hls::stream<AXIS> &out_pix, int rows, int cols);


#endif
