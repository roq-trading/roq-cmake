include(FindPackageHandleStandardArgs)

find_path(LZ4_INCLUDE_DIR "lz4.h")

find_library(LZ4_LIBRARY NAMES lz4)

find_package_handle_standard_args(Lz4
  FOUND_VAR
    LZ4_FOUND
  REQUIRED_VARS
    LZ4_LIBRARY
    LZ4_INCLUDE_DIR
)

set(LZ4_INCLUDE_DIRS "${LZ4_INCLUDE_DIR}")

set(LZ4_LIBRARIES
  "${LZ4_LIBRARY}"
  "${LZ4_OPENSSL_LIBRARY}")
