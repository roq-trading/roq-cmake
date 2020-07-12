find_library(RT_LIB NAMES rt)

if (RT_LIB)
  set(rt_FOUND TRUE)
  set(RT_LIBS ${RT_LIB})
else ()
  set(rt_FOUND FALSE)
endif ()

if (rt_FOUND)
  if (NOT rt_FIND_QUIETLY)
    message(STATUS "Found rt: ${RT_LIBS}")
  endif ()
else ()
  if (rt_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find rt.")
  endif ()
  message(STATUS "rt NOT found.")
endif ()

mark_as_advanced(
  RT_LIBS
)
