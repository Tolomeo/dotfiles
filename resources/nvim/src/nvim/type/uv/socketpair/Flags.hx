package nvim.type.uv.socketpair;

/**
	```lua
	(class) uv.socketpair.flags
	```
	
	---
	
	 uv.socketpair.flags
	
**/
@:structInit class Flags {
	/**
		```lua
		(field) uv.socketpair.flags.nonblock: true|false
		```
		
		---
		
		
		 Opens the specified socket handle for `OVERLAPPED` or `FIONBIO`/`O_NONBLOCK` I/O usage. This is recommended for handles that will be used by libuv, and not usually recommended otherwise.
	**/
	extern public var nonblock : Bool;
}