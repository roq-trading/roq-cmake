find_path(BENCHMARK_INCLUDE_DIR benchmark/benchmark.h)
find_library(BENCHMARK_LIBS NAMES benchmark)

if (BENCHMARK_LIBS AND BENCHMARK_INCLUDE_DIR)
  set(Benchmark_FOUND TRUE)
  set(BENCHMARK_LIBS ${BENCHMARK_LIBS})
else ()
  set(Benchmark_FOUND FALSE)
endif ()

if (Benchmark_FOUND)
  if (NOT Benchmark_FIND_QUIETLY)
    message(STATUS "Found benchmark: ${BENCHMARK_LIBS}")
  endif ()
else ()
  if (Benchmark_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find benchmark.")
  endif ()
  message(STATUS "benchmark NOT found.")
endif ()

mark_as_advanced(
  BENCHMARK_LIBS
  BENCHMARK_INCLUDE_DIR
)
