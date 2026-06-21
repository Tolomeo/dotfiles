package nvim.type.uv.getaddrinfo;

/**
	```lua
	(class) uv.getaddrinfo.hints
	```
**/
@:structInit class Hints {
	/**
		```lua
		(field) uv.getaddrinfo.hints.addrconfig: boolean
		```
	**/
	extern var addrconfig : Bool;
	/**
		```lua
		(field) uv.getaddrinfo.hints.all: boolean
		```
	**/
	extern var all : Bool;
	/**
		```lua
		(field) uv.getaddrinfo.hints.canonname: boolean
		```
	**/
	extern var canonname : Bool;
	/**
		```lua
		(field) uv.getaddrinfo.hints.family: string|integer|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
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
	extern var family : haxe.extern.EitherType<String, haxe.extern.EitherType<Int, nvim.type.uv.socket.Family>>;
	/**
		```lua
		(field) uv.getaddrinfo.hints.numerichost: boolean
		```
	**/
	extern var numerichost : Bool;
	/**
		```lua
		(field) uv.getaddrinfo.hints.numericserv: boolean
		```
	**/
	extern var numericserv : Bool;
	/**
		```lua
		(field) uv.getaddrinfo.hints.passive: boolean
		```
	**/
	extern var passive : Bool;
	/**
		```lua
		(field) uv.getaddrinfo.hints.protocol: string|integer|"icmp"|"ip"|"tcp"|"udp"
		```
		
		---
		
		```lua
		uv.socket.protocol:
		    | "ip"
		    | "icmp"
		    | "tcp"
		    | "udp"
		```
	**/
	extern var protocol : haxe.extern.EitherType<String, haxe.extern.EitherType<Int, nvim.type.uv.socket.Protocol>>;
	/**
		```lua
		(field) uv.getaddrinfo.hints.socktype: string|integer|"dgram"|"raw"|"rdm"|"seqpacket"|"stream"
		```
		
		---
		
		```lua
		uv.socket.type:
		    | "stream"
		    | "dgram"
		    | "raw"
		    | "rdm"
		    | "seqpacket"
		```
	**/
	extern var socktype : haxe.extern.EitherType<String, haxe.extern.EitherType<Int, nvim.type.uv.socket.Type>>;
	/**
		```lua
		(field) uv.getaddrinfo.hints.v4mapped: boolean
		```
	**/
	extern var v4mapped : Bool;
}