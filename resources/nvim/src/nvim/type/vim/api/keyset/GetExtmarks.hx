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
	extern public var details : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.hl_name: boolean?
		```
	**/
	@:optional
	extern public var hl_name : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.limit: integer?
		```
	**/
	@:optional
	extern public var limit : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.overlap: boolean?
		```
	**/
	@:optional
	extern public var overlap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.type: string?
		```
	**/
	@:optional
	extern public var type : Null<String>;
}