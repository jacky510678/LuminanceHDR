# Holds al the file that will be translated
SET(FILES_TO_TRANSLATE )

SET(LUMINANCE_MODULES_CLI )
SET(LUMINANCE_MODULES_GUI )

IF(APPLE)
SET(I18NDIR QCoreApplication::applicationDirPath\(\)+"/../Resources/i18n")
#ADD_DEFINITIONS(-DI18NDIR=QCoreApplication::applicationDirPath\(\)+"/../Resources/i18n")
ELSEIF(UNIX)
#ADD_DEFINITIONS(-DPREFIX=${CMAKE_INSTALL_PREFIX})
#ADD_DEFINITIONS(-DI18NDIR="${CMAKE_INSTALL_PREFIX}/share/luminance-hdr/i18n")
SET(I18NDIR "\"${CMAKE_INSTALL_PREFIX}/share/luminance-hdr/i18n\"")
SET(HELPDIR "\"${CMAKE_INSTALL_PREFIX}/share/luminance-hdr/help\"")
ELSEIF(WIN32)
#ADD_DEFINITIONS(-DI18NDIR=QCoreApplication::applicationDirPath\(\)+"/i18n")
SET(I18NDIR QCoreApplication::applicationDirPath\(\)+"/i18n")
ENDIF()

IF(UNIX)
ADD_DEFINITIONS(-Wall -Wno-unknown-pragmas)
ENDIF()

OPTION(UPDATE_TRANSLATIONS "Update source translation translations/*.ts files (WARNING: make clean will delete the source .ts files! Danger!)")
OPTION(LUPDATE_NOOBSOLETE "While doing an lupdate, remove obsolete entries.")

IF(NOT CMAKE_BUILD_TYPE)
SET(CMAKE_BUILD_TYPE "RelWithDebInfo" )
ENDIF()

# MESSAGE(${CMAKE_BUILD_TYPE})

IF(${CMAKE_BUILD_TYPE} STREQUAL "Release" OR ${CMAKE_BUILD_TYPE} STREQUAL "MinSizeRel")
ADD_DEFINITIONS("-DQT_NO_DEBUG_OUTPUT")
ENDIF()