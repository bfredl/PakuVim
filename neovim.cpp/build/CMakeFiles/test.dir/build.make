# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kouga/Documents/cpp/PakuVim/neovim.cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kouga/Documents/cpp/PakuVim/neovim.cpp/build

# Include any dependencies generated for this target.
include CMakeFiles/test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test.dir/flags.make

CMakeFiles/test.dir/src/main.o: CMakeFiles/test.dir/flags.make
CMakeFiles/test.dir/src/main.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kouga/Documents/cpp/PakuVim/neovim.cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test.dir/src/main.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test.dir/src/main.o -c /home/kouga/Documents/cpp/PakuVim/neovim.cpp/src/main.cpp

CMakeFiles/test.dir/src/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.dir/src/main.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kouga/Documents/cpp/PakuVim/neovim.cpp/src/main.cpp > CMakeFiles/test.dir/src/main.i

CMakeFiles/test.dir/src/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.dir/src/main.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kouga/Documents/cpp/PakuVim/neovim.cpp/src/main.cpp -o CMakeFiles/test.dir/src/main.s

CMakeFiles/test.dir/src/main.o.requires:

.PHONY : CMakeFiles/test.dir/src/main.o.requires

CMakeFiles/test.dir/src/main.o.provides: CMakeFiles/test.dir/src/main.o.requires
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/src/main.o.provides.build
.PHONY : CMakeFiles/test.dir/src/main.o.provides

CMakeFiles/test.dir/src/main.o.provides.build: CMakeFiles/test.dir/src/main.o


# Object files for target test
test_OBJECTS = \
"CMakeFiles/test.dir/src/main.o"

# External object files for target test
test_EXTERNAL_OBJECTS =

test: CMakeFiles/test.dir/src/main.o
test: CMakeFiles/test.dir/build.make
test: libnvim_client.so
test: /usr/lib/x86_64-linux-gnu/libboost_system.so
test: /usr/lib/x86_64-linux-gnu/libboost_coroutine.so
test: /usr/lib/x86_64-linux-gnu/libboost_context.so
test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
test: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
test: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
test: /usr/lib/x86_64-linux-gnu/libpthread.so
test: CMakeFiles/test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kouga/Documents/cpp/PakuVim/neovim.cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test.dir/build: test

.PHONY : CMakeFiles/test.dir/build

CMakeFiles/test.dir/requires: CMakeFiles/test.dir/src/main.o.requires

.PHONY : CMakeFiles/test.dir/requires

CMakeFiles/test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test.dir/clean

CMakeFiles/test.dir/depend:
	cd /home/kouga/Documents/cpp/PakuVim/neovim.cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kouga/Documents/cpp/PakuVim/neovim.cpp /home/kouga/Documents/cpp/PakuVim/neovim.cpp /home/kouga/Documents/cpp/PakuVim/neovim.cpp/build /home/kouga/Documents/cpp/PakuVim/neovim.cpp/build /home/kouga/Documents/cpp/PakuVim/neovim.cpp/build/CMakeFiles/test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test.dir/depend
