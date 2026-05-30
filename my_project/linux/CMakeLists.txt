cmake_minimum_required(VERSION 3.10)
project(usedev_uninassau_keven LANGUAGES CXX)

set(BINARY_NAME "usedev_uninassau_keven")

cmake_policy(SET CMP0063 NEW)

set(CMAKE_INSTALL_RPATH "$ORIGIN/lib")

# Include the flutter library and tools.
find_package(flutter REQUIRED)

# Executable configuration.
add_executable(${BINARY_NAME}
  "main.cc"
  "my_application.cc"
  "${FLUTTER_MANAGED_SOURCES}"
)
apply_standard_executable_settings(${BINARY_NAME})
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_TARGET_FILE=\"${FLUTTER_TARGET_FILE}\"")
target_link_libraries(${BINARY_NAME} PRIVATE flutter)
target_link_libraries(${BINARY_NAME} PRIVATE flutter_wrapper_app)

# Bundle configuration.
set(BUNDLE_OBJ_NAME "${BINARY_NAME}_bundle")
add_custom_target(${BUNDLE_OBJ_NAME} ALL)
add_dependencies(${BUNDLE_OBJ_NAME} ${BINARY_NAME})

# Install configuration.
set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/bundle")
install(TARGETS ${BINARY_NAME} DESTINATION "${CMAKE_INSTALL_PREFIX}" COMPONENT Runtime)
install(FILES "${FLUTTER_ICU_DATA_FILE}" DESTINATION "${CMAKE_INSTALL_PREFIX}/data" COMPONENT Runtime)
install(FILES "${FLUTTER_LIBRARY}" DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" COMPONENT Runtime)
foreach(resource ${FLUTTER_ASSET_BUNDLES})
  install(DIRECTORY "${resource}" DESTINATION "${CMAKE_INSTALL_PREFIX}/data" COMPONENT Runtime)
endforeach()

if(NOT "${FLUTTER_PLUGINS_LIBRARIES}" STREQUAL "")
  install(FILES ${FLUTTER_PLUGINS_LIBRARIES} DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" COMPONENT Runtime)
endif()
