#include <stdio.h>

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void helloCUDA(void) {
    printf("Hello world from GPU, thread %d!\n", threadIdx.x);
}

int main(void) {
    printf("Hello world from CPU!\n");
    helloCUDA<<<1, 16>>>();
    cudaDeviceSynchronize();
    return 0;
}