package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.eval_statusline
	```
**/
@:structInit extern class EvalStatusline {
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.fillchar: string?
		```
	**/
	var fillchar : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.highlights: boolean?
		```
	**/
	var highlights : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.maxwidth: integer?
		```
	**/
	var maxwidth : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_statuscol_lnum: integer?
		```
	**/
	var use_statuscol_lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_tabline: boolean?
		```
	**/
	var use_tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_winbar: boolean?
		```
	**/
	var use_winbar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.winid: integer?
		```
	**/
	var winid : Null<Int>;
}