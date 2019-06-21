find_path(HTTP_PARSER_INCLUDE_DIR http_parser.h)
find_library(HTTP_PARSER_LIBS NAMES http_parser)

if (HTTP_PARSER_LIBS AND HTTP_PARSER_INCLUDE_DIR)
  set(HTTPParser_FOUND TRUE)
  set(HTTP_PARSER_LIBS ${HTTP_PARSER_LIBS})
else ()
  set(HTTPParser_FOUND FALSE)
endif ()

if (HTTPParser_FOUND)
  if (NOT HTTPParser_FIND_QUIETLY)
    message(STATUS "Found http-parser: ${HTTP_PARSER_LIBS}")
  endif ()
else ()
  if (HTTPParser_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find http-parser.")
  endif ()
  message(STATUS "http-parser NOT found.")
endif ()

mark_as_advanced(
  HTTP_PARSER_LIBS
  HTTP_PARSER_INCLUDE_DIR
)
