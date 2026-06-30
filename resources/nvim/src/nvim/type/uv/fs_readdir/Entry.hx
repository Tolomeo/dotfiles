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
	extern public var name : String;
	/**
		```lua
		(field) uv.fs_readdir.entry.type: string
		```
	**/
	extern public var type : String;
}