package nvim.type.uv.getrusage.result;

/**
	```lua
	(class) uv.getrusage.result.time_t
	```
**/
@:structInit class TimeT {
	/**
		```lua
		(field) uv.getrusage.result.time_t.sec: integer
		```
	**/
	extern var sec : Int;
	/**
		```lua
		(field) uv.getrusage.result.time_t.usec: integer
		```
	**/
	extern var usec : Int;
}