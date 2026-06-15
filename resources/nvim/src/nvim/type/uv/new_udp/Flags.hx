package nvim.type.uv.new_udp;

/**
	```lua
	(class) uv.new_udp.flags
	```
**/
@:structInit extern class Flags {
	/**
		```lua
		(field) uv.new_udp.flags.family: "appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"|nil
		```
		
		---
		
		
		
		---
		
		```lua
		uv.new_udp.flags.family:
		    | "unix"
		    | "inet"
		    | "inet6"
		    | "ipx"
		    | "netlink"
		    | "x25"
		    | "ax25"
		    | "atmpvc"
		    | "appletalk"
		    | "packet"
		```
		
		---
		
		```lua
		uv.socket.family:
		    | "unix"
		    | "inet"
		    | "inet6"
		    | "ipx"
		    | "netlink"
		    | "x25"
		    | "ax25"
		    | "atmpvc"
		    | "appletalk"
		    | "packet"
		```
	**/
	var family : Null<nvim.type.uv.new_udp.flags.Family>;
	/**
		```lua
		(field) uv.new_udp.flags.mmsgs: integer|nil
		```
		
		---
		
		default `1`
	**/
	var mmsgs : Null<Int>;
}