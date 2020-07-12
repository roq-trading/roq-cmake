include(FindPackageHandleStandardArgs)

find_library(RT_LIBRARY NAMES "rt")

find_package_handle_standard_args(RT
  FOUND_VAR
    RT_FOUND
  REQUIRED_VARS
    RT_LIBRARY
)

set(RT_LIBRARIES "${RT_LIBRARY}")
