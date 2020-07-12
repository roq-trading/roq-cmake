include(FindPackageHandleStandardArgs)

find_path(ROQ_CLIENT_INCLUDE_DIR "roq/client.h")

find_library(ROQ_CLIENT_LIBRARY NAMES roq-client)

find_package_handle_standard_args(ROQ_CLIENT
  FOUND_VAR
    ROQ_CLIENT_FOUND
  REQUIRED_VARS
    ROQ_CLIENT_LIBRARY
    ROQ_CLIENT_INCLUDE_DIR
)

set(ROQ_CLIENT_INCLUDE_DIRS "${ROQ_CLIENT_INCLUDE_DIR}")

set(ROQ_CLIENT_LIBRARIES "${ROQ_CLIENT_LIBRARY}")
