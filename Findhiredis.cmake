include(FindPackageHandleStandardArgs)

find_path(HIREDIS_INCLUDE_DIR "hiredis/async.h")

find_library(HIREDIS_LIBRARY NAMES hiredis)

find_package_handle_standard_args(hiredis
  FOUND_VAR
    HIREDIS_FOUND
  REQUIRED_VARS
    HIREDIS_LIBRARY
    HIREDIS_INCLUDE_DIR
)

set(HIREDIS_INCLUDE_DIRS "${HIREDIS_INCLUDE_DIR}")

set(HIREDIS_LIBRARIES "${HIREDIS_LIBRARY}")
