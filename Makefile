# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jongmin/CLionProjects/webassembly_emcc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jongmin/CLionProjects/webassembly_emcc

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/local/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/local/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/local/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/local/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/local/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/local/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/local/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/local/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components
.PHONY : list_install_components/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles /Users/jongmin/CLionProjects/webassembly_emcc//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named WebCraft

# Build rule for target.
WebCraft: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 WebCraft
.PHONY : WebCraft

# fast build rule for target.
WebCraft/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/build
.PHONY : WebCraft/fast

#=============================================================================
# Target rules for targets named glm_dummy

# Build rule for target.
glm_dummy: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 glm_dummy
.PHONY : glm_dummy

# fast build rule for target.
glm_dummy/fast:
	$(MAKE) $(MAKESILENT) -f lib/glm/glm/CMakeFiles/glm_dummy.dir/build.make lib/glm/glm/CMakeFiles/glm_dummy.dir/build
.PHONY : glm_dummy/fast

src/Camera.o: src/Camera.cpp.o
.PHONY : src/Camera.o

# target to build an object file
src/Camera.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Camera.cpp.o
.PHONY : src/Camera.cpp.o

src/Camera.i: src/Camera.cpp.i
.PHONY : src/Camera.i

# target to preprocess a source file
src/Camera.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Camera.cpp.i
.PHONY : src/Camera.cpp.i

src/Camera.s: src/Camera.cpp.s
.PHONY : src/Camera.s

# target to generate assembly for a file
src/Camera.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Camera.cpp.s
.PHONY : src/Camera.cpp.s

src/Drawable.o: src/Drawable.cpp.o
.PHONY : src/Drawable.o

# target to build an object file
src/Drawable.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Drawable.cpp.o
.PHONY : src/Drawable.cpp.o

src/Drawable.i: src/Drawable.cpp.i
.PHONY : src/Drawable.i

# target to preprocess a source file
src/Drawable.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Drawable.cpp.i
.PHONY : src/Drawable.cpp.i

src/Drawable.s: src/Drawable.cpp.s
.PHONY : src/Drawable.s

# target to generate assembly for a file
src/Drawable.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Drawable.cpp.s
.PHONY : src/Drawable.cpp.s

src/Entity.o: src/Entity.cpp.o
.PHONY : src/Entity.o

# target to build an object file
src/Entity.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Entity.cpp.o
.PHONY : src/Entity.cpp.o

src/Entity.i: src/Entity.cpp.i
.PHONY : src/Entity.i

# target to preprocess a source file
src/Entity.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Entity.cpp.i
.PHONY : src/Entity.cpp.i

src/Entity.s: src/Entity.cpp.s
.PHONY : src/Entity.s

# target to generate assembly for a file
src/Entity.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Entity.cpp.s
.PHONY : src/Entity.cpp.s

src/MyGL.o: src/MyGL.cpp.o
.PHONY : src/MyGL.o

# target to build an object file
src/MyGL.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/MyGL.cpp.o
.PHONY : src/MyGL.cpp.o

src/MyGL.i: src/MyGL.cpp.i
.PHONY : src/MyGL.i

# target to preprocess a source file
src/MyGL.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/MyGL.cpp.i
.PHONY : src/MyGL.cpp.i

src/MyGL.s: src/MyGL.cpp.s
.PHONY : src/MyGL.s

# target to generate assembly for a file
src/MyGL.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/MyGL.cpp.s
.PHONY : src/MyGL.cpp.s

src/Player.o: src/Player.cpp.o
.PHONY : src/Player.o

# target to build an object file
src/Player.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Player.cpp.o
.PHONY : src/Player.cpp.o

src/Player.i: src/Player.cpp.i
.PHONY : src/Player.i

# target to preprocess a source file
src/Player.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Player.cpp.i
.PHONY : src/Player.cpp.i

src/Player.s: src/Player.cpp.s
.PHONY : src/Player.s

# target to generate assembly for a file
src/Player.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Player.cpp.s
.PHONY : src/Player.cpp.s

src/ShaderProgram.o: src/ShaderProgram.cpp.o
.PHONY : src/ShaderProgram.o

# target to build an object file
src/ShaderProgram.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o
.PHONY : src/ShaderProgram.cpp.o

src/ShaderProgram.i: src/ShaderProgram.cpp.i
.PHONY : src/ShaderProgram.i

# target to preprocess a source file
src/ShaderProgram.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.i
.PHONY : src/ShaderProgram.cpp.i

src/ShaderProgram.s: src/ShaderProgram.cpp.s
.PHONY : src/ShaderProgram.s

# target to generate assembly for a file
src/ShaderProgram.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.s
.PHONY : src/ShaderProgram.cpp.s

src/Terrain.o: src/Terrain.cpp.o
.PHONY : src/Terrain.o

# target to build an object file
src/Terrain.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Terrain.cpp.o
.PHONY : src/Terrain.cpp.o

src/Terrain.i: src/Terrain.cpp.i
.PHONY : src/Terrain.i

# target to preprocess a source file
src/Terrain.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Terrain.cpp.i
.PHONY : src/Terrain.cpp.i

src/Terrain.s: src/Terrain.cpp.s
.PHONY : src/Terrain.s

# target to generate assembly for a file
src/Terrain.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Terrain.cpp.s
.PHONY : src/Terrain.cpp.s

src/Texture.o: src/Texture.cpp.o
.PHONY : src/Texture.o

# target to build an object file
src/Texture.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Texture.cpp.o
.PHONY : src/Texture.cpp.o

src/Texture.i: src/Texture.cpp.i
.PHONY : src/Texture.i

# target to preprocess a source file
src/Texture.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Texture.cpp.i
.PHONY : src/Texture.cpp.i

src/Texture.s: src/Texture.cpp.s
.PHONY : src/Texture.s

# target to generate assembly for a file
src/Texture.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/Texture.cpp.s
.PHONY : src/Texture.cpp.s

src/WorldAxes.o: src/WorldAxes.cpp.o
.PHONY : src/WorldAxes.o

# target to build an object file
src/WorldAxes.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o
.PHONY : src/WorldAxes.cpp.o

src/WorldAxes.i: src/WorldAxes.cpp.i
.PHONY : src/WorldAxes.i

# target to preprocess a source file
src/WorldAxes.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.i
.PHONY : src/WorldAxes.cpp.i

src/WorldAxes.s: src/WorldAxes.cpp.s
.PHONY : src/WorldAxes.s

# target to generate assembly for a file
src/WorldAxes.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.s
.PHONY : src/WorldAxes.cpp.s

src/chunk.o: src/chunk.cpp.o
.PHONY : src/chunk.o

# target to build an object file
src/chunk.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/chunk.cpp.o
.PHONY : src/chunk.cpp.o

src/chunk.i: src/chunk.cpp.i
.PHONY : src/chunk.i

# target to preprocess a source file
src/chunk.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/chunk.cpp.i
.PHONY : src/chunk.cpp.i

src/chunk.s: src/chunk.cpp.s
.PHONY : src/chunk.s

# target to generate assembly for a file
src/chunk.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/chunk.cpp.s
.PHONY : src/chunk.cpp.s

src/main.o: src/main.cpp.o
.PHONY : src/main.o

# target to build an object file
src/main.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/main.cpp.o
.PHONY : src/main.cpp.o

src/main.i: src/main.cpp.i
.PHONY : src/main.i

# target to preprocess a source file
src/main.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/main.cpp.i
.PHONY : src/main.cpp.i

src/main.s: src/main.cpp.s
.PHONY : src/main.s

# target to generate assembly for a file
src/main.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/main.cpp.s
.PHONY : src/main.cpp.s

src/noise.o: src/noise.cpp.o
.PHONY : src/noise.o

# target to build an object file
src/noise.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/noise.cpp.o
.PHONY : src/noise.cpp.o

src/noise.i: src/noise.cpp.i
.PHONY : src/noise.i

# target to preprocess a source file
src/noise.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/noise.cpp.i
.PHONY : src/noise.cpp.i

src/noise.s: src/noise.cpp.s
.PHONY : src/noise.s

# target to generate assembly for a file
src/noise.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WebCraft.dir/build.make CMakeFiles/WebCraft.dir/src/noise.cpp.s
.PHONY : src/noise.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... install"
	@echo "... install/local"
	@echo "... install/strip"
	@echo "... list_install_components"
	@echo "... rebuild_cache"
	@echo "... WebCraft"
	@echo "... glm_dummy"
	@echo "... src/Camera.o"
	@echo "... src/Camera.i"
	@echo "... src/Camera.s"
	@echo "... src/Drawable.o"
	@echo "... src/Drawable.i"
	@echo "... src/Drawable.s"
	@echo "... src/Entity.o"
	@echo "... src/Entity.i"
	@echo "... src/Entity.s"
	@echo "... src/MyGL.o"
	@echo "... src/MyGL.i"
	@echo "... src/MyGL.s"
	@echo "... src/Player.o"
	@echo "... src/Player.i"
	@echo "... src/Player.s"
	@echo "... src/ShaderProgram.o"
	@echo "... src/ShaderProgram.i"
	@echo "... src/ShaderProgram.s"
	@echo "... src/Terrain.o"
	@echo "... src/Terrain.i"
	@echo "... src/Terrain.s"
	@echo "... src/Texture.o"
	@echo "... src/Texture.i"
	@echo "... src/Texture.s"
	@echo "... src/WorldAxes.o"
	@echo "... src/WorldAxes.i"
	@echo "... src/WorldAxes.s"
	@echo "... src/chunk.o"
	@echo "... src/chunk.i"
	@echo "... src/chunk.s"
	@echo "... src/main.o"
	@echo "... src/main.i"
	@echo "... src/main.s"
	@echo "... src/noise.o"
	@echo "... src/noise.i"
	@echo "... src/noise.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
