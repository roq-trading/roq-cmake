include(FindPackageHandleStandardArgs)

find_path(HTTP_PARSER_INCLUDE_DIR "http_parser.h")

find_library(HTTP_PARSER_LIBRARY NAMES http_parser)

find_package_handle_standard_args(Http_Parser
  FOUND_VAR
    HTTP_PARSER_FOUND
  REQUIRED_VARS
    HTTP_PARSER_LIBRARY
    HTTP_PARSER_INCLUDE_DIR
)

set(HTTP_PARSER_INCLUDE_DIRS "${HTTP_PARSER_INCLUDE_DIR}")

set(HTTP_PARSER_LIBRARIES "${HTTP_PARSER_LIBRARY}")
