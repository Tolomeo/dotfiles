package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.eval_statusline
	```
**/
@:structInit class EvalStatusline {
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.fillchar: string?
		```
	**/
	@:optional
	extern var fillchar : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.highlights: boolean?
		```
	**/
	@:optional
	extern var highlights : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.maxwidth: integer?
		```
	**/
	@:optional
	extern var maxwidth : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_statuscol_lnum: integer?
		```
	**/
	@:optional
	extern var use_statuscol_lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_tabline: boolean?
		```
	**/
	@:optional
	extern var use_tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_winbar: boolean?
		```
	**/
	@:optional
	extern var use_winbar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.winid: integer?
		```
	**/
	@:optional
	extern var winid : Null<Int>;
}