package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.win_text_height
	```
**/
@:structInit class WinTextHeight {
	/**
		```lua
		(field) vim.api.keyset.win_text_height.end_row: integer?
		```
	**/
	@:optional
	extern public var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.end_vcol: integer?
		```
	**/
	@:optional
	extern public var end_vcol : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.start_row: integer?
		```
	**/
	@:optional
	extern public var start_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.start_vcol: integer?
		```
	**/
	@:optional
	extern public var start_vcol : Null<Int>;
}