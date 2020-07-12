include(FindPackageHandleStandardArgs)

find_library(FS_LIBRARY NAMES "stdc++fs")

find_package_handle_standard_args(FS
  FOUND_VAR
    FS_FOUND
  REQUIRED_VARS
    FS_LIBRARY
)

set(FS_LIBRARIES "${FS_LIBRARY}")
