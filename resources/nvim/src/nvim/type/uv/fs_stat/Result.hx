package nvim.type.uv.fs_stat;

/**
	```lua
	(class) uv.fs_stat.result
	```
**/
@:structInit extern class Result {
	/**
		```lua
		(field) uv.fs_stat.result.atime: uv.fs_stat.result.time
		```
	**/
	var atime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.birthtime: uv.fs_stat.result.time
		```
	**/
	var birthtime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.blksize: integer
		```
	**/
	var blksize : Int;
	/**
		```lua
		(field) uv.fs_stat.result.blocks: integer
		```
	**/
	var blocks : Int;
	/**
		```lua
		(field) uv.fs_stat.result.ctime: uv.fs_stat.result.time
		```
	**/
	var ctime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.dev: integer
		```
	**/
	var dev : Int;
	/**
		```lua
		(field) uv.fs_stat.result.flags: integer
		```
	**/
	var flags : Int;
	/**
		```lua
		(field) uv.fs_stat.result.gen: integer
		```
	**/
	var gen : Int;
	/**
		```lua
		(field) uv.fs_stat.result.gid: integer
		```
	**/
	var gid : Int;
	/**
		```lua
		(field) uv.fs_stat.result.ino: integer
		```
	**/
	var ino : Int;
	/**
		```lua
		(field) uv.fs_stat.result.mode: integer
		```
	**/
	var mode : Int;
	/**
		```lua
		(field) uv.fs_stat.result.mtime: uv.fs_stat.result.time
		```
	**/
	var mtime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.nlink: integer
		```
	**/
	var nlink : Int;
	/**
		```lua
		(field) uv.fs_stat.result.rdev: integer
		```
	**/
	var rdev : Int;
	/**
		```lua
		(field) uv.fs_stat.result.size: integer
		```
	**/
	var size : Int;
	/**
		```lua
		(field) uv.fs_stat.result.type: string
		```
	**/
	var type : String;
	/**
		```lua
		(field) uv.fs_stat.result.uid: integer
		```
	**/
	var uid : Int;
}