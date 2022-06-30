include(FindPackageHandleStandardArgs)

find_path(MARIADB_INCLUDE_DIR "mariadb/mysql.h")

find_library(MARIADB_LIBRARY NAMES mariadbclient PATH_SUFFIXES mariadb)

find_package_handle_standard_args(Mariadb
  FOUND_VAR
    MARIADB_FOUND
  REQUIRED_VARS
    MARIADB_LIBRARY
    MARIADB_INCLUDE_DIR
)

set(MARIADB_INCLUDE_DIRS "${MARIADB_INCLUDE_DIR}")

set(MARIADB_LIBRARIES "${MARIADB_LIBRARY}")
