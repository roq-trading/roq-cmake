find_path(ROQ_API2_INCLUDE_DIR roq/api.h)
find_library(ROQ_API2_LIBS NAMES roq-api2)

if (ROQ_API2_LIBS AND ROQ_API2_INCLUDE_DIR)
  set(RoqApi2_FOUND TRUE)
  set(ROQ_API2_LIBS ${ROQ_LIBS})
else ()
  set(RoqApi2_FOUND FALSE)
endif ()

if (RoqApi2_FOUND)
  if (NOT RoqApi2_FIND_QUIETLY)
    message(STATUS "Found roq-api2: ${ROQ_API2_LIBS}")
  endif ()
else ()
  if (Roq_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find roq-api2.")
  endif ()
  message(STATUS "roq-api2 NOT found.")
endif ()

mark_as_advanced(
  ROQ_API2_LIBS
  ROQ_API2_INCLUDE_DIR
)
