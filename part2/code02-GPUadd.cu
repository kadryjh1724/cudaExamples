#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void add(int a, int b, int *c) {
    *c = a + b;
}

int main(void) {
    int a, b, c;
    int *d_c;
    printf("Input two integers: ");
    scanf("%d %d", &a, &b);
    // Assign device memory
    cudaMalloc((void**)&d_c, sizeof(int));
    // Kernel call
    add<<<1,1>>>(a, b, d_c);
    // Copy the result
    cudaMemcpy(&c, d_c, sizeof(int), cudaMemcpyDeviceToHost);
    printf("%d + %d = %d\n", a, b, c);
    // Free device memory
    cudaFree(d_c);
    return 0;
}