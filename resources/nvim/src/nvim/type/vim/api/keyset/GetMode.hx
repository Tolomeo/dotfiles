package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_mode
	```
**/
@:structInit class GetMode {
	/**
		```lua
		(field) vim.api.keyset.get_mode.blocking: boolean
		```
	**/
	extern public var blocking : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_mode.mode: string
		```
	**/
	extern public var mode : String;
}