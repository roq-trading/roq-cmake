find_path(BROTLI_INCLUDE_DIR brotli/encode.h)

find_library(BROTLI_ENC_LIB NAMES brotlienc)
find_library(BROTLI_DEC_LIB NAMES brotlidec)

if (BROTLI_ENC_LIB AND BROTLI_DEC_LIB AND BROTLI_INCLUDE_DIR)
  set(Brotli_FOUND TRUE)
  set(BROTLI_LIBS ${BROTLI_ENC_LIB} ${BROTLI_DEC_LIB})
else ()
  set(Brotli_FOUND FALSE)
endif ()

if (Brotli_FOUND)
  if (NOT Brotli_FIND_QUIETLY)
    message(STATUS "Found brotli: ${BROTLI_LIBS}")
  endif ()
else ()
  if (Brotli_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find brotli.")
  endif ()
  message(STATUS "brotli NOT found.")
endif ()

mark_as_advanced(
  BROTLI_LIBS
  BROTLI_INCLUDE_DIR
)
