project(StarEngine)
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
ENABLE_TESTING()

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
message(FATAL_ERROR "CMake generation is not allowed within the source directory! 
Remove the CMakeCache.txt file and try again from another folder, e.g.: 

   rm CMakeCache.txt 
   cd ..
   mkdir cmake-make 
   cd cmake-make
   cmake -G \"Unix Makefiles\" ../starmath
")
endif(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})

if(WIN32)
  set(D3D10_LIB d3d10 dxgi)
  include_directories($ENV{DXSDK_DIR}/Include)
  link_directories($ENV{DXSDK_DIR}/Lib)

  add_definitions(/DNOMINMAX)
  #set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /subsystem:windows")
endif(WIN32)

include(FindDoxygen)

set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/lib)

include_directories(starmath/include starutils/include starinput/include
                    stargraphics/include)

if(CMAKE_COMPILER_IS_GNUCXX)
  add_definitions(-Wall)
endif(CMAKE_COMPILER_IS_GNUCXX)

find_package(SDL REQUIRED)

add_subdirectory(starmath)
add_subdirectory(starinput)
add_subdirectory(stargraphics)
add_subdirectory(starutils)

#if (DOXYGEN_FOUND)
#  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
#  add_custom_target(doc ${DOXYGEN_EXECUTABLE} ${DOXY_CONFIG})
#endif(DOXYGEN_FOUND)
