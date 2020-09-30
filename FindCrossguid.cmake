include(FindPackageHandleStandardArgs)

find_path(CROSSGUID_INCLUDE_DIR "crossguid/guid.hpp")

find_library(CROSSGUID_LIBRARY NAMES crossguid)

find_package_handle_standard_args(Crossguid
  FOUND_VAR
    CROSSGUID_FOUND
  REQUIRED_VARS
    CROSSGUID_LIBRARY
    CROSSGUID_INCLUDE_DIR
)

set(CROSSGUID_INCLUDE_DIRS "${CROSSGUID_INCLUDE_DIR}")

set(CROSSGUID_LIBRARIES "${CROSSGUID_LIBRARY}")
