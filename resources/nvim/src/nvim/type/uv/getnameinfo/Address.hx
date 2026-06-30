package nvim.type.uv.getnameinfo;

/**
	```lua
	(class) uv.getnameinfo.address
	```
	
	---
	
	 uv.getnameinfo.address
	
**/
@:structInit class Address {
	/**
		```lua
		(field) uv.getnameinfo.address.family: string|integer
		```
	**/
	extern public var family : haxe.extern.EitherType<String, Float>;
	/**
		```lua
		(field) uv.getnameinfo.address.ip: string
		```
	**/
	extern public var ip : String;
	/**
		```lua
		(field) uv.getnameinfo.address.port: integer
		```
	**/
	extern public var port : Float;
}