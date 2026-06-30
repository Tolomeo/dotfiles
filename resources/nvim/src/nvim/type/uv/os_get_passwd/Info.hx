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
	extern public var gid : Float;
	/**
		```lua
		(field) uv.os_get_passwd.info.homedir: string
		```
	**/
	extern public var homedir : String;
	/**
		```lua
		(field) uv.os_get_passwd.info.shell: string
		```
	**/
	extern public var shell : String;
	/**
		```lua
		(field) uv.os_get_passwd.info.uid: integer
		```
	**/
	extern public var uid : Float;
	/**
		```lua
		(field) uv.os_get_passwd.info.username: string
		```
	**/
	extern public var username : String;
}