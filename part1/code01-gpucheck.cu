#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

int main(void) {
    cudaDeviceProp prop;

    // Get total device number
    int count;
    cudaGetDeviceCount(&count);

    for (int i = 0; i < count; i++) {
        cudaGetDeviceProperties(&prop, i);
        printf("===== ===== ===== ===== ===== ===== ===== ===== =====\n");
        printf("----- [Device %02d]       %s\n", i, prop.name);
        printf("Compute capability      : %d.%d\n", prop.major, prop.minor);
        printf("Clock rate              : %d\n", prop.clockRate);
        printf("----- [Device %02d]       Memory information\n", i);
        printf("Total global memory     : %ld MB\n", prop.totalGlobalMem / (1024 * 1024));
        printf("Total const. memory     : %ld KB\n", prop.totalConstMem / 1024);
        printf("L2 Cache size           : %ld KB\n", prop.l2CacheSize / 1024);
        printf("----- [Device %02d]       Multiprocessor information\n", i);
        printf("Multiprocessor count    : %d\n", prop.multiProcessorCount);
        printf("Shared memory per block : %ld KB\n", prop.sharedMemPerBlock / 1024);
        printf("Shared memory per mp    : %ld KB\n", prop.sharedMemPerMultiprocessor / 1024);
        printf("Registers per mp        : %d\n", prop.regsPerBlock);
        printf("Num. of threads in warp : %d\n", prop.warpSize);
        printf("Max threads per block   : %d\n", prop.maxThreadsPerBlock);
        printf("Max thread dim.         : (%ld, %d, %d)\n", prop.maxThreadsDim[0], prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
        printf("Max grid dim.           : (%ld, %d, %d)\n", prop.maxGridSize[0], prop.maxGridSize[1], prop.maxGridSize[2]);
        printf("===== ===== ===== ===== ===== ===== ===== ===== =====\n\n");
    }
    return 0;
}