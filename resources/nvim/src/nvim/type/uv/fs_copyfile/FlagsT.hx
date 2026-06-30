package nvim.type.uv.fs_copyfile;

/**
	```lua
	(class) uv.fs_copyfile.flags_t
	```
**/
@:structInit class FlagsT {
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.excl: boolean
		```
	**/
	extern public var excl : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone: boolean
		```
	**/
	extern public var ficlone : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone_force: boolean
		```
	**/
	extern public var ficlone_force : Bool;
}