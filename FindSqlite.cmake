include(FindPackageHandleStandardArgs)

find_path(SQLITE_INCLUDE_DIR "sqlite3.h")

find_library(SQLITE_LIBRARY NAMES sqlite3)

find_package_handle_standard_args(Sqlite
  FOUND_VAR
    SQLITE_FOUND
  REQUIRED_VARS
    SQLITE_LIBRARY
    SQLITE_INCLUDE_DIR
)

set(SQLITE_INCLUDE_DIRS "${SQLITE_INCLUDE_DIR}")

set(SQLITE_LIBRARIES "${SQLITE_LIBRARY}")
