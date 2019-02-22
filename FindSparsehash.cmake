find_path(SPARSEHASH_INCLUDE_DIR google/dense_hash_set)

if (SPARSEHASH_INCLUDE_DIR)
  set(Sparsehash_FOUND TRUE)
else ()
  set(Sparsehash_FOUND FALSE)
endif ()

if (Sparsehash_FOUND)
  if (NOT Sparsehash_FIND_QUIETLY)
    message(STATUS "Found sparsehash")
  endif ()
else ()
  if (Sparsehash_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find sparsehash.")
  endif ()
  message(STATUS "sparsehash NOT found.")
endif ()

mark_as_advanced(
  SPARSEHASH_INCLUDE_DIR
)
