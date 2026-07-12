package nvim.type.vim.lsp.util.open_floating_preview;

/**
	```lua
	(class) vim.lsp.util.open_floating_preview.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts._update_win: integer?
		```
	**/
	@:optional
	extern public var _update_win : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.anchor_bias: ('above'|'auto'|'below')?
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
	@:optional
	extern public var anchor_bias : Null<String>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.border: (string|(string|[string, string])[])?
		```
		
		---
		
		override `border`
	**/
	@:optional
	extern public var border : Null<haxe.extern.EitherType<String, lua.Table<Int, Dynamic>>>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.close_events: table?
		```
		
		---
		
		
		 List of events that closes the floating window
	**/
	@:optional
	extern public var close_events : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.focus: boolean?
		```
		
		---
		
		
		 If `true`, and if {focusable} is also `true`, focus an existing floating
		 window with the same {focus_id}
		 (default: `true`)
	**/
	@:optional
	extern public var focus : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.focus_id: string?
		```
		
		---
		
		
		 If a popup with this id is opened, then focus it
	**/
	@:optional
	extern public var focus_id : Null<String>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.focusable: boolean?
		```
		
		---
		
		
		 Make float focusable.
		 (default: `true`)
	**/
	@:optional
	extern public var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.height: integer?
		```
		
		---
		
		
		 Height of floating window
	**/
	@:optional
	extern public var height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.max_height: integer?
		```
		
		---
		
		
		 Maximal height of floating window
	**/
	@:optional
	extern public var max_height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.max_width: integer?
		```
		
		---
		
		
		 Maximal width of floating window
	**/
	@:optional
	extern public var max_width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.offset_x: integer?
		```
		
		---
		
		
		 offset to add to `col`
	**/
	@:optional
	extern public var offset_x : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.offset_y: integer?
		```
		
		---
		
		
		 offset to add to `row`
	**/
	@:optional
	extern public var offset_y : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.relative: ('cursor'|'editor'|'mouse')?
		```
		
		---
		
		
		 (default: `'cursor'`)
	**/
	@:optional
	extern public var relative : Null<String>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.title: (string|[string, string][])?
		```
	**/
	@:optional
	extern public var title : Null<String>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.title_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	extern public var title_pos : Null<String>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.width: integer?
		```
		
		---
		
		
		 Width of floating window
	**/
	@:optional
	extern public var width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.wrap: boolean?
		```
		
		---
		
		
		 Wrap long lines
		 (default: `true`)
	**/
	@:optional
	extern public var wrap : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.wrap_at: integer?
		```
		
		---
		
		
		 Character to wrap at for computing height when wrap is enabled
	**/
	@:optional
	extern public var wrap_at : Null<Int>;
	/**
		```lua
		(field) vim.lsp.util.open_floating_preview.Opts.zindex: integer?
		```
		
		---
		
		override `zindex`, defaults to 50
	**/
	@:optional
	extern public var zindex : Null<Int>;
}