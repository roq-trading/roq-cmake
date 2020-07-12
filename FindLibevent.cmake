find_path(LIBEVENT_INCLUDE_DIR event2/event.h)

find_library(LIBEVENT_LIB NAMES event)
find_library(LIBEVENT_OPENSSL_LIB NAMES event_openssl)

if (LIBEVENT_LIB AND LIBEVENT_OPENSSL_LIB AND LIBEVENT_INCLUDE_DIR)
  set(Libevent_FOUND TRUE)
  set(LIBEVENT_LIBS ${LIBEVENT_LIB} ${LIBEVENT_OPENSSL_LIB})
else ()
  set(Libevent_FOUND FALSE)
endif ()

if (Libevent_FOUND)
  if (NOT Libevent_FIND_QUIETLY)
    message(STATUS "Found libevent: ${LIBEVENT_LIBS}")
  endif ()
else ()
  if (Libevent_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find libevent.")
  endif ()
  message(STATUS "libevent NOT found.")
endif ()

mark_as_advanced(
  LIBEVENT_LIBS
  LIBEVENT_INCLUDE_DIR
)
