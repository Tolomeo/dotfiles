package nvim.module.vim;

/**
	```lua
	(global) vim.diagnostic.handlers: table<string, vim.diagnostic.Handler>
	```
	
	---
	
	 @nodoc
**/
extern class Handlers {

}

/**
	```lua
	(global) vim.diagnostic.severity: enum vim.diagnostic.Severity
	```
**/
extern class Severity {
	var E : nvim.type.vim.diagnostic.Severity;
	var ERROR : nvim.type.vim.diagnostic.Severity;
	var HINT : nvim.type.vim.diagnostic.Severity;
	var I : nvim.type.vim.diagnostic.Severity;
	var INFO : nvim.type.vim.diagnostic.Severity;
	var N : nvim.type.vim.diagnostic.Severity;
	var W : nvim.type.vim.diagnostic.Severity;
	var WARN : nvim.type.vim.diagnostic.Severity;
}

extern class Diagnostic {
	/**
		```lua
		function M.config(opts?: vim.diagnostic.Opts, namespace?: integer)
		  -> (vim.diagnostic.Opts)?
		```
		
		---
		
		 Configure diagnostic options globally or for a specific diagnostic
		 namespace.
		
		 Configuration can be specified globally, per-namespace, or ephemerally
		 (i.e. only for a single call to |vim.diagnostic.set()| or
		 |vim.diagnostic.show()|). Ephemeral configuration has highest priority,
		 followed by namespace configuration, and finally global configuration.
		
		 For example, if a user enables virtual text globally with
		
		 ```lua
		 vim.diagnostic.config({ virtual_text = true })
		 ```
		
		 and a diagnostic producer sets diagnostics with
		
		 ```lua
		 vim.diagnostic.set(ns, 0, diagnostics, { virtual_text = false })
		 ```
		
		 then virtual text will not be enabled for those diagnostics.
		
		@*param* `opts` — When omitted or `nil`, retrieve the current
		
		       configuration. Otherwise, a configuration table (see |vim.diagnostic.Opts|).
		
		@*param* `namespace` — Update the options for the given namespace.
		
		                          When omitted, update the global diagnostic options.
		
		@*return* — : Current diagnostic config if {opts} is omitted.
	**/
	@:luaDotMethod
	function config(?opts:Null<nvim.type.vim.diagnostic.Opts>, ?namespace:Null<Int>):Null<nvim.type.vim.diagnostic.Opts>;
	/**
		```lua
		function M.count(bufnr?: integer, opts?: vim.diagnostic.GetOpts)
		  -> table
		```
		
		---
		
		 Get current diagnostics count.
		
		@*param* `bufnr` — Buffer number to get diagnostics from. Use 0 for
		
		                      current buffer or nil for all buffers.
		
		@*return* — : Table with actually present severity values as keys
		
		                (see |diagnostic-severity|) and integer counts as values.
	**/
	@:luaDotMethod
	function count(?bufnr:Int, ?opts:nvim.type.vim.diagnostic.GetOpts):lua.Table.AnyTable;
	/**
		```lua
		function M.disable(bufnr: any, namespace: any)
		```
	**/
	@:luaDotMethod
	@:deprecated
	function disable(bufnr:Dynamic, namespace:Dynamic):Dynamic;
	/**
		```lua
		function M.enable(enable: boolean|nil, filter?: vim.diagnostic.Filter)
		```
		
		---
		
		 Enables or disables diagnostics.
		
		 To "toggle", pass the inverse of `is_enabled()`:
		
		 ```lua
		 vim.diagnostic.enable(not vim.diagnostic.is_enabled())
		 ```
		
		@*param* `enable` — true/nil to enable, false to disable
	**/
	@:luaDotMethod
	function enable(?enable:Null<Bool>, ?filter:Null<nvim.type.vim.diagnostic.Filter>):Dynamic;
	/**
		```lua
		function M.fromqflist(list: table[])
		  -> vim.Diagnostic[]
		```
		
		---
		
		 Convert a list of quickfix items to a list of diagnostics.
		
		@*param* `list` — List of quickfix items from |getqflist()| or |getloclist()|.
	**/
	@:luaDotMethod
	function fromqflist(list:Array<lua.Table.AnyTable>):Array<nvim.type.vim.Diagnostic>;
	/**
		```lua
		function M.get(bufnr?: integer, opts?: vim.diagnostic.GetOpts)
		  -> vim.Diagnostic[]
		```
		
		---
		
		 Get current diagnostics.
		
		 Modifying diagnostics in the returned table has no effect.
		 To set diagnostics in a buffer, use |vim.diagnostic.set()|.
		
		@*param* `bufnr` — Buffer number to get diagnostics from. Use 0 for
		
		                      current buffer or nil for all buffers.
		
		@*return* — : Fields `bufnr`, `end_lnum`, `end_col`, and `severity`
		
		                           are guaranteed to be present.
	**/
	@:luaDotMethod
	function get(?bufnr:Null<Int>, ?opts:nvim.type.vim.diagnostic.GetOpts):Array<nvim.type.vim.Diagnostic>;
	/**
		```lua
		function M.get_namespace(namespace: integer)
		  -> vim.diagnostic.NS
		```
		
		---
		
		 Get namespace metadata.
		
		@*param* `namespace` — Diagnostic namespace
		
		@*return* — : Namespace metadata
	**/
	@:luaDotMethod
	function get_namespace(namespace:Int):nvim.type.vim.diagnostic.NS;
	/**
		```lua
		function M.get_namespaces()
		  -> table<integer, vim.diagnostic.NS>
		```
		
		---
		
		 Get current diagnostic namespaces.
		
		@*return* — : List of active diagnostic namespaces |vim.diagnostic|.
	**/
	@:luaDotMethod
	function get_namespaces():lua.Table<Int, nvim.type.vim.diagnostic.NS>;
	/**
		```lua
		function M.get_next(opts?: vim.diagnostic.JumpOpts)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Get the next diagnostic closest to the cursor position.
		
		@*return* — : Next diagnostic
	**/
	@:luaDotMethod
	function get_next(?opts:nvim.type.vim.diagnostic.JumpOpts):Null<nvim.type.vim.Diagnostic>;
	/**
		```lua
		function M.get_next_pos(opts?: vim.diagnostic.JumpOpts)
		  -> table|false
		```
		
		---
		
		 Return the position of the next diagnostic in the current buffer.
		
		@*return* — : Next diagnostic position as a `(row, col)` tuple or false if no next
		
		                      diagnostic.
		
		```lua
		return #1:
		    | false
		```
	**/
	@:luaDotMethod
	@:deprecated
	function get_next_pos(?opts:nvim.type.vim.diagnostic.JumpOpts):haxe.extern.EitherType<lua.Table.AnyTable, Bool>;
	/**
		```lua
		function M.get_prev(opts?: vim.diagnostic.JumpOpts)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Get the previous diagnostic closest to the cursor position.
		
		@*return* — : Previous diagnostic
	**/
	@:luaDotMethod
	function get_prev(?opts:nvim.type.vim.diagnostic.JumpOpts):Null<nvim.type.vim.Diagnostic>;
	/**
		```lua
		function M.get_prev_pos(opts?: vim.diagnostic.JumpOpts)
		  -> table|false
		```
		
		---
		
		 Return the position of the previous diagnostic in the current buffer.
		
		@*return* — : Previous diagnostic position as a `(row, col)` tuple
		
		                     or `false` if there is no prior diagnostic.
		
		```lua
		return #1:
		    | false
		```
	**/
	@:luaDotMethod
	@:deprecated
	function get_prev_pos(?opts:nvim.type.vim.diagnostic.JumpOpts):haxe.extern.EitherType<lua.Table.AnyTable, Bool>;
	/**
		```lua
		function M.goto_next(opts?: vim.diagnostic.JumpOpts)
		```
		
		---
		
		 Move to the next diagnostic.
	**/
	@:luaDotMethod
	@:deprecated
	function goto_next(?opts:nvim.type.vim.diagnostic.JumpOpts):Dynamic;
	/**
		```lua
		function M.goto_prev(opts?: vim.diagnostic.JumpOpts)
		```
		
		---
		
		 Move to the previous diagnostic in the current buffer.
	**/
	@:luaDotMethod
	@:deprecated
	function goto_prev(?opts:nvim.type.vim.diagnostic.JumpOpts):Dynamic;
	/**
		```lua
		function M.hide(namespace?: integer, bufnr?: integer)
		```
		
		---
		
		 Hide currently displayed diagnostics.
		
		 This only clears the decorations displayed in the buffer. Diagnostics can
		 be redisplayed with |vim.diagnostic.show()|. To completely remove
		 diagnostics, use |vim.diagnostic.reset()|.
		
		 To hide diagnostics and prevent them from re-displaying, use
		 |vim.diagnostic.enable()|.
		
		@*param* `namespace` — Diagnostic namespace. When omitted, hide
		
		                          diagnostics from all namespaces.
		
		@*param* `bufnr` — Buffer number, or 0 for current buffer. When
		
		                      omitted, hide diagnostics in all buffers.
	**/
	@:luaDotMethod
	function hide(?namespace:Null<Int>, ?bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.is_disabled(bufnr: any, namespace: any)
		  -> boolean
		```
	**/
	@:luaDotMethod
	@:deprecated
	function is_disabled(bufnr:Dynamic, namespace:Dynamic):Dynamic;
	/**
		```lua
		function M.is_enabled(filter?: vim.diagnostic.Filter)
		  -> boolean
		```
		
		---
		
		 Check whether diagnostics are enabled.
		
		 @since 12
	**/
	@:luaDotMethod
	function is_enabled(?filter:Null<nvim.type.vim.diagnostic.Filter>):Bool;
	/**
		```lua
		function M.jump(opts: vim.diagnostic.JumpOpts)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Move to a diagnostic.
		
		@*return* — The diagnostic that was moved to.
	**/
	@:luaDotMethod
	function jump(opts:nvim.type.vim.diagnostic.JumpOpts):Null<nvim.type.vim.Diagnostic>;
	/**
		```lua
		function M.match(str: string, pat: string, groups: string[], severity_map: table, defaults?: table)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Parse a diagnostic from a string.
		
		 For example, consider a line of output from a linter:
		
		 ```
		 WARNING filename:27:3: Variable 'foo' does not exist
		 ```
		
		 This can be parsed into |vim.Diagnostic| structure with:
		
		 ```lua
		 local s = "WARNING filename:27:3: Variable 'foo' does not exist"
		 local pattern = "^(%w+) %w+:(%d+):(%d+): (.+)$"
		 local groups = { "severity", "lnum", "col", "message" }
		 vim.diagnostic.match(s, pattern, groups, { WARNING = vim.diagnostic.WARN })
		 ```
		
		@*param* `str` — String to parse diagnostics from.
		
		@*param* `pat` — Lua pattern with capture groups.
		
		@*param* `groups` — List of fields in a |vim.Diagnostic| structure to
		
		                    associate with captures from {pat}.
		
		@*param* `severity_map` — A table mapping the severity field from {groups}
		
		                          with an item from |vim.diagnostic.severity|.
		
		@*param* `defaults` — Table of default values for any fields not listed in {groups}.
		
		                       When omitted, numeric values default to 0 and "severity" defaults to
		                       ERROR.
		
		@*return* — : |vim.Diagnostic| structure or `nil` if {pat} fails to match {str}.
	**/
	@:luaDotMethod
	function match(str:String, pat:String, groups:Array<String>, severity_map:lua.Table.AnyTable, ?defaults:Null<lua.Table.AnyTable>):Null<nvim.type.vim.Diagnostic>;
	/**
		```lua
		function M.open_float(opts?: vim.diagnostic.Opts.Float, ...any)
		  -> float_bufnr: integer?
		  2. winid: integer?
		```
		
		---
		
		 Show diagnostics in a floating window.
	**/
	@:luaDotMethod
	function open_float(?opts:Null<nvim.type.vim.diagnostic.opts.Float>, ___:haxe.Rest<Dynamic>):nvim.helper.Multireturn<Null<Int>, Null<Int>, Void, Void, Void, Void>;
	/**
		```lua
		function M.reset(namespace?: integer, bufnr?: integer)
		```
		
		---
		
		 Remove all diagnostics from the given namespace.
		
		 Unlike |vim.diagnostic.hide()|, this function removes all saved
		 diagnostics. They cannot be redisplayed using |vim.diagnostic.show()|. To
		 simply remove diagnostic decorations in a way that they can be
		 re-displayed, use |vim.diagnostic.hide()|.
		
		@*param* `namespace` — Diagnostic namespace. When omitted, remove
		
		                          diagnostics from all namespaces.
		
		@*param* `bufnr` — Remove diagnostics for the given buffer. When omitted,
		
		                     diagnostics are removed for all buffers.
	**/
	@:luaDotMethod
	function reset(?namespace:Null<Int>, ?bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.set(namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.Opts)
		```
		
		---
		
		 Set diagnostics for the given namespace and buffer.
		
		@*param* `namespace` — The diagnostic namespace
		
		@*param* `bufnr` — Buffer number
		
		@*param* `opts` — Display options to pass to |vim.diagnostic.show()|
	**/
	@:luaDotMethod
	function set(namespace:Int, bufnr:Int, diagnostics:Array<nvim.type.vim.Diagnostic>, ?opts:nvim.type.vim.diagnostic.Opts):Dynamic;
	/**
		```lua
		function M.setloclist(opts?: vim.diagnostic.setloclist.Opts)
		```
		
		---
		
		 Add buffer diagnostics to the location list.
	**/
	@:luaDotMethod
	function setloclist(?opts:nvim.type.vim.diagnostic.setloclist.Opts):Dynamic;
	/**
		```lua
		function M.setqflist(opts?: vim.diagnostic.setqflist.Opts)
		```
		
		---
		
		 Add all diagnostics to the quickfix list.
	**/
	@:luaDotMethod
	function setqflist(?opts:nvim.type.vim.diagnostic.setqflist.Opts):Dynamic;
	/**
		```lua
		function M.show(namespace?: integer, bufnr?: integer, diagnostics?: vim.Diagnostic[], opts?: vim.diagnostic.Opts)
		```
		
		---
		
		 Display diagnostics for the given namespace and buffer.
		
		@*param* `namespace` — Diagnostic namespace. When omitted, show
		
		                          diagnostics from all namespaces.
		
		@*param* `bufnr` — Buffer number, or 0 for current buffer. When omitted, show
		
		                      diagnostics in all buffers.
		
		@*param* `diagnostics` — The diagnostics to display. When omitted, use the
		
		                             saved diagnostics for the given namespace and
		                             buffer. This can be used to display a list of diagnostics
		                             without saving them or to display only a subset of
		                             diagnostics. May not be used when {namespace}
		                             or {bufnr} is nil.
		
		@*param* `opts` — Display options.
	**/
	@:luaDotMethod
	function show(?namespace:Null<Int>, ?bufnr:Null<Int>, ?diagnostics:Null<Array<nvim.type.vim.Diagnostic>>, ?opts:nvim.type.vim.diagnostic.Opts):Dynamic;
	/**
		```lua
		function M.toqflist(diagnostics: vim.Diagnostic[])
		  -> table[]
		```
		
		---
		
		 Convert a list of diagnostics to a list of quickfix items that can be
		 passed to |setqflist()| or |setloclist()|.
		
		@*return* — : Quickfix list items |setqflist-what|
	**/
	@:luaDotMethod
	function toqflist(diagnostics:Array<nvim.type.vim.Diagnostic>):Array<lua.Table.AnyTable>;
}