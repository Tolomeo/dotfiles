package nvim.type.uv.os_uname;

/**
	```lua
	(class) uv.os_uname.info
	```
**/
@:structInit class Info {
	/**
		```lua
		(field) uv.os_uname.info.machine: string
		```
	**/
	extern var machine : String;
	/**
		```lua
		(field) uv.os_uname.info.release: string
		```
	**/
	extern var release : String;
	/**
		```lua
		(field) uv.os_uname.info.sysname: string
		```
	**/
	extern var sysname : String;
	/**
		```lua
		(field) uv.os_uname.info.version: string
		```
	**/
	extern var version : String;
}