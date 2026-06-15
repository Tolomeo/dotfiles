package nvim.type.uv.fs_copyfile;

/**
	```lua
	(class) uv.fs_copyfile.flags_t
	```
**/
@:structInit extern class FlagsT {
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.excl: boolean
		```
	**/
	var excl : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone: boolean
		```
	**/
	var ficlone : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone_force: boolean
		```
	**/
	var ficlone_force : Bool;
}