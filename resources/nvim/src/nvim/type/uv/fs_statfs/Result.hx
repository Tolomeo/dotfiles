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
	extern public var bavail : Float;
	/**
		```lua
		(field) uv.fs_statfs.result.bfree: integer
		```
	**/
	extern public var bfree : Float;
	/**
		```lua
		(field) uv.fs_statfs.result.blocks: integer
		```
	**/
	extern public var blocks : Float;
	/**
		```lua
		(field) uv.fs_statfs.result.bsize: integer
		```
	**/
	extern public var bsize : Float;
	/**
		```lua
		(field) uv.fs_statfs.result.ffree: integer
		```
	**/
	extern public var ffree : Float;
	/**
		```lua
		(field) uv.fs_statfs.result.files: integer
		```
	**/
	extern public var files : Float;
	/**
		```lua
		(field) uv.fs_statfs.result.type: integer
		```
	**/
	extern public var type : Float;
}