package nvim.type.uv.udp_bind;

/**
	```lua
	(class) uv.udp_bind.flags
	```
	
	---
	
	 uv.udp_bind.flags
	
	
**/
@:structInit extern class Flags {
	/**
		```lua
		(field) uv.udp_bind.flags.ipv6only: boolean
		```
	**/
	var ipv6only : Bool;
	/**
		```lua
		(field) uv.udp_bind.flags.reuseaddr: boolean
		```
	**/
	var reuseaddr : Bool;
}