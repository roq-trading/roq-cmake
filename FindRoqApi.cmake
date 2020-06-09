find_path(ROQ_API_INCLUDE_DIR roq/api.h)

if (ROQ_API_INCLUDE_DIR)
  set(RoqApi_FOUND TRUE)
else ()
  set(RoqApi_FOUND FALSE)
endif ()

if (RoqApi_FOUND)
  if (NOT RoqApi_FIND_QUIETLY)
    message(STATUS "Found roq-api.")
  endif ()
else ()
  if (Roq_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find roq-api.")
  endif ()
  message(STATUS "roq-api NOT found.")
endif ()

mark_as_advanced(
  ROQ_API_INCLUDE_DIR
)
