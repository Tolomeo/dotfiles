package nvim.type.uv.interface_addresses;

/**
	```lua
	(class) uv.interface_addresses.addr
	```
**/
@:structInit extern class Addr {
	/**
		```lua
		(field) uv.interface_addresses.addr.family: string
		```
	**/
	var family : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.internal: boolean
		```
	**/
	var internal : Bool;
	/**
		```lua
		(field) uv.interface_addresses.addr.ip: string
		```
	**/
	var ip : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.mac: string
		```
	**/
	var mac : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.netmask: string
		```
	**/
	var netmask : String;
}