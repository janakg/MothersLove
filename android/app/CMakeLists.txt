cmake_minimum_required(VERSION 3.4.1)

file(GLOB motherslove_sources
    ../../deps/support-lib/jni/*.cpp
    ../../generated-src/jni/*.cpp
    ../../src/cpp/*.cpp
)


# include directories for header files
include_directories(
    ../../deps/support-lib/
    ../../deps/support-lib/jni/
    ../../generated-src/cpp/
    ../../generated-src/jni/
    ../../src/cpp/
    ../../deps/opencv/sdk/native/jni/include
)

add_library(lib-opencv-core SHARED IMPORTED)
set_target_properties(lib-opencv-core PROPERTIES IMPORTED_LOCATION
                      ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_core.so)

add_library(lib-opencv-imgproc STATIC IMPORTED)
set_target_properties(lib-opencv-imgproc PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_imgproc.so)

add_library(lib-opencv-ml STATIC IMPORTED)
set_target_properties(lib-opencv-ml PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_ml.so)

add_library(lib-opencv-imgcodecs STATIC IMPORTED)
set_target_properties(lib-opencv-imgcodecs PROPERTIES IMPORTED_LOCATION
                      ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_imgcodecs.so)

add_library(lib-opencv-tbb STATIC IMPORTED)
set_target_properties(lib-opencv-tbb PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libtbb.so)


add_library(motherslove SHARED ${motherslove_sources})

set(CMAKE_VERBOSE_MAKEFILE on)

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log )

target_link_libraries( # Specifies the target library.
        motherslove

        # OpenCV lib
        lib-opencv-core
        lib-opencv-imgcodecs
        lib-opencv-imgproc
        lib-opencv-ml
        lib-opencv-tbb

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib} )