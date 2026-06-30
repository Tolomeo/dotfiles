package nvim.type.uv.fs_symlink;

/**
	```lua
	(class) uv.fs_symlink.flags
	```
**/
@:structInit class Flags {
	/**
		```lua
		(field) uv.fs_symlink.flags.dir: boolean
		```
	**/
	extern public var dir : Bool;
	/**
		```lua
		(field) uv.fs_symlink.flags.junction: boolean
		```
	**/
	extern public var junction : Bool;
}