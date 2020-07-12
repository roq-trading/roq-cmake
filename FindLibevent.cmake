include(FindPackageHandleStandardArgs)

find_path(LIBEVENT_INCLUDE_DIR "event2/event.h")

find_library(LIBEVENT_LIBRARY NAMES event)
find_library(LIBEVENT_OPENSSL_LIBRARY NAMES event_openssl)

find_package_handle_standard_args(LIBEVENT
  FOUND_VAR
    LIBEVENT_FOUND
  REQUIRED_VARS
    LIBEVENT_LIBRARY
    LIBEVENT_OPENSSL_LIBRARY
    LIBEVENT_INCLUDE_DIR
)

set(LIBEVENT_INCLUDE_DIRS "${LIBEVENT_INCLUDE_DIR}")

set(LIBEVENT_LIBRARIES
  "${LIBEVENT_LIBRARY}"
  "${LIBEVENT_OPENSSL_LIBRARY}")
