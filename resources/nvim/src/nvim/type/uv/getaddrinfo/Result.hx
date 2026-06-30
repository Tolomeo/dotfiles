package nvim.type.uv.getaddrinfo;

/**
	```lua
	(class) uv.getaddrinfo.result
	```
**/
@:structInit class Result {
	/**
		```lua
		(field) uv.getaddrinfo.result.addr: string
		```
	**/
	extern public var addr : String;
	/**
		```lua
		(field) uv.getaddrinfo.result.canonname: string|nil
		```
	**/
	@:optional
	extern public var canonname : Null<String>;
	/**
		```lua
		(field) uv.getaddrinfo.result.family: string|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
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
	extern public var family : haxe.extern.EitherType<nvim.type.uv.socket.Family, String>;
	/**
		```lua
		(field) uv.getaddrinfo.result.port: integer|nil
		```
	**/
	@:optional
	extern public var port : Null<Float>;
	/**
		```lua
		(field) uv.getaddrinfo.result.protocol: string
		```
	**/
	extern public var protocol : String;
	/**
		```lua
		(field) uv.getaddrinfo.result.socktype: string
		```
	**/
	extern public var socktype : String;
}