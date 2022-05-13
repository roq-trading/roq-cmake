if(DEFINED ENV{GIT_DESCRIBE_HASH})
  set(GIT_DESCRIBE_HASH $ENV{GIT_DESCRIBE_HASH})
else()
  set(GIT_DESCRIBE_HASH "unknown")
endif()

if(NOT DEFINED ENV{GIT_DESCRIBE_TAG})
  find_package(Git REQUIRED)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} describe --tags --always
    OUTPUT_VARIABLE GIT_REPO_VERSION
    RESULT_VARIABLE result)
  if(NOT result EQUAL 0)
    set(GIT_REPO_VERSION "0.0.0")
  endif()
else()
  set(GIT_REPO_VERSION $ENV{GIT_DESCRIBE_TAG})
endif()

if(DEFINED ENV{GIT_DESCRIBE_NUMBER})
  set(GIT_DESCRIBE_NUMBER $ENV{GIT_DESCRIBE_NUMBER})
else()
  set(GIT_DESCRIBE_NUMBER "unknown")
endif()

string(REGEX
  MATCH "^([0-9]+)\\.([0-9]+)\\.([0-9]+)"
  GIT_REPO_VERSION
  ${GIT_REPO_VERSION})

string(REPLACE "." ";" VERSION_LIST ${GIT_REPO_VERSION})

list(GET VERSION_LIST 0 GIT_REPO_VERSION_MAJOR)
list(GET VERSION_LIST 1 GIT_REPO_VERSION_MINOR)
list(GET VERSION_LIST 2 GIT_REPO_VERSION_PATCH)

# note! making sure there's no end of line or other left-over artifacts
set(GIT_REPO_VERSION
  "${GIT_REPO_VERSION_MAJOR}.${GIT_REPO_VERSION_MINOR}.${GIT_REPO_VERSION_PATCH}")

# COMPATIBILITY
set(ROQ_VERSION "${GIT_REPO_VERSION}")
set(ROQ_VERSION_MAJOR "${GIT_REPO_VERSION_MAJOR}")
set(ROQ_VERSION_MINOR "${GIT_REPO_VERSION_MINOR}")
set(ROQ_VERSION_PATCH "${GIT_REPO_VERSION_PATCH}")

# note! for now using environment variable (should really use cmake_build_type)

if(DEFINED ENV{ROQ_BUILD_TYPE})
  set(ROQ_BUILD_TYPE $ENV{ROQ_BUILD_TYPE})
else()
  set(ROQ_BUILD_TYPE "unknown")
endif()

if(DEFINED ENV{HOST})
  set(ROQ_HOST $ENV{HOST})
else()
  set(ROQ_HOST "unknown")
endif()
