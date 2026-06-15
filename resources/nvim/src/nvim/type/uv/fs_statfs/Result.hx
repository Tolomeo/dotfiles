package nvim.type.uv.fs_statfs;

/**
	```lua
	(class) uv.fs_statfs.result
	```
**/
@:structInit extern class Result {
	/**
		```lua
		(field) uv.fs_statfs.result.bavail: integer
		```
	**/
	var bavail : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.bfree: integer
		```
	**/
	var bfree : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.blocks: integer
		```
	**/
	var blocks : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.bsize: integer
		```
	**/
	var bsize : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.ffree: integer
		```
	**/
	var ffree : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.files: integer
		```
	**/
	var files : Int;
	/**
		```lua
		(field) uv.fs_statfs.result.type: integer
		```
	**/
	var type : Int;
}