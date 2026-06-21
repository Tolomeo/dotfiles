package nvim.type.uv.fs_readdir;

/**
	```lua
	(class) uv.fs_readdir.entry
	```
**/
@:structInit class Entry {
	/**
		```lua
		(field) uv.fs_readdir.entry.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) uv.fs_readdir.entry.type: string
		```
	**/
	extern var type : String;
}