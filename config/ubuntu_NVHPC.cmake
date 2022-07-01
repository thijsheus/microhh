# Ubuntu 18.04

set(USER_CXX_FLAGS "-std=c++14")
set(USER_CXX_FLAGS_RELEASE "-DNDEBUG -O3 -march=native")
set(USER_CXX_FLAGS_DEBUG "-O0 -g -Wall -Wno-unknown-pragmas")
#set(USER_FC_FLAGS "-fdefault-real-8 -fdefault-double-8 -fPIC -ffixed-line-length-none -fno-range-check")
#set(USER_FC_FLAGS_RELEASE "-DNDEBUG -O3 -march=native")
#set(USER_FC_FLAGS_DEBUG "-O0 -g -Wall -Wno-unknown-pragmas")

set(FFTW_INCLUDE_DIR   "/usr/include")
set(FFTW_LIB_1           "/usr/lib/x86_64-linux-gnu/libfftw3.so")
set(FFTW_LIB_2           "/usr/lib/x86_64-linux-gnu/libfftw3f.so")
set(NETCDF_INCLUDE_DIR "/usr/include")
set(NETCDF_LIB_C       "/usr/lib/x86_64-linux-gnu/libnetcdf.so")
set(NETCDF_LIB_CPP     "/usr/lib/x86_64-linux-gnu/libnetcdf_c++4.so")
set(HDF5_LIB_1         "/usr/lib/x86_64-linux-gnu/libhdf5_serial.so")
set(HDF5_LIB_2         "/usr/lib/x86_64-linux-gnu/libhdf5_serial_hl.so")
set(SZIP_LIB           "")

add_definitions(-DRESTRICTKEYWORD=__restrict__)
if(USECUDA)
  set(CUDA_PROPAGATE_HOST_FLAGS OFF)
  set(CUDALIBS "-rdynamic /opt/nvidia/hpc_sdk/Linux_x86_64//21.3/math_libs/lib64/libcufft.so")
  set(CUDA_INCLUDE_DIR_1 "/opt/nvidia/hpc_sdk/Linux_x86_64/21.3/math_libs/include/")
  set(CUDA_INCLUDE_DIR_2 "/opt/nvidia/hpc_sdk/Linux_x86_64/21.3/cuda/11.2/targets/x86_64-linux/include/")
  #set(CUDALIBS "-rdynamic /usr/local/nvidia/Linux_x86_64//21.2/math_libs/11.2/targets/x86_64-linux/lib/libcufft.so")
  #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mp")
  set(USER_CUDA_NVCC_FLAGS "-arch=sm_70")
  list(APPEND CUDA_NVCC_FLAGS "-std=c++14")
  if(CMAKE_BUILD_TYPE=DEBUG)
    list(APPEND CUDA_NVCC_FLAGS "-G")
  else()

  endif()
endif()
if(USEMPI)
  set(ENV{CC}  mpicc ) # C compiler for parallel build
  set(ENV{CXX} mpicxx) # C++ compiler for parallel build
else()
  set(ENV{CC}  nvc) # C compiler for serial build
  set(ENV{CXX} nvc++) # C++ compiler for serial build
endif()

#set(LIBS ${CUDALIBS} ${FFTW_LIB_1} ${FFTW_LIB_2} ${NETCDF_LIB_CPP} ${NETCDF_LIB_C} ${HDF5_LIB_2} ${HDF5_LIB_1} ${SZIP_LIB} m z curl)
#set(INCLUDE_DIRS "opt/nvidia/hpc_sdk/Linux_x86_64/21.3/math_libs/include/" ${FFTW_INCLUDE_DIR} ${NETCDF_INCLUDE_DIR})
set(LIBS ${CUDALIBS} ${FFTW_LIB_1} ${FFTW_LIB_2} ${NETCDF_LIB_CPP} ${NETCDF_LIB_C} ${HDF5_LIB_2} ${HDF5_LIB_1} ${SZIP_LIB} m z curl)
set(INCLUDE_DIRS ${FFTW_INCLUDE_DIR} ${NETCDF_INCLUDE_DIR} ${CUDA_INCLUDE_DIR_1} ${CUDA_INCLUDE_DIR_2})