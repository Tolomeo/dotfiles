package nvim.type.uv.os_uname;

/**
	```lua
	(class) uv.os_uname.info
	```
**/
@:structInit extern class Info {
	/**
		```lua
		(field) uv.os_uname.info.machine: string
		```
	**/
	var machine : String;
	/**
		```lua
		(field) uv.os_uname.info.release: string
		```
	**/
	var release : String;
	/**
		```lua
		(field) uv.os_uname.info.sysname: string
		```
	**/
	var sysname : String;
	/**
		```lua
		(field) uv.os_uname.info.version: string
		```
	**/
	var version : String;
}