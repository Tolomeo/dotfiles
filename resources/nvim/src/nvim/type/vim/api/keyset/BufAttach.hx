package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.buf_attach
	```
**/
@:structInit class BufAttach {
	/**
		```lua
		(field) vim.api.keyset.buf_attach.on_bytes: fun(_: "bytes", bufnr: integer, changedtick: integer, start_row: integer, start_col: integer, start_byte: integer, old_end_row: integer, old_end_col: integer, old_end_byte: integer...(too long)...:boolean??
		```
		
		---
		
		```lua
		function (_: "bytes", bufnr: integer, changedtick: integer, start_row: integer, start_col: integer, start_byte: integer, old_end_row: integer, old_end_col: integer, old_end_byte: integer, new_end_row: integer, new_end_col: integer, new_end_byte: integer)
		  -> boolean?
		```
	**/
	@:optional
	extern public var on_bytes : Null<(_:String, bufnr:Int, changedtick:Int, start_row:Int, start_col:Int, start_byte:Int, old_end_row:Int, old_end_col:Int, old_end_byte:Int, new_end_row:Int, new_end_col:Int, new_end_byte:Int) -> Null<Bool>>;
	/**
		```lua
		(field) vim.api.keyset.buf_attach.on_changedtick: fun(_: "changedtick", bufnr: integer, changedtick: integer)?
		```
		
		---
		
		```lua
		function (_: "changedtick", bufnr: integer, changedtick: integer)
		```
	**/
	@:optional
	extern public var on_changedtick : Null<(_:String, bufnr:Int, changedtick:Int) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.buf_attach.on_detach: fun(_: "detach", bufnr: integer)?
		```
		
		---
		
		```lua
		function (_: "detach", bufnr: integer)
		```
	**/
	@:optional
	extern public var on_detach : Null<(_:String, bufnr:Int) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.buf_attach.on_lines: fun(_: "lines", bufnr: integer, changedtick: integer, first: integer, last_old: integer, last_new: integer, byte_count: integer, deleted_codepoints?: integer, deleted_codeunits?: integer):boolean??
		```
		
		---
		
		```lua
		function (_: "lines", bufnr: integer, changedtick: integer, first: integer, last_old: integer, last_new: integer, byte_count: integer, deleted_codepoints?: integer, deleted_codeunits?: integer)
		  -> boolean?
		```
	**/
	@:optional
	extern public var on_lines : Null<(_:String, bufnr:Int, changedtick:Int, first:Int, last_old:Int, last_new:Int, byte_count:Int, deleted_codepoints:Int, deleted_codeunits:Int) -> Null<Bool>>;
	/**
		```lua
		(field) vim.api.keyset.buf_attach.on_reload: fun(_: "reload", bufnr: integer)?
		```
		
		---
		
		```lua
		function (_: "reload", bufnr: integer)
		```
	**/
	@:optional
	extern public var on_reload : Null<(_:String, bufnr:Int) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.buf_attach.preview: boolean?
		```
	**/
	@:optional
	extern public var preview : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.buf_attach.utf_sizes: boolean?
		```
	**/
	@:optional
	extern public var utf_sizes : Null<Bool>;
}