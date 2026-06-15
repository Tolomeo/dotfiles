package nvim.type.uv.fs_readdir;

/**
	```lua
	(class) uv.fs_readdir.entry
	```
**/
@:structInit extern class Entry {
	/**
		```lua
		(field) uv.fs_readdir.entry.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) uv.fs_readdir.entry.type: string
		```
	**/
	var type : String;
}