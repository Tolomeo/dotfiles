package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.win_text_height
	```
**/
@:structInit extern class WinTextHeight {
	/**
		```lua
		(field) vim.api.keyset.win_text_height.end_row: integer?
		```
	**/
	var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.end_vcol: integer?
		```
	**/
	var end_vcol : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.start_row: integer?
		```
	**/
	var start_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.start_vcol: integer?
		```
	**/
	var start_vcol : Null<Int>;
}