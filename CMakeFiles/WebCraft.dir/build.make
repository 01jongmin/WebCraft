# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

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

# Include any dependencies generated for this target.
include CMakeFiles/WebCraft.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/WebCraft.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/WebCraft.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/WebCraft.dir/flags.make

CMakeFiles/WebCraft.dir/src/main.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/main.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/main.cpp.o: src/main.cpp
CMakeFiles/WebCraft.dir/src/main.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/WebCraft.dir/src/main.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/main.cpp.o -MF CMakeFiles/WebCraft.dir/src/main.cpp.o.d -o CMakeFiles/WebCraft.dir/src/main.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/main.cpp

CMakeFiles/WebCraft.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/main.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/main.cpp > CMakeFiles/WebCraft.dir/src/main.cpp.i

CMakeFiles/WebCraft.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/main.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/main.cpp -o CMakeFiles/WebCraft.dir/src/main.cpp.s

CMakeFiles/WebCraft.dir/src/MyGL.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/MyGL.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/MyGL.cpp.o: src/MyGL.cpp
CMakeFiles/WebCraft.dir/src/MyGL.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/WebCraft.dir/src/MyGL.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/MyGL.cpp.o -MF CMakeFiles/WebCraft.dir/src/MyGL.cpp.o.d -o CMakeFiles/WebCraft.dir/src/MyGL.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/MyGL.cpp

CMakeFiles/WebCraft.dir/src/MyGL.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/MyGL.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/MyGL.cpp > CMakeFiles/WebCraft.dir/src/MyGL.cpp.i

CMakeFiles/WebCraft.dir/src/MyGL.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/MyGL.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/MyGL.cpp -o CMakeFiles/WebCraft.dir/src/MyGL.cpp.s

CMakeFiles/WebCraft.dir/src/Drawable.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Drawable.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Drawable.cpp.o: src/Drawable.cpp
CMakeFiles/WebCraft.dir/src/Drawable.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/WebCraft.dir/src/Drawable.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Drawable.cpp.o -MF CMakeFiles/WebCraft.dir/src/Drawable.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Drawable.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Drawable.cpp

CMakeFiles/WebCraft.dir/src/Drawable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Drawable.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Drawable.cpp > CMakeFiles/WebCraft.dir/src/Drawable.cpp.i

CMakeFiles/WebCraft.dir/src/Drawable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Drawable.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Drawable.cpp -o CMakeFiles/WebCraft.dir/src/Drawable.cpp.s

CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o: src/ShaderProgram.cpp
CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o -MF CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o.d -o CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/ShaderProgram.cpp

CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/ShaderProgram.cpp > CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.i

CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/ShaderProgram.cpp -o CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.s

CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o: src/WorldAxes.cpp
CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o -MF CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o.d -o CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/WorldAxes.cpp

CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/WorldAxes.cpp > CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.i

CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/WorldAxes.cpp -o CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.s

CMakeFiles/WebCraft.dir/src/Entity.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Entity.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Entity.cpp.o: src/Entity.cpp
CMakeFiles/WebCraft.dir/src/Entity.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/WebCraft.dir/src/Entity.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Entity.cpp.o -MF CMakeFiles/WebCraft.dir/src/Entity.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Entity.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Entity.cpp

CMakeFiles/WebCraft.dir/src/Entity.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Entity.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Entity.cpp > CMakeFiles/WebCraft.dir/src/Entity.cpp.i

CMakeFiles/WebCraft.dir/src/Entity.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Entity.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Entity.cpp -o CMakeFiles/WebCraft.dir/src/Entity.cpp.s

CMakeFiles/WebCraft.dir/src/Camera.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Camera.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Camera.cpp.o: src/Camera.cpp
CMakeFiles/WebCraft.dir/src/Camera.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/WebCraft.dir/src/Camera.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Camera.cpp.o -MF CMakeFiles/WebCraft.dir/src/Camera.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Camera.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Camera.cpp

CMakeFiles/WebCraft.dir/src/Camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Camera.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Camera.cpp > CMakeFiles/WebCraft.dir/src/Camera.cpp.i

CMakeFiles/WebCraft.dir/src/Camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Camera.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Camera.cpp -o CMakeFiles/WebCraft.dir/src/Camera.cpp.s

CMakeFiles/WebCraft.dir/src/Player.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Player.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Player.cpp.o: src/Player.cpp
CMakeFiles/WebCraft.dir/src/Player.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/WebCraft.dir/src/Player.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Player.cpp.o -MF CMakeFiles/WebCraft.dir/src/Player.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Player.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Player.cpp

CMakeFiles/WebCraft.dir/src/Player.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Player.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Player.cpp > CMakeFiles/WebCraft.dir/src/Player.cpp.i

CMakeFiles/WebCraft.dir/src/Player.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Player.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Player.cpp -o CMakeFiles/WebCraft.dir/src/Player.cpp.s

CMakeFiles/WebCraft.dir/src/Terrain.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Terrain.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Terrain.cpp.o: src/Terrain.cpp
CMakeFiles/WebCraft.dir/src/Terrain.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/WebCraft.dir/src/Terrain.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Terrain.cpp.o -MF CMakeFiles/WebCraft.dir/src/Terrain.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Terrain.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Terrain.cpp

CMakeFiles/WebCraft.dir/src/Terrain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Terrain.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Terrain.cpp > CMakeFiles/WebCraft.dir/src/Terrain.cpp.i

CMakeFiles/WebCraft.dir/src/Terrain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Terrain.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Terrain.cpp -o CMakeFiles/WebCraft.dir/src/Terrain.cpp.s

CMakeFiles/WebCraft.dir/src/noise.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/noise.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/noise.cpp.o: src/noise.cpp
CMakeFiles/WebCraft.dir/src/noise.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/WebCraft.dir/src/noise.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/noise.cpp.o -MF CMakeFiles/WebCraft.dir/src/noise.cpp.o.d -o CMakeFiles/WebCraft.dir/src/noise.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/noise.cpp

CMakeFiles/WebCraft.dir/src/noise.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/noise.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/noise.cpp > CMakeFiles/WebCraft.dir/src/noise.cpp.i

CMakeFiles/WebCraft.dir/src/noise.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/noise.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/noise.cpp -o CMakeFiles/WebCraft.dir/src/noise.cpp.s

CMakeFiles/WebCraft.dir/src/chunk.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/chunk.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/chunk.cpp.o: src/chunk.cpp
CMakeFiles/WebCraft.dir/src/chunk.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/WebCraft.dir/src/chunk.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/chunk.cpp.o -MF CMakeFiles/WebCraft.dir/src/chunk.cpp.o.d -o CMakeFiles/WebCraft.dir/src/chunk.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/chunk.cpp

CMakeFiles/WebCraft.dir/src/chunk.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/chunk.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/chunk.cpp > CMakeFiles/WebCraft.dir/src/chunk.cpp.i

CMakeFiles/WebCraft.dir/src/chunk.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/chunk.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/chunk.cpp -o CMakeFiles/WebCraft.dir/src/chunk.cpp.s

CMakeFiles/WebCraft.dir/src/Texture.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Texture.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Texture.cpp.o: src/Texture.cpp
CMakeFiles/WebCraft.dir/src/Texture.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/WebCraft.dir/src/Texture.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Texture.cpp.o -MF CMakeFiles/WebCraft.dir/src/Texture.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Texture.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Texture.cpp

CMakeFiles/WebCraft.dir/src/Texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Texture.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Texture.cpp > CMakeFiles/WebCraft.dir/src/Texture.cpp.i

CMakeFiles/WebCraft.dir/src/Texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Texture.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Texture.cpp -o CMakeFiles/WebCraft.dir/src/Texture.cpp.s

CMakeFiles/WebCraft.dir/src/Quad.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Quad.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Quad.cpp.o: src/Quad.cpp
CMakeFiles/WebCraft.dir/src/Quad.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/WebCraft.dir/src/Quad.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Quad.cpp.o -MF CMakeFiles/WebCraft.dir/src/Quad.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Quad.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Quad.cpp

CMakeFiles/WebCraft.dir/src/Quad.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Quad.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Quad.cpp > CMakeFiles/WebCraft.dir/src/Quad.cpp.i

CMakeFiles/WebCraft.dir/src/Quad.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Quad.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Quad.cpp -o CMakeFiles/WebCraft.dir/src/Quad.cpp.s

CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o: src/FrameBuffer.cpp
CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o -MF CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o.d -o CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/FrameBuffer.cpp

CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/FrameBuffer.cpp > CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.i

CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/FrameBuffer.cpp -o CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.s

CMakeFiles/WebCraft.dir/src/Reticle.cpp.o: CMakeFiles/WebCraft.dir/flags.make
CMakeFiles/WebCraft.dir/src/Reticle.cpp.o: CMakeFiles/WebCraft.dir/includes_CXX.rsp
CMakeFiles/WebCraft.dir/src/Reticle.cpp.o: src/Reticle.cpp
CMakeFiles/WebCraft.dir/src/Reticle.cpp.o: CMakeFiles/WebCraft.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/WebCraft.dir/src/Reticle.cpp.o"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/WebCraft.dir/src/Reticle.cpp.o -MF CMakeFiles/WebCraft.dir/src/Reticle.cpp.o.d -o CMakeFiles/WebCraft.dir/src/Reticle.cpp.o -c /Users/jongmin/CLionProjects/webassembly_emcc/src/Reticle.cpp

CMakeFiles/WebCraft.dir/src/Reticle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebCraft.dir/src/Reticle.cpp.i"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jongmin/CLionProjects/webassembly_emcc/src/Reticle.cpp > CMakeFiles/WebCraft.dir/src/Reticle.cpp.i

CMakeFiles/WebCraft.dir/src/Reticle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebCraft.dir/src/Reticle.cpp.s"
	/usr/local/Cellar/emscripten/2.0.34/libexec/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jongmin/CLionProjects/webassembly_emcc/src/Reticle.cpp -o CMakeFiles/WebCraft.dir/src/Reticle.cpp.s

# Object files for target WebCraft
WebCraft_OBJECTS = \
"CMakeFiles/WebCraft.dir/src/main.cpp.o" \
"CMakeFiles/WebCraft.dir/src/MyGL.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Drawable.cpp.o" \
"CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o" \
"CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Entity.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Camera.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Player.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Terrain.cpp.o" \
"CMakeFiles/WebCraft.dir/src/noise.cpp.o" \
"CMakeFiles/WebCraft.dir/src/chunk.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Texture.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Quad.cpp.o" \
"CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o" \
"CMakeFiles/WebCraft.dir/src/Reticle.cpp.o"

# External object files for target WebCraft
WebCraft_EXTERNAL_OBJECTS =

web/WebCraft.js: CMakeFiles/WebCraft.dir/src/main.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/MyGL.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Drawable.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/ShaderProgram.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/WorldAxes.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Entity.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Camera.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Player.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Terrain.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/noise.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/chunk.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Texture.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Quad.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/FrameBuffer.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/src/Reticle.cpp.o
web/WebCraft.js: CMakeFiles/WebCraft.dir/build.make
web/WebCraft.js: CMakeFiles/WebCraft.dir/objects1.rsp
web/WebCraft.js: CMakeFiles/WebCraft.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking CXX executable web/WebCraft.js"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/WebCraft.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/WebCraft.dir/build: web/WebCraft.js
.PHONY : CMakeFiles/WebCraft.dir/build

CMakeFiles/WebCraft.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/WebCraft.dir/cmake_clean.cmake
.PHONY : CMakeFiles/WebCraft.dir/clean

CMakeFiles/WebCraft.dir/depend:
	cd /Users/jongmin/CLionProjects/webassembly_emcc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jongmin/CLionProjects/webassembly_emcc /Users/jongmin/CLionProjects/webassembly_emcc /Users/jongmin/CLionProjects/webassembly_emcc /Users/jongmin/CLionProjects/webassembly_emcc /Users/jongmin/CLionProjects/webassembly_emcc/CMakeFiles/WebCraft.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/WebCraft.dir/depend

