# Cmake Libraries

This repo contains an example of how to create libraries using CMake and export them for use in other projects. 


## Docker Setup

```
git clone ...
docker compose build
docker compose up 
```


## Build `myLib`

From inside the docker
```
cd /root/src/myLib
mkdir build
cd build
cmake ..
make
make install
```

This will build and install the library to `/usr/local/include` and `/usr/local/lib`. It will also copy the `myLibConfig.cmake` file to `/usr/local/share/myLib`, which allows the package to be found.

You can also run the `test/demo.cpp` file:
```
./demo
```


## Using `myLib` in another project

Complete example is in `src/unrelated_project`. 

The key difference is that in the `CMakeLists.txt` you need to add the following:
```
find_package(myLIB REQUIRED)

...

target_link_libraries(<target> ${MYLIB_DIRS})
target_include_directories(<target> PRIVATE ${MYLIB_INCLUDE_DIRS})
```

When doing `find_package` cmake will (by default) look for `.cmake` files in `/usr/local/share`. It will find the file we created. This file will be run, and it will create the variables `MYLIB_DIRS` (which points to `/usr/local/lib/libmyLib.so`) and `MYLIB_INCLUDE_DIRS` (which points to `/usr/local/include/myLib.hpp`). 

This allows the package to be built correctly.  

Finally, just build the `main.cpp`:
```
cd /root/unrelated_project
mkdir build
cd build
cmake ..
make
```

and run it:
```
./main
```

