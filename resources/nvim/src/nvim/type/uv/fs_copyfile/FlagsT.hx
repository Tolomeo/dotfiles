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
	extern var excl : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone: boolean
		```
	**/
	extern var ficlone : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone_force: boolean
		```
	**/
	extern var ficlone_force : Bool;
}