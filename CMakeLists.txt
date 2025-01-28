cmake_minimum_required(VERSION 3.15)
project(App)

find_package(fmt REQUIRED)

add_executable(app main.cpp)
target_link_libraries(app PRIVATE fmt::fmt)