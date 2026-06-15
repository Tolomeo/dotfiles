package nvim.type.vim.lsp.buf.signature_help;

/**
	```lua
	(class) vim.lsp.buf.signature_help.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts._update_win: integer?
		```
	**/
	var _update_win : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.anchor_bias: ('above'|'auto'|'below')?
		```
		
		---
		
		
		 Adjusts placement relative to cursor.
		 - "auto": place window based on which side of the cursor has more lines
		 - "above": place the window above the cursor unless there are not enough lines
		   to display the full window height.
		 - "below": place the window below the cursor unless there are not enough lines
		   to display the full window height.
		 (default: `'auto'`)
	**/
	var anchor_bias : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.border: (string|(string|[string, string])[])?
		```
		
		---
		
		override `border`
	**/
	var border : Null<haxe.extern.EitherType<String, Array<Dynamic>>>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.close_events: table?
		```
		
		---
		
		
		 List of events that closes the floating window
	**/
	var close_events : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.focus: boolean?
		```
		
		---
		
		
		 If `true`, and if {focusable} is also `true`, focus an existing floating
		 window with the same {focus_id}
		 (default: `true`)
	**/
	var focus : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.focus_id: string?
		```
		
		---
		
		
		 If a popup with this id is opened, then focus it
	**/
	var focus_id : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.focusable: boolean?
		```
		
		---
		
		
		 Make float focusable.
		 (default: `true`)
	**/
	var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.height: integer?
		```
		
		---
		
		
		 Height of floating window
	**/
	var height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.max_height: integer?
		```
		
		---
		
		
		 Maximal height of floating window
	**/
	var max_height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.max_width: integer?
		```
		
		---
		
		
		 Maximal width of floating window
	**/
	var max_width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.offset_x: integer?
		```
		
		---
		
		
		 offset to add to `col`
	**/
	var offset_x : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.offset_y: integer?
		```
		
		---
		
		
		 offset to add to `row`
	**/
	var offset_y : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.relative: ('cursor'|'editor'|'mouse')?
		```
		
		---
		
		
		 (default: `'cursor'`)
	**/
	var relative : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.silent: boolean?
		```
	**/
	var silent : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.title: (string|[string, string][])?
		```
	**/
	var title : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.title_pos: ('center'|'left'|'right')?
		```
	**/
	var title_pos : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.width: integer?
		```
		
		---
		
		
		 Width of floating window
	**/
	var width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.wrap: boolean?
		```
		
		---
		
		
		 Wrap long lines
		 (default: `true`)
	**/
	var wrap : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.wrap_at: integer?
		```
		
		---
		
		
		 Character to wrap at for computing height when wrap is enabled
	**/
	var wrap_at : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.signature_help.Opts.zindex: integer?
		```
		
		---
		
		override `zindex`, defaults to 50
	**/
	var zindex : Null<Int>;
}