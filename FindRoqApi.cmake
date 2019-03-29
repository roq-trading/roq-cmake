find_path(ROQ_API_INCLUDE_DIR roq/api.h)
find_library(ROQ_API_LIBS NAMES roq-api)

if (ROQ_API_LIBS AND ROQ_API_INCLUDE_DIR)
  set(RoqApi_FOUND TRUE)
  set(ROQ_API_LIBS ${ROQ_LIBS})
else ()
  set(RoqApi_FOUND FALSE)
endif ()

if (RoqApi_FOUND)
  if (NOT RoqApi_FIND_QUIETLY)
    message(STATUS "Found roq-api: ${ROQ_API_LIBS}")
  endif ()
else ()
  if (Roq_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find roq-api.")
  endif ()
  message(STATUS "roq-api NOT found.")
endif ()

mark_as_advanced(
  ROQ_API_LIBS
  ROQ_API_INCLUDE_DIR
)
