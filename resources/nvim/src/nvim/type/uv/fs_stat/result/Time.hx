package nvim.type.uv.fs_stat.result;

/**
	```lua
	(class) uv.fs_stat.result.time
	```
**/
@:structInit class Time {
	/**
		```lua
		(field) uv.fs_stat.result.time.nsec: integer
		```
	**/
	extern var nsec : Int;
	/**
		```lua
		(field) uv.fs_stat.result.time.sec: integer
		```
	**/
	extern var sec : Int;
}