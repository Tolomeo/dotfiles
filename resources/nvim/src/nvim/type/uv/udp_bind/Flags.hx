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
	extern public var ipv6only : Bool;
	/**
		```lua
		(field) uv.udp_bind.flags.reuseaddr: boolean
		```
	**/
	extern public var reuseaddr : Bool;
}