package nvim.type.uv.os_get_passwd;

/**
	```lua
	(class) uv.os_get_passwd.info
	```
**/
@:structInit class Info {
	/**
		```lua
		(field) uv.os_get_passwd.info.gid: integer
		```
	**/
	extern var gid : Int;
	/**
		```lua
		(field) uv.os_get_passwd.info.homedir: string
		```
	**/
	extern var homedir : String;
	/**
		```lua
		(field) uv.os_get_passwd.info.shell: string
		```
	**/
	extern var shell : String;
	/**
		```lua
		(field) uv.os_get_passwd.info.uid: integer
		```
	**/
	extern var uid : Int;
	/**
		```lua
		(field) uv.os_get_passwd.info.username: string
		```
	**/
	extern var username : String;
}