# find lua
if(WIN32)
  set(DEFAULT_INSTALL_DIR "C:/Program\ Files\ (x86)/")
else()
  set(DEFAULT_INSTALL_DIR "/usr/local/")
endif()

find_library(lua_libs NAMES lua PATHS ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "lua")
find_library(lua_libs_d NAMES luad PATHS ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "lua")

find_path(lua_include_dirs lua.h PATHS ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "lua")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(lua DEFAULT_MSG lua_libs lua_include_dirs)

set(lua_LIBRARIES_d)
if(NOT lua_libs_d)
  set(lua_LIBRARIES_d ${lua_libs})
else()
  set(lua_LIBRARIES_d ${lua_libs_d})
endif()

set(lua_LIBRARIES ${lua_libs})
set(lua_INCLUDE_DIRS ${lua_include_dirs})

