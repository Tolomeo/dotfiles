package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.set_decoration_provider
	```
**/
@:structInit class SetDecorationProvider {
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider._on_conceal_line: fun(_: "conceal_line")?
		```
		
		---
		
		```lua
		function (_: "conceal_line")
		```
	**/
	@:optional
	extern public var _on_conceal_line : Null<(_:String) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider._on_hl_def: fun(_: "hl_def")?
		```
		
		---
		
		```lua
		function (_: "hl_def")
		```
	**/
	@:optional
	extern public var _on_hl_def : Null<(_:String) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider._on_spell_nav: fun(_: "spell_nav")?
		```
		
		---
		
		```lua
		function (_: "spell_nav")
		```
	**/
	@:optional
	extern public var _on_spell_nav : Null<(_:String) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider.on_buf: fun(_: "buf", bufnr: integer, tick: integer)?
		```
		
		---
		
		```lua
		function (_: "buf", bufnr: integer, tick: integer)
		```
	**/
	@:optional
	extern public var on_buf : Null<(_:String, bufnr:Float, tick:Float) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider.on_end: fun(_: "end", tick: integer)?
		```
		
		---
		
		```lua
		function (_: "end", tick: integer)
		```
	**/
	@:optional
	extern public var on_end : Null<(_:String, tick:Float) -> Dynamic>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider.on_line: fun(_: "line", winid: integer, bufnr: integer, row: integer):boolean??
		```
		
		---
		
		```lua
		function (_: "line", winid: integer, bufnr: integer, row: integer)
		  -> boolean?
		```
	**/
	@:optional
	extern public var on_line : Null<(_:String, winid:Float, bufnr:Float, row:Float) -> Null<Bool>>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider.on_start: fun(_: "start", tick: integer):boolean??
		```
		
		---
		
		```lua
		function (_: "start", tick: integer)
		  -> boolean?
		```
	**/
	@:optional
	extern public var on_start : Null<(_:String, tick:Float) -> Null<Bool>>;
	/**
		```lua
		(field) vim.api.keyset.set_decoration_provider.on_win: fun(_: "win", winid: integer, bufnr: integer, toprow: integer, botrow: integer):boolean??
		```
		
		---
		
		```lua
		function (_: "win", winid: integer, bufnr: integer, toprow: integer, botrow: integer)
		  -> boolean?
		```
	**/
	@:optional
	extern public var on_win : Null<(_:String, winid:Float, bufnr:Float, toprow:Float, botrow:Float) -> Null<Bool>>;
}