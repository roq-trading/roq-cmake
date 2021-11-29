include(FindPackageHandleStandardArgs)

find_path(LIBSODIUM_INCLUDE_DIR "sodium/core.h")

find_library(LIBSODIUM_LIBRARY NAMES sodium)

find_package_handle_standard_args(Libsodium
  FOUND_VAR
    LIBSODIUM_FOUND
  REQUIRED_VARS
    LIBSODIUM_LIBRARY
    LIBSODIUM_INCLUDE_DIR
)

set(LIBSODIUM_INCLUDE_DIRS "${LIBSODIUM_INCLUDE_DIR}")

set(LIBSODIUM_LIBRARIES "${LIBSODIUM_LIBRARY}")
