include(FindPackageHandleStandardArgs)

find_library(UUID_LIBRARY NAMES "uuid")

find_package_handle_standard_args(UUID
  FOUND_VAR
    UUID_FOUND
  REQUIRED_VARS
    UUID_LIBRARY
)

set(UUID_LIBRARIES "${UUID_LIBRARY}")
