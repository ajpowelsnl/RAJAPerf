#!/usr/bin/env bash

###############################################################################
# Copyright (c) 2016-20, Lawrence Livermore National Security, LLC
# and RAJA project contributors. See the RAJA/COPYRIGHT file for details.
#
# SPDX-License-Identifier: (BSD-3-Clause)
###############################################################################

BUILD_SUFFIX=lc_blueos-xl_2020.03.18_omptarget
RAJA_HOSTCONFIG=../tpl/RAJA/host-configs/lc-builds/blueos/xl_X.cmake

rm -rf build_${BUILD_SUFFIX} 2>/dev/null
mkdir build_${BUILD_SUFFIX} && cd build_${BUILD_SUFFIX}

module load cmake/3.14.5

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_COMPILER=/usr/tce/packages/xl/xl-2020.03.18/bin/xlc++_r \
  -C ${RAJA_HOSTCONFIG} \
  -DENABLE_OPENMP=On \
  -DENABLE_TARGET_OPENMP=On \
  -DOpenMP_CXX_FLAGS="-qoffload;-qsmp=omp;-qnoeh;-qalias=noansi" \
  -DCMAKE_INSTALL_PREFIX=../install_${BUILD_SUFFIX} \
  "$@" \
  ..
