find_path(ROQ_LOGGING_INCLUDE_DIR roq/logging.h)
find_library(ROQ_LOGGING_LIBS NAMES roq-logging)

if (ROQ_LOGGING_LIBS AND ROQ_LOGGING_INCLUDE_DIR)
  set(RoqLogging_FOUND TRUE)
  set(ROQ_LOGGING_LIBS ${ROQ_LIBS})
else ()
  set(RoqLogging_FOUND FALSE)
endif ()

if (RoqLogging_FOUND)
  if (NOT RoqLogging_FIND_QUIETLY)
    message(STATUS "Found roq-logging: ${ROQ_LOGGING_LIBS}")
  endif ()
else ()
  if (Roq_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find roq-logging.")
  endif ()
  message(STATUS "roq-logging NOT found.")
endif ()

mark_as_advanced(
  ROQ_LOGGING_LIBS
  ROQ_LOGGING_INCLUDE_DIR
)
