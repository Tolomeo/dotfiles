package nvim.type.uv.fs_stat;

/**
	```lua
	(class) uv.fs_stat.result
	```
**/
@:structInit class Result {
	/**
		```lua
		(field) uv.fs_stat.result.atime: uv.fs_stat.result.time
		```
	**/
	extern public var atime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.birthtime: uv.fs_stat.result.time
		```
	**/
	extern public var birthtime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.blksize: integer
		```
	**/
	extern public var blksize : Float;
	/**
		```lua
		(field) uv.fs_stat.result.blocks: integer
		```
	**/
	extern public var blocks : Float;
	/**
		```lua
		(field) uv.fs_stat.result.ctime: uv.fs_stat.result.time
		```
	**/
	extern public var ctime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.dev: integer
		```
	**/
	extern public var dev : Float;
	/**
		```lua
		(field) uv.fs_stat.result.flags: integer
		```
	**/
	extern public var flags : Float;
	/**
		```lua
		(field) uv.fs_stat.result.gen: integer
		```
	**/
	extern public var gen : Float;
	/**
		```lua
		(field) uv.fs_stat.result.gid: integer
		```
	**/
	extern public var gid : Float;
	/**
		```lua
		(field) uv.fs_stat.result.ino: integer
		```
	**/
	extern public var ino : Float;
	/**
		```lua
		(field) uv.fs_stat.result.mode: integer
		```
	**/
	extern public var mode : Float;
	/**
		```lua
		(field) uv.fs_stat.result.mtime: uv.fs_stat.result.time
		```
	**/
	extern public var mtime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.nlink: integer
		```
	**/
	extern public var nlink : Float;
	/**
		```lua
		(field) uv.fs_stat.result.rdev: integer
		```
	**/
	extern public var rdev : Float;
	/**
		```lua
		(field) uv.fs_stat.result.size: integer
		```
	**/
	extern public var size : Float;
	/**
		```lua
		(field) uv.fs_stat.result.type: string
		```
	**/
	extern public var type : String;
	/**
		```lua
		(field) uv.fs_stat.result.uid: integer
		```
	**/
	extern public var uid : Float;
}