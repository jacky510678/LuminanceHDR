SET(FILES_UI
${CMAKE_CURRENT_SOURCE_DIR}/TransplantExifDialog.ui)
SET(FILES_H
${CMAKE_CURRENT_SOURCE_DIR}/TransplantExifDialog.h)
SET(FILES_CPP
${CMAKE_CURRENT_SOURCE_DIR}/TransplantExifDialog.cpp)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

QT5_WRAP_CPP(FILES_MOC ${FILES_H})
QT5_WRAP_UI(FILES_UI_H ${FILES_UI})

ADD_LIBRARY(transplantexif ${FILES_H} ${FILES_CPP} ${FILES_MOC} ${FILES_UI_H})
qt5_use_modules(transplantexif Core Gui Widgets)

SET(FILES_TO_TRANSLATE ${FILES_TO_TRANSLATE} ${FILES_CPP} ${FILES_H} ${FILES_UI} PARENT_SCOPE)
SET(LUMINANCE_MODULES_GUI ${LUMINANCE_MODULES_GUI} transplantexif PARENT_SCOPE)
