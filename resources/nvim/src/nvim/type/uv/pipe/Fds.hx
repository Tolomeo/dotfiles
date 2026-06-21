package nvim.type.uv.pipe;

/**
	```lua
	(class) uv.pipe.fds
	```
**/
@:structInit class Fds {
	/**
		```lua
		(field) uv.pipe.fds.read: integer
		```
	**/
	extern var read : Int;
	/**
		```lua
		(field) uv.pipe.fds.write: integer
		```
	**/
	extern var write : Int;
}