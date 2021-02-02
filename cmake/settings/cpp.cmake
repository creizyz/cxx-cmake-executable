# ================================================================== #
# ================================================== # C++ Standard

target_compile_features(${TARGET_NAME} PUBLIC cxx_std_20)

# ================================================================== #
# ================================================== # CLANG flags
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # target_compile_options(${TARGET_NAME} ... )

  # ...
  # ...
  # ...
# ================================================================== #
# ================================================== # GCC flags
elseif (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  target_compile_options(${TARGET_NAME} PRIVATE -W -Wall -Wextra -Werror -pedantic)
  
  # ...
  # ...
  # ...

# ================================================================== #
# ================================================== # Intel flags
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
  # target_compile_options(${TARGET_NAME} ... )

  # ...
  # ...
  # ...

# ================================================================== #
# ================================================== # GCC flags
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  target_compile_options(${TARGET_NAME} /W4 /WX)
  
  # ...
  # ...
  # ...

endif()
