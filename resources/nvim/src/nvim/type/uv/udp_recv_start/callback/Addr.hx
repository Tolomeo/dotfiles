package nvim.type.uv.udp_recv_start.callback;

/**
	```lua
	(class) uv.udp_recv_start.callback.addr
	```
**/
@:structInit extern class Addr {
	/**
		```lua
		(field) uv.udp_recv_start.callback.addr.family: string|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
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
	var family : haxe.extern.EitherType<nvim.type.uv.socket.Family, String>;
	/**
		```lua
		(field) uv.udp_recv_start.callback.addr.ip: string
		```
	**/
	var ip : String;
	/**
		```lua
		(field) uv.udp_recv_start.callback.addr.port: integer
		```
	**/
	var port : Int;
}