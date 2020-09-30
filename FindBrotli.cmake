include(FindPackageHandleStandardArgs)

find_path(BROTLI_INCLUDE_DIR "brotli/decode.h")

find_library(BROTLI_COMMON_LIBRARY NAMES brotlicommon)
find_library(BROTLI_DEC_LIBRARY NAMES brotlidec)
find_library(BROTLI_ENC_LIBRARY NAMES brotlienc)

find_package_handle_standard_args(Brotli
  FOUND_VAR
    BROTLI_FOUND
  REQUIRED_VARS
    BROTLI_DEC_LIBRARY
    BROTLI_ENC_LIBRARY
    BROTLI_COMMON_LIBRARY
    BROTLI_INCLUDE_DIR
)

set(BROTLI_INCLUDE_DIRS "${BROTLI_INCLUDE_DIR}")

set(BROTLI_LIBRARIES
  "${BROTLI_COMMON_LIBRARY}"
  "${BROTLI_DEC_LIBRARY}"
  "${BROTLI_ENC_LIBRARY}")
