package nvim.type.uv.spawn;

/**
	```lua
	(field) uv.spawn.options.env: table<string, string>
	```
	
	---
	
	
	 Set environment variables for the new process.
**/
@:structInit class Env {

}

/**
	```lua
	(field) uv.spawn.options.stdio: { [1]: integer|uv.uv_stream_t|nil, [2]: integer|uv.uv_stream_t|nil, [3]: integer|uv.uv_stream_t|nil }
	```
	
	---
	
	
	 Set the file descriptors that will be made available to the child process. The convention is that the first entries are stdin, stdout, and stderr. (**Note**: On Windows, file descriptors after the third are available to the child process only if the child processes uses the MSVCRT runtime.)
**/
@:structInit class Stdio {

}

/**
	```lua
	(class) uv.spawn.options
	```
**/
@:structInit class Options {
	/**
		```lua
		(field) uv.spawn.options.args: string[]
		```
		
		---
		
		
		 Command line arguments as a list of strings. The first string should be the path to the program. On Windows, this uses CreateProcess which concatenates the arguments into a string. This can cause some strange errors. (See `options.verbatim` below for Windows.)
	**/
	extern public var args : lua.Table<Int, String>;
	/**
		```lua
		(field) uv.spawn.options.cwd: string
		```
		
		---
		
		
		 Set the current working directory for the sub-process.
	**/
	extern public var cwd : String;
	/**
		```lua
		(field) uv.spawn.options.detached: boolean
		```
		
		---
		
		
		 If true, spawn the child process in a detached state - this will make it a process group leader, and will effectively enable the child to keep running after the parent exits. Note that the child process will still keep the parent's event loop alive unless the parent process calls `uv.unref()` on the child's process handle.
	**/
	extern public var detached : Bool;
	/**
		```lua
		(field) uv.spawn.options.gid: string
		```
		
		---
		
		
		 Set the child process' group id.
	**/
	extern public var gid : String;
	/**
		```lua
		(field) uv.spawn.options.hide: boolean
		```
		
		---
		
		
		 If true, hide the subprocess console window that would normally be created. This option is only meaningful on Windows systems. On Unix it is silently ignored.
	**/
	extern public var hide : Bool;
	/**
		```lua
		(field) uv.spawn.options.uid: string
		```
		
		---
		
		
		 Set the child process' user id.
	**/
	extern public var uid : String;
	/**
		```lua
		(field) uv.spawn.options.verbatim: boolean
		```
		
		---
		
		
		 If true, do not wrap any arguments in quotes, or perform any other escaping, when converting the argument list into a command line string. This option is only meaningful on Windows systems. On Unix it is silently ignored.
	**/
	extern public var verbatim : Bool;
}