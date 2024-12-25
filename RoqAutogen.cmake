# what: roq_gitignore

function(roq_gitignore)
  set(options DUMMY_OPTION)
  set(one_value OUTPUT)
  set(multi_value SOURCES)
  cmake_parse_arguments(SELF "${options}" "${one_value}" "${multi_value}" ${ARGN})
  set(gitignore "${CMAKE_CURRENT_SOURCE_DIR}/${SELF_OUTPUT}")
  message(STATUS "gitignore=${gitignore}")
  file(WRITE "${gitignore}" "")
  file(APPEND "${gitignore}" "!!! THIS FILE HAS BEEN AUTO-GENERATED !!!\n")
  foreach(source ${SELF_SOURCES})
    get_filename_component(name ${source} NAME)
    file(APPEND "${gitignore}" "${name}\n")
  endforeach()
endfunction()

# what: roq_autogen_[...]
#
# required variables: ROQ_AUTOGEN CLANG_FORMAT
#
# note! cmake doesn't allow argument forwarding => lots of duplication in the following

function(roq_autogen_hpp)
  set(SELF_LANGUAGE "cpp")
  set(SELF_FILE_TYPE "hpp")
  set(options DUMMY_OPTION)
  set(one_value OUTPUT NAMESPACE SCHEMA_DIR SCHEMA_LINK_DIR TEMPLATE_DIR TEMPLATE_TYPE)
  set(multi_value SOURCES DEPENDS)
  cmake_parse_arguments(SELF "${options}" "${one_value}" "${multi_value}" ${ARGN})
  if(NOT DEFINED SELF_SCHEMA_DIR)
    if(DEFINED ENV{CONDA_PREFIX})
      set(SELF_SCHEMA_DIR $ENV{CONDA_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    else()
      set(SELF_SCHEMA_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    endif()
  endif()
  unset(result)
  foreach(filename ${SELF_SOURCES})
    get_filename_component(dir ${filename} DIRECTORY)
    get_filename_component(name ${filename} NAME_WE)
    if(DEFINED SELF_SCHEMA_LINK_DIR)
      set(path "${SELF_SCHEMA_LINK_DIR}/${SELF_NAMESPACE}/${filename}")
    else()
      set(path "${filename}")
    endif()
    set(target "${CMAKE_CURRENT_BINARY_DIR}/${dir}/${name}.${SELF_FILE_TYPE}")
    if(DEFINED SELF_SCHEMA_DIR)
      set_property(
        DIRECTORY
        APPEND
        PROPERTY CMAKE_CONFIGURE_DEPENDS ${path})
    endif()
    set(depends ${ROQ_AUTOGEN})
    if(SELF_DEPENDS)
      list(APPEND depends ${SELF_DEPENDS})
    endif(SELF_DEPENDS)
    add_custom_command(
      OUTPUT ${target}
      COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR}
      COMMAND ${ROQ_AUTOGEN} --schema_dir ${SELF_SCHEMA_DIR} --template_dir ${SELF_TEMPLATE_DIR} --input_path ${path}
              --language ${SELF_LANGUAGE} --template_type ${SELF_TEMPLATE_TYPE} --file_type ${SELF_FILE_TYPE} > ${target}
      COMMAND ${CLANG_FORMAT} -i ${target}
      VERBATIM
      DEPENDS ${depends} ${path})
    list(APPEND result "${target}")
  endforeach()
  set(${SELF_OUTPUT}
      ${result}
      PARENT_SCOPE)
endfunction()

function(roq_autogen_cpp)
  set(SELF_LANGUAGE "cpp")
  set(SELF_FILE_TYPE "cpp")
  set(options DUMMY_OPTION)
  set(one_value OUTPUT NAMESPACE SCHEMA_DIR SCHEMA_LINK_DIR TEMPLATE_DIR TEMPLATE_TYPE)
  set(multi_value SOURCES DEPENDS)
  cmake_parse_arguments(SELF "${options}" "${one_value}" "${multi_value}" ${ARGN})
  if(NOT DEFINED SELF_SCHEMA_DIR)
    if(DEFINED ENV{CONDA_PREFIX})
      set(SELF_SCHEMA_DIR $ENV{CONDA_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    else()
      set(SELF_SCHEMA_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    endif()
  endif()
  unset(result)
  foreach(filename ${SELF_SOURCES})
    get_filename_component(dir ${filename} DIRECTORY)
    get_filename_component(name ${filename} NAME_WE)
    if(DEFINED SELF_SCHEMA_LINK_DIR)
      set(path "${SELF_SCHEMA_LINK_DIR}/${SELF_NAMESPACE}/${filename}")
    else()
      set(path "${filename}")
    endif()
    set(target "${CMAKE_CURRENT_BINARY_DIR}/${dir}/${name}.${SELF_FILE_TYPE}")
    if(DEFINED SELF_SCHEMA_DIR)
      set_property(
        DIRECTORY
        APPEND
        PROPERTY CMAKE_CONFIGURE_DEPENDS ${path})
    endif()
    set(depends ${ROQ_AUTOGEN})
    if(SELF_DEPENDS)
      list(APPEND depends ${SELF_DEPENDS})
    endif()
    add_custom_command(
      OUTPUT ${target}
      COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR}
      COMMAND ${ROQ_AUTOGEN} --schema_dir ${SELF_SCHEMA_DIR} --template_dir ${SELF_TEMPLATE_DIR} --input_path ${path}
              --language ${SELF_LANGUAGE} --template_type ${SELF_TEMPLATE_TYPE} --file_type ${SELF_FILE_TYPE} > ${target}
      COMMAND ${CLANG_FORMAT} -i ${target}
      VERBATIM
      DEPENDS ${depends} ${path})
    list(APPEND result "${target}")
  endforeach()
  set(${SELF_OUTPUT}
      ${result}
      PARENT_SCOPE)
endfunction()

function(roq_autogen_java)
  set(SELF_LANGUAGE "java")
  set(SELF_FILE_TYPE "java")
  set(options DUMMY_OPTION)
  set(one_value OUTPUT NAMESPACE SCHEMA_DIR SCHEMA_LINK_DIR TEMPLATE_DIR TEMPLATE_TYPE)
  set(multi_value SOURCES DEPENDS)
  cmake_parse_arguments(SELF "${options}" "${one_value}" "${multi_value}" ${ARGN})
  if(NOT DEFINED SELF_SCHEMA_DIR)
    if(DEFINED ENV{CONDA_PREFIX})
      set(SELF_SCHEMA_DIR $ENV{CONDA_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    else()
      set(SELF_SCHEMA_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    endif()
  endif()
  unset(result)
  foreach(filename ${SELF_SOURCES})
    get_filename_component(dir ${filename} DIRECTORY)
    get_filename_component(name ${filename} NAME_WE)
    if(DEFINED SELF_SCHEMA_LINK_DIR)
      set(path "${SELF_SCHEMA_LINK_DIR}/${SELF_NAMESPACE}/${filename}")
    else()
      set(path "${filename}")
    endif()
    set(target "${CMAKE_CURRENT_BINARY_DIR}/${dir}/${name}.${SELF_FILE_TYPE}")
    if(DEFINED SELF_SCHEMA_DIR)
      set_property(
        DIRECTORY
        APPEND
        PROPERTY CMAKE_CONFIGURE_DEPENDS ${path})
    endif()
    set(depends ${ROQ_AUTOGEN})
    if(SELF_DEPENDS)
      list(APPEND depends ${SELF_DEPENDS})
    endif(SELF_DEPENDS)
    add_custom_command(
      OUTPUT ${target}
      COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR}
      COMMAND ${ROQ_AUTOGEN} --schema_dir ${SELF_SCHEMA_DIR} --template_dir ${SELF_TEMPLATE_DIR} --input_path ${path}
              --language ${SELF_LANGUAGE} --template_type ${SELF_TEMPLATE_TYPE} --file_type ${SELF_FILE_TYPE} > ${target}
      COMMAND ${CLANG_FORMAT} -i ${target}
      VERBATIM
      DEPENDS ${depends} ${path})
    list(APPEND result "${target}")
  endforeach()
  set(${SELF_OUTPUT}
      ${result}
      PARENT_SCOPE)
endfunction()

function(roq_autogen_rst)
  set(SELF_LANGUAGE "cpp")
  set(SELF_FILE_TYPE "rstinc")
  set(options DUMMY_OPTION)
  set(one_value OUTPUT NAMESPACE SCHEMA_DIR SCHEMA_LINK_DIR TEMPLATE_DIR TEMPLATE_TYPE)
  set(multi_value SOURCES DEPENDS)
  cmake_parse_arguments(SELF "${options}" "${one_value}" "${multi_value}" ${ARGN})
  if(NOT DEFINED SELF_SCHEMA_DIR)
    if(DEFINED ENV{CONDA_PREFIX})
      set(SELF_SCHEMA_DIR $ENV{CONDA_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    else()
      set(SELF_SCHEMA_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATADIR}/roq/schema)
    endif()
  endif()
  unset(result)
  foreach(filename ${SELF_SOURCES})
    get_filename_component(dir ${filename} DIRECTORY)
    get_filename_component(name ${filename} NAME_WE)
    if(DEFINED SELF_SCHEMA_LINK_DIR)
      set(path "${SELF_SCHEMA_LINK_DIR}/${SELF_NAMESPACE}/${filename}")
    else()
      set(path "${filename}")
    endif()
    set(target "${CMAKE_CURRENT_BINARY_DIR}/${dir}/${name}.${SELF_FILE_TYPE}")
    if(DEFINED SELF_SCHEMA_DIR)
      set_property(
        DIRECTORY
        APPEND
        PROPERTY CMAKE_CONFIGURE_DEPENDS ${path})
    endif()
    set(depends ${ROQ_AUTOGEN})
    if(SELF_DEPENDS)
      list(APPEND depends ${SELF_DEPENDS})
    endif(SELF_DEPENDS)
    # note! not using clang-format
    add_custom_command(
      OUTPUT ${target}
      COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR}
      COMMAND ${ROQ_AUTOGEN} --schema_dir ${SELF_SCHEMA_DIR} --template_dir ${SELF_TEMPLATE_DIR} --input_path ${path}
              --language ${SELF_LANGUAGE} --template_type ${SELF_TEMPLATE_TYPE} --file_type ${SELF_FILE_TYPE} > ${target}
      VERBATIM
      DEPENDS ${depends} ${path})
    list(APPEND result "${target}")
  endforeach()
  set(${SELF_OUTPUT}
      ${result}
      PARENT_SCOPE)
endfunction()
