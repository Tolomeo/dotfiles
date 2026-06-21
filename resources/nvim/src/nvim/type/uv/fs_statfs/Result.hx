package nvim.type.uv.fs_statfs;

/**
	```lua
	(class) uv.fs_statfs.result
	```
**/
@:structInit class Result {
	/**
		```lua
		(field) uv.fs_statfs.result.bavail: integer
		```
	**/
	extern var bavail : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.bfree: integer
		```
	**/
	extern var bfree : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.blocks: integer
		```
	**/
	extern var blocks : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.bsize: integer
		```
	**/
	extern var bsize : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.ffree: integer
		```
	**/
	extern var ffree : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.files: integer
		```
	**/
	extern var files : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.type: integer
		```
	**/
	extern var type : Int;
}