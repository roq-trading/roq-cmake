find_path(ROQ_CLIENT_INCLUDE_DIR roq/client.h)
find_library(ROQ_CLIENT_LIBS NAMES roq-client)

if (ROQ_CLIENT_LIBS AND ROQ_CLIENT_INCLUDE_DIR)
  set(RoqClient_FOUND TRUE)
  set(ROQ_CLIENT_LIBS ${ROQ_CLIENT_LIBS})
else ()
  set(RoqClient_FOUND FALSE)
endif ()

if (RoqClient_FOUND)
  if (NOT RoqClient_FIND_QUIETLY)
    message(STATUS "Found roq-client: ${ROQ_CLIENT_LIBS}")
  endif ()
else ()
  if (Roq_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find roq-client.")
  endif ()
  message(STATUS "roq-client NOT found.")
endif ()

mark_as_advanced(
  ROQ_CLIENT_LIBS
  ROQ_CLIENT_INCLUDE_DIR
)
