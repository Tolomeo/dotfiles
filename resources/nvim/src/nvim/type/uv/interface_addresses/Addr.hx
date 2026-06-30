package nvim.type.uv.interface_addresses;

/**
	```lua
	(class) uv.interface_addresses.addr
	```
**/
@:structInit class Addr {
	/**
		```lua
		(field) uv.interface_addresses.addr.family: string
		```
	**/
	extern public var family : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.internal: boolean
		```
	**/
	extern public var internal : Bool;
	/**
		```lua
		(field) uv.interface_addresses.addr.ip: string
		```
	**/
	extern public var ip : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.mac: string
		```
	**/
	extern public var mac : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.netmask: string
		```
	**/
	extern public var netmask : String;
}