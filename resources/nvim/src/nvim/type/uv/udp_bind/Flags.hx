package nvim.type.uv.udp_bind;

/**
	```lua
	(class) uv.udp_bind.flags
	```
	
	---
	
	 uv.udp_bind.flags
	
	
**/
@:structInit class Flags {
	/**
		```lua
		(field) uv.udp_bind.flags.ipv6only: boolean
		```
	**/
	extern var ipv6only : Bool;
	/**
		```lua
		(field) uv.udp_bind.flags.reuseaddr: boolean
		```
	**/
	extern var reuseaddr : Bool;
}