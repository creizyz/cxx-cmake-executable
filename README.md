# cxx-cmake-project

Basic C++ CMAKE project settings to make starting projects easier !

## Project structure

```
.
├── cmake
│   ├── modules ........... cmake additionnal modules
│   └── settings .......... settings of the project
├── docs .................. documentation directory
├── external .............. portable external dependencies
├── include ............... headers directory
├── src ................... sources directory
│   ├── main.cpp .......... (default) entry point
│   └── version.hpp.in .... version header
├── tests ................. test folder
├── CMakeLists.txt ........ ///
├── README.md ............. ///
└── README.template.md .... template README for new projects
```

## How to build the project

To configure the project in a ```build``` directory, run :
```bash
mkdir build && cd build
cmake .. -G <GENERATOR> -DCMAKE_BUILD_TYPE=<Release | Debug>
```
Then to build and install the project, run :
```bash
cmake --build . --target install
```

Examples of ***generator values*** :
- ```"Unix Makefiles"```
- ```"Visual Studio 16 2019"```
