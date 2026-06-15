package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_extmarks
	```
**/
@:structInit extern class GetExtmarks {
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.details: boolean?
		```
	**/
	var details : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.hl_name: boolean?
		```
	**/
	var hl_name : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.limit: integer?
		```
	**/
	var limit : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.overlap: boolean?
		```
	**/
	var overlap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.type: string?
		```
	**/
	var type : Null<String>;
}