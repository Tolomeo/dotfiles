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
	extern var atime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.birthtime: uv.fs_stat.result.time
		```
	**/
	extern var birthtime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.blksize: integer
		```
	**/
	extern var blksize : Int;
	/**
		```lua
		(field) uv.fs_stat.result.blocks: integer
		```
	**/
	extern var blocks : Int;
	/**
		```lua
		(field) uv.fs_stat.result.ctime: uv.fs_stat.result.time
		```
	**/
	extern var ctime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.dev: integer
		```
	**/
	extern var dev : Int;
	/**
		```lua
		(field) uv.fs_stat.result.flags: integer
		```
	**/
	extern var flags : Int;
	/**
		```lua
		(field) uv.fs_stat.result.gen: integer
		```
	**/
	extern var gen : Int;
	/**
		```lua
		(field) uv.fs_stat.result.gid: integer
		```
	**/
	extern var gid : Int;
	/**
		```lua
		(field) uv.fs_stat.result.ino: integer
		```
	**/
	extern var ino : Int;
	/**
		```lua
		(field) uv.fs_stat.result.mode: integer
		```
	**/
	extern var mode : Int;
	/**
		```lua
		(field) uv.fs_stat.result.mtime: uv.fs_stat.result.time
		```
	**/
	extern var mtime : nvim.type.uv.fs_stat.result.Time;
	/**
		```lua
		(field) uv.fs_stat.result.nlink: integer
		```
	**/
	extern var nlink : Int;
	/**
		```lua
		(field) uv.fs_stat.result.rdev: integer
		```
	**/
	extern var rdev : Int;
	/**
		```lua
		(field) uv.fs_stat.result.size: integer
		```
	**/
	extern var size : Int;
	/**
		```lua
		(field) uv.fs_stat.result.type: string
		```
	**/
	extern var type : String;
	/**
		```lua
		(field) uv.fs_stat.result.uid: integer
		```
	**/
	extern var uid : Int;
}