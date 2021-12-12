include(FindPackageHandleStandardArgs)

find_path(ZLIB_INCLUDE_DIR "zlib.h")

find_library(ZLIB_LIBRARY NAMES z)

find_package_handle_standard_args(zlib
  FOUND_VAR
    ZLIB_FOUND
  REQUIRED_VARS
    ZLIB_LIBRARY
    ZLIB_INCLUDE_DIR
)

set(ZLIB_INCLUDE_DIRS "${ZLIB_INCLUDE_DIR}")

set(ZLIB_LIBRARIES
  "${ZLIB_LIBRARY}"
  "${ZLIB_OPENSSL_LIBRARY}")
