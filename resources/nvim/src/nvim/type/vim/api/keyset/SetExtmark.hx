package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.set_extmark
	```
**/
@:structInit extern class SetExtmark {
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal: string?
		```
	**/
	var conceal : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal_lines: string?
		```
	**/
	var conceal_lines : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.cursorline_hl_group: (string|integer)?
		```
	**/
	var cursorline_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_col: integer?
		```
	**/
	var end_col : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_line: integer?
		```
	**/
	var end_line : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_right_gravity: boolean?
		```
	**/
	var end_right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_row: integer?
		```
	**/
	var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ephemeral: boolean?
		```
	**/
	var ephemeral : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_eol: boolean?
		```
	**/
	var hl_eol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_group: any
		```
	**/
	var hl_group : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_mode: string?
		```
	**/
	var hl_mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.id: integer?
		```
	**/
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.invalidate: boolean?
		```
	**/
	var invalidate : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.line_hl_group: (string|integer)?
		```
	**/
	var line_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.number_hl_group: (string|integer)?
		```
	**/
	var number_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.priority: integer?
		```
	**/
	var priority : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.right_gravity: boolean?
		```
	**/
	var right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.scoped: boolean?
		```
	**/
	var scoped : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_hl_group: (string|integer)?
		```
	**/
	var sign_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_text: string?
		```
	**/
	var sign_text : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.spell: boolean?
		```
	**/
	var spell : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.strict: boolean?
		```
	**/
	var strict : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ui_watched: boolean?
		```
	**/
	var ui_watched : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.undo_restore: boolean?
		```
	**/
	var undo_restore : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.url: string?
		```
	**/
	var url : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines: any[]?
		```
	**/
	var virt_lines : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_above: boolean?
		```
	**/
	var virt_lines_above : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_leftcol: boolean?
		```
	**/
	var virt_lines_leftcol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_overflow: string?
		```
	**/
	var virt_lines_overflow : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text: any[]?
		```
	**/
	var virt_text : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_hide: boolean?
		```
	**/
	var virt_text_hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_pos: string?
		```
	**/
	var virt_text_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_repeat_linebreak: boolean?
		```
	**/
	var virt_text_repeat_linebreak : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_win_col: integer?
		```
	**/
	var virt_text_win_col : Null<Int>;
}