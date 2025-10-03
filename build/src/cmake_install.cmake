# Install script for directory: /mnt/c/Users/usuario/Downloads/luanti-master/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luanti" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luanti")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luanti"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/bin/luanti")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luanti" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luanti")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luanti")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/mnt/c/Users/usuario/Downloads/luanti-master/bin/minetest")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/bar/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/bar/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/be/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/be/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/bg/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/bg/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/br/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/br/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ca/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ca/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/cs/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/cs/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/cy/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/cy/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/da/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/da/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/de/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/de/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/el/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/el/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/eo/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/eo/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/es/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/es/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/es_US/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/es_US/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/et/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/et/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/eu/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/eu/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/fa/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/fa/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/fi/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/fi/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/fil/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/fil/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/fr/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/fr/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ga/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ga/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/gd/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/gd/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/gl/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/gl/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/hu/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/hu/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/id/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/id/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/it/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/it/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ja/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ja/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/jbo/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/jbo/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/jv/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/jv/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/kab/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/kab/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/kk/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/kk/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ko/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ko/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/kv/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/kv/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ky/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ky/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/lt/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/lt/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/lv/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/lv/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/lzh/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/lzh/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/mi/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/mi/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/mn/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/mn/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/mr/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/mr/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ms/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ms/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/nb/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/nb/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/nl/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/nl/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/nn/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/nn/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/oc/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/oc/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/pl/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/pl/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/pt/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/pt/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/pt_BR/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/pt_BR/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ro/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ro/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ru/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ru/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sk/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sk/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sl/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sl/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sr/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sr/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sr_Cyrl/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sr_Cyrl/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sr_Latn/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sr_Latn/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sv/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sv/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/sw/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/sw/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/ta/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/ta/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/tok/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/tok/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/tr/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/tr/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/tt/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/tt/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/uk/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/uk/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/vi/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/vi/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/zh_CN/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/zh_CN/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/locale/zh_TW/LC_MESSAGES" TYPE FILE FILES "/mnt/c/Users/usuario/Downloads/luanti-master/locale/zh_TW/LC_MESSAGES/luanti.mo")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE DIRECTORY FILES "/mnt/c/Users/usuario/Downloads/luanti-master/src/../fonts" FILES_MATCHING REGEX "/[^/]*\\.ttf$" REGEX "/[^/]*\\.txt$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/threading/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/content/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/database/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/mapgen/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/network/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/script/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/util/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/server/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/unittest/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/client/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/gui/cmake_install.cmake")
  include("/mnt/c/Users/usuario/Downloads/luanti-master/build/src/irrlicht_changes/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/mnt/c/Users/usuario/Downloads/luanti-master/build/src/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
