package nvim.type.uv.fs_symlink;

/**
	```lua
	(class) uv.fs_symlink.flags
	```
**/
@:structInit extern class Flags {
	/**
		```lua
		(field) uv.fs_symlink.flags.dir: boolean
		```
	**/
	var dir : Bool;
	/**
		```lua
		(field) uv.fs_symlink.flags.junction: boolean
		```
	**/
	var junction : Bool;
}