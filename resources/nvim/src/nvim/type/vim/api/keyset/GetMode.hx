package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_mode
	```
**/
@:structInit extern class GetMode {
	/**
		```lua
		(field) vim.api.keyset.get_mode.blocking: boolean
		```
	**/
	var blocking : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_mode.mode: string
		```
	**/
	var mode : String;
}