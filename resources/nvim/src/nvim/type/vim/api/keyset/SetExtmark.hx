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
	extern public var conceal : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal_lines: string?
		```
	**/
	@:optional
	extern public var conceal_lines : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.cursorline_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern public var cursorline_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_col: integer?
		```
	**/
	@:optional
	extern public var end_col : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_line: integer?
		```
	**/
	@:optional
	extern public var end_line : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_right_gravity: boolean?
		```
	**/
	@:optional
	extern public var end_right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_row: integer?
		```
	**/
	@:optional
	extern public var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ephemeral: boolean?
		```
	**/
	@:optional
	extern public var ephemeral : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_eol: boolean?
		```
	**/
	@:optional
	extern public var hl_eol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_group: any
		```
	**/
	@:optional
	extern public var hl_group : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_mode: string?
		```
	**/
	@:optional
	extern public var hl_mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.id: integer?
		```
	**/
	@:optional
	extern public var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.invalidate: boolean?
		```
	**/
	@:optional
	extern public var invalidate : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.line_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern public var line_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.number_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern public var number_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.priority: integer?
		```
	**/
	@:optional
	extern public var priority : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.right_gravity: boolean?
		```
	**/
	@:optional
	extern public var right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.scoped: boolean?
		```
	**/
	@:optional
	extern public var scoped : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_hl_group: (string|integer)?
		```
	**/
	@:optional
	extern public var sign_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_text: string?
		```
	**/
	@:optional
	extern public var sign_text : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.spell: boolean?
		```
	**/
	@:optional
	extern public var spell : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.strict: boolean?
		```
	**/
	@:optional
	extern public var strict : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ui_watched: boolean?
		```
	**/
	@:optional
	extern public var ui_watched : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.undo_restore: boolean?
		```
	**/
	@:optional
	extern public var undo_restore : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.url: string?
		```
	**/
	@:optional
	extern public var url : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines: any[]?
		```
	**/
	@:optional
	extern public var virt_lines : Null<lua.Table<Int, Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_above: boolean?
		```
	**/
	@:optional
	extern public var virt_lines_above : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_leftcol: boolean?
		```
	**/
	@:optional
	extern public var virt_lines_leftcol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_overflow: string?
		```
	**/
	@:optional
	extern public var virt_lines_overflow : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text: any[]?
		```
	**/
	@:optional
	extern public var virt_text : Null<lua.Table<Int, Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_hide: boolean?
		```
	**/
	@:optional
	extern public var virt_text_hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_pos: string?
		```
	**/
	@:optional
	extern public var virt_text_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_repeat_linebreak: boolean?
		```
	**/
	@:optional
	extern public var virt_text_repeat_linebreak : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_win_col: integer?
		```
	**/
	@:optional
	extern public var virt_text_win_col : Null<Int>;
}