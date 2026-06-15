package nvim.type.uv.getnameinfo;

/**
	```lua
	(class) uv.getnameinfo.address
	```
	
	---
	
	 uv.getnameinfo.address
	
**/
@:structInit extern class Address {
	/**
		```lua
		(field) uv.getnameinfo.address.family: string|integer
		```
	**/
	var family : haxe.extern.EitherType<String, Int>;
	/**
		```lua
		(field) uv.getnameinfo.address.ip: string
		```
	**/
	var ip : String;
	/**
		```lua
		(field) uv.getnameinfo.address.port: integer
		```
	**/
	var port : Int;
}