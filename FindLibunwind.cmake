include(FindPackageHandleStandardArgs)

find_path(LIBUNWIND_INCLUDE_DIR "libunwind.h")

find_library(LIBUNWIND_LIBRARY NAMES unwind)

find_package_handle_standard_args(Libunwind
  FOUND_VAR
    LIBUNWIND_FOUND
  REQUIRED_VARS
    LIBUNWIND_LIBRARY
    LIBUNWIND_INCLUDE_DIR
)

set(LIBUNWIND_INCLUDE_DIRS "${LIBUNWIND_INCLUDE_DIR}")

set(LIBUNWIND_LIBRARIES "${LIBUNWIND_LIBRARY}")
