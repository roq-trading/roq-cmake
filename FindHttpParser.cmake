find_path(HTTP_PARSER_INCLUDE_DIR http_parser.h)
find_library(HTTP_PARSER_LIBS NAMES http_parser)

if (HTTP_PARSER_LIBS AND HTTP_PARSER_INCLUDE_DIR)
  set(HttpParser_FOUND TRUE)
  set(HTTP_PARSER_LIBS ${HTTP_PARSER_LIBS})
else ()
  set(HttpParser_FOUND FALSE)
endif ()

if (HttpParser_FOUND)
  if (NOT HttpParser_FIND_QUIETLY)
    message(STATUS "Found http-parser: ${HTTP_PARSER_LIBS}")
  endif ()
else ()
  if (HttpParser_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find http-parser.")
  endif ()
  message(STATUS "http-parser NOT found.")
endif ()

mark_as_advanced(
  HTTP_PARSER_LIBS
  HTTP_PARSER_INCLUDE_DIR
)
