cmake_minimum_required(VERSION 4.0)
project(vncpasswdcrack)

option(WARNINGS "Switch on extra warnings" OFF)

include(GNUInstallDirs)

if(WARNINGS)
  set(WARNINGS_CXX_FLAGS
    -pedantic -Wall -Wextra -Wno-c++0x-compat -Wnon-virtual-dtor -Weffc++
    -Wconversion -Werror -Wshadow -Wcast-qual -Winit-self -Wno-unused-parameter)
endif()

include_directories(src/)

add_library(d3des src/rfb/d3des.c)

add_executable(vncpasswdcrack src/main.cpp)
target_compile_options(vncpasswdcrack PRIVATE -std=c++11 ${WARNINGS_CXX_FLAGS})
target_include_directories(vncpasswdcrack PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(vncpasswdcrack d3des)

install(TARGETS vncpasswdcrack
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

# EOF #
