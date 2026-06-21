package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_extmarks
	```
**/
@:structInit class GetExtmarks {
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.details: boolean?
		```
	**/
	@:optional
	extern var details : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.hl_name: boolean?
		```
	**/
	@:optional
	extern var hl_name : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.limit: integer?
		```
	**/
	@:optional
	extern var limit : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.overlap: boolean?
		```
	**/
	@:optional
	extern var overlap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.type: string?
		```
	**/
	@:optional
	extern var type : Null<String>;
}