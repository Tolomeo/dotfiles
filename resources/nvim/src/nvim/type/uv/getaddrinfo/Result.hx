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
	extern var addr : String;
	/**
		```lua
		(field) uv.getaddrinfo.result.canonname: string|nil
		```
	**/
	@:optional
	extern var canonname : Null<String>;
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
	extern var family : haxe.extern.EitherType<nvim.type.uv.socket.Family, String>;
	/**
		```lua
		(field) uv.getaddrinfo.result.port: integer|nil
		```
	**/
	@:optional
	extern var port : Null<Int>;
	/**
		```lua
		(field) uv.getaddrinfo.result.protocol: string
		```
	**/
	extern var protocol : String;
	/**
		```lua
		(field) uv.getaddrinfo.result.socktype: string
		```
	**/
	extern var socktype : String;
}