include(FindPackageHandleStandardArgs)

find_path(HTTP_PARSER_INCLUDE_DIR "http_parser.h")

find_library(HTTP_PARSER_LIBRARY NAMES http_parser)

find_package_handle_standard_args(HttpParser
  FOUND_VAR
    HTTPPARSER_FOUND
  REQUIRED_VARS
    HTTPPARSER_LIBRARY
    HTTPPARSER_INCLUDE_DIR
)

set(HTTPPARSER_INCLUDE_DIRS "${HTTP_PARSER_INCLUDE_DIR}")

set(HTTPPARSER_LIBRARIES "${HTTP_PARSER_LIBRARY}")
