include(FindPackageHandleStandardArgs)

find_library(LIBURING_LIBRARY NAMES "uring")

find_package_handle_standard_args(liburing
  FOUND_VAR
    LIBURING_FOUND
  REQUIRED_VARS
    LIBURING_LIBRARY
)

set(LIBURING_LIBRARIES "${LIBURING_LIBRARY}")
