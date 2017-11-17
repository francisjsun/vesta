# find gbUtils

if(WIN32)
  set(DEFAULT_INSTALL_DIR "C:/Program\ Files\ (x86)/")
else()
  set(DEFAULT_INSTALL_DIR "/usr/local/")
endif()

find_library(gbUtils_lib NAMES gbUtils PATHS ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "gbUtils")
find_library(gbUtils_lib_d NAMES gbUtilsd PATHS ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "gbUtils")

find_path(gbUtils_include_dir NAMES gbUtilsConfig.h PATHS ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "gbUtils")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(gbUtils DEFAULT_MSG gbUtils_lib gbUtils_include_dir)

set(gbUtils_LIBRARIES ${gbUtils_lib})
set(gbUtils_LIBRARIES_d)
if(gbUtils_lib_d)
  set(gbUtils_LIBRARIES_d ${gbUtils_lib_d})
else()
  message(WARNING "gbUtilsd not found")
  set(gbUtils_LIBRARIES_d ${gbUtils_LIBRARIES})
endif()

set(gbUtils_INCLUDE_DIRS ${gbUtils_include_dir})
