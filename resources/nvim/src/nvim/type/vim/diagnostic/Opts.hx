package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.Opts
	```
	
	---
	
	 Many of the configuration options below accept one of the following:
	 - `false`: Disable this feature
	 - `true`: Enable this feature, use default settings.
	 - `table`: Enable this feature with overrides. Use an empty table to use default values.
	 - `function`: Function with signature (namespace, bufnr) that returns any of the above.
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.diagnostic.Opts.float: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.Float|vim.diagnostic.Opts.Float)?
		```
		
		---
		
		
		 Options for floating windows. See |vim.diagnostic.Opts.Float|.
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.Float
		```
	**/
	var float : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<nvim.type.vim.diagnostic.opts.Float, (namespace:Int, bufnr:Int) -> nvim.type.vim.diagnostic.opts.Float>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.jump: (vim.diagnostic.Opts.Jump)?
		```
		
		---
		
		
		 Default values for |vim.diagnostic.jump()|. See |vim.diagnostic.Opts.Jump|.
	**/
	var jump : Null<nvim.type.vim.diagnostic.opts.Jump>;
	/**
		```lua
		(field) vim.diagnostic.Opts.severity_sort: (boolean|{ reverse: boolean })?
		```
		
		---
		
		
		 Sort diagnostics by severity. This affects the order in which signs,
		 virtual text, and highlights are displayed. When true, higher severities are
		 displayed before lower severities (e.g. ERROR is displayed before WARN).
		 Options:
		   - {reverse}? (boolean) Reverse sort order
		 (default: `false`)
	**/
	var severity_sort : Null<haxe.extern.EitherType<Bool, { var reverse : Null<Bool>; }>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.signs: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.Signs|vim.diagnostic.Opts.Signs)?
		```
		
		---
		
		
		 Use signs for diagnostics |diagnostic-signs|.
		 (default: `true`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.Signs
		```
	**/
	var signs : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<nvim.type.vim.diagnostic.opts.Signs, (namespace:Int, bufnr:Int) -> nvim.type.vim.diagnostic.opts.Signs>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.underline: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.Underline|vim.diagnostic.Opts.Underline)?
		```
		
		---
		
		
		 Use underline for diagnostics.
		 (default: `true`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.Underline
		```
	**/
	var underline : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<nvim.type.vim.diagnostic.opts.Underline, (namespace:Int, bufnr:Int) -> nvim.type.vim.diagnostic.opts.Underline>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.update_in_insert: boolean?
		```
		
		---
		
		
		 Update diagnostics in Insert mode
		 (if `false`, diagnostics are updated on |InsertLeave|)
		 (default: `false`)
	**/
	var update_in_insert : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.Opts.virtual_lines: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.VirtualLines|vim.diagnostic.Opts.VirtualLines)?
		```
		
		---
		
		
		 Use virtual lines for diagnostics.
		 (default: `false`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.VirtualLines
		```
	**/
	var virtual_lines : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<nvim.type.vim.diagnostic.opts.VirtualLines, (namespace:Int, bufnr:Int) -> nvim.type.vim.diagnostic.opts.VirtualLines>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.virtual_text: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.VirtualText|vim.diagnostic.Opts.VirtualText)?
		```
		
		---
		
		
		 Use virtual text for diagnostics. If multiple diagnostics are set for a
		 namespace, one prefix per diagnostic + the last diagnostic message are
		 shown.
		 (default: `false`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.VirtualText
		```
	**/
	var virtual_text : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<nvim.type.vim.diagnostic.opts.VirtualText, (namespace:Int, bufnr:Int) -> nvim.type.vim.diagnostic.opts.VirtualText>>>;
}