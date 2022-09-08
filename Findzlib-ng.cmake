include(FindPackageHandleStandardArgs)

find_path(ZLIB-NG_INCLUDE_DIR "zlib-ng.h")

find_library(ZLIB-NG_LIBRARY NAMES z-ng)

find_package_handle_standard_args(zlib-ng
  FOUND_VAR
    ZLIB-NG_FOUND
  REQUIRED_VARS
    ZLIB-NG_LIBRARY
    ZLIB-NG_INCLUDE_DIR
)

set(ZLIB-NG_INCLUDE_DIRS "${ZLIB-NG_INCLUDE_DIR}")

set(ZLIB-NG_LIBRARIES "${ZLIB-NG_LIBRARY}")
