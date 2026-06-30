package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_extmark
	```
**/
@:structInit class GetExtmark {
	/**
		```lua
		(field) vim.api.keyset.get_extmark.details: boolean?
		```
	**/
	@:optional
	extern public var details : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmark.hl_name: boolean?
		```
	**/
	@:optional
	extern public var hl_name : Null<Bool>;
}