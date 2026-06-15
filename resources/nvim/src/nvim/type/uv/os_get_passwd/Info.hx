package nvim.type.uv.os_get_passwd;

/**
	```lua
	(class) uv.os_get_passwd.info
	```
**/
@:structInit extern class Info {
	/**
		```lua
		(field) uv.os_get_passwd.info.gid: integer
		```
	**/
	var gid : Int;
	/**
		```lua
		(field) uv.os_get_passwd.info.homedir: string
		```
	**/
	var homedir : String;
	/**
		```lua
		(field) uv.os_get_passwd.info.shell: string
		```
	**/
	var shell : String;
	/**
		```lua
		(field) uv.os_get_passwd.info.uid: integer
		```
	**/
	var uid : Int;
	/**
		```lua
		(field) uv.os_get_passwd.info.username: string
		```
	**/
	var username : String;
}