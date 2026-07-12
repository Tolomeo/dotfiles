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
	extern public var bavail : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.bfree: integer
		```
	**/
	extern public var bfree : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.blocks: integer
		```
	**/
	extern public var blocks : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.bsize: integer
		```
	**/
	extern public var bsize : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.ffree: integer
		```
	**/
	extern public var ffree : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.files: integer
		```
	**/
	extern public var files : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.type: integer
		```
	**/
	extern public var type : Int;
}