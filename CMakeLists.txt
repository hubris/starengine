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

include(FindDoxygen)

set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/lib)

include_directories(starmath/include starutils/include starinput/include
                    stargraphics/include)

add_subdirectory(starmath)
add_subdirectory(starinput)

#if (DOXYGEN_FOUND)
#  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
#  add_custom_target(doc ${DOXYGEN_EXECUTABLE} ${DOXY_CONFIG})
#endif(DOXYGEN_FOUND)