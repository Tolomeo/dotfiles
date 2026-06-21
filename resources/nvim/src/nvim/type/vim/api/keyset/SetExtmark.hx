package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.set_extmark
	```
**/
@:structInit class SetExtmark {
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal: string?
		```
	**/
	@:optional
	extern var conceal : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal_lines: string?
		```
	**/
	@:optional
	extern var conceal_lines : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.cursorline_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern var cursorline_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_col: integer?
		```
	**/
	@:optional
	extern var end_col : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_line: integer?
		```
	**/
	@:optional
	extern var end_line : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_right_gravity: boolean?
		```
	**/
	@:optional
	extern var end_right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_row: integer?
		```
	**/
	@:optional
	extern var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ephemeral: boolean?
		```
	**/
	@:optional
	extern var ephemeral : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_eol: boolean?
		```
	**/
	@:optional
	extern var hl_eol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_group: any
		```
	**/
	@:optional
	extern var hl_group : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_mode: string?
		```
	**/
	@:optional
	extern var hl_mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.invalidate: boolean?
		```
	**/
	@:optional
	extern var invalidate : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.line_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern var line_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.number_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern var number_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.priority: integer?
		```
	**/
	@:optional
	extern var priority : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.right_gravity: boolean?
		```
	**/
	@:optional
	extern var right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.scoped: boolean?
		```
	**/
	@:optional
	extern var scoped : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern var sign_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_text: string?
		```
	**/
	@:optional
	extern var sign_text : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.spell: boolean?
		```
	**/
	@:optional
	extern var spell : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.strict: boolean?
		```
	**/
	@:optional
	extern var strict : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ui_watched: boolean?
		```
	**/
	@:optional
	extern var ui_watched : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.undo_restore: boolean?
		```
	**/
	@:optional
	extern var undo_restore : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.url: string?
		```
	**/
	@:optional
	extern var url : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines: any[]?
		```
	**/
	@:optional
	extern var virt_lines : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_above: boolean?
		```
	**/
	@:optional
	extern var virt_lines_above : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_leftcol: boolean?
		```
	**/
	@:optional
	extern var virt_lines_leftcol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_overflow: string?
		```
	**/
	@:optional
	extern var virt_lines_overflow : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text: any[]?
		```
	**/
	@:optional
	extern var virt_text : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_hide: boolean?
		```
	**/
	@:optional
	extern var virt_text_hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_pos: string?
		```
	**/
	@:optional
	extern var virt_text_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_repeat_linebreak: boolean?
		```
	**/
	@:optional
	extern var virt_text_repeat_linebreak : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_win_col: integer?
		```
	**/
	@:optional
	extern var virt_text_win_col : Null<Int>;
}