package nvim.type.uv;

/**
	```lua
	(class) uv.socketinfo
	```
	
	---
	
	 socket info
	
**/
@:structInit class Socketinfo {
	/**
		```lua
		(field) uv.socketinfo.family: string|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
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
	extern public var family : haxe.extern.EitherType<String, nvim.type.uv.socket.Family>;
	/**
		```lua
		(field) uv.socketinfo.ip: string
		```
	**/
	extern public var ip : String;
	/**
		```lua
		(field) uv.socketinfo.port: integer
		```
	**/
	extern public var port : Int;
}