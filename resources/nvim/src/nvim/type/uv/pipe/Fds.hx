package nvim.type.uv.pipe;

/**
	```lua
	(class) uv.pipe.fds
	```
**/
@:structInit extern class Fds {
	/**
		```lua
		(field) uv.pipe.fds.read: integer
		```
	**/
	var read : Int;
	/**
		```lua
		(field) uv.pipe.fds.write: integer
		```
	**/
	var write : Int;
}