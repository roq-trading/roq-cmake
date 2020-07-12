find_library(UUID_LIB NAMES uuid)

if (UUID_LIB)
  set(uuid_FOUND TRUE)
  set(UUID_LIBS ${UUID_LIB})
else ()
  set(uuid_FOUND FALSE)
endif ()

if (uuid_FOUND)
  if (NOT uuid_FIND_QUIETLY)
    message(STATUS "Found uuid: ${UUID_LIBS}")
  endif ()
else ()
  if (uuid_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find uuid.")
  endif ()
  message(STATUS "uuid NOT found.")
endif ()

mark_as_advanced(
  UUID_LIBS
)
