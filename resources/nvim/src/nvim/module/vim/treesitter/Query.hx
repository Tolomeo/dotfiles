package nvim.module.vim.treesitter;

extern class Query {
	@:native("add_directive")
	@:luaDotMethod
	private function __add_directive(name:String, handler:(match:lua.Table<Float, lua.Table<Int, nvim.type.TSNode>>, pattern:Float, source:haxe.extern.EitherType<Float, String>, predicate:lua.Table<Int, Any>, metadata:nvim.type.vim.treesitter.query.TSMetadata) -> Dynamic, opts:nvim.type.vim.treesitter.query.add_predicate.Opts):Dynamic;
	/**
		```lua
		function M.add_directive(name: string, handler: fun(match: table<integer, TSNode[]>, pattern: integer, source: string|integer, predicate: any[], metadata: vim.treesitter.query.TSMetadata), opts: vim.treesitter.query.add_predicate.Opts)
		```
		
		---
		
		 Adds a new directive to be used in queries
		
		 Handlers can set match level data by setting directly on the
		 metadata object `metadata.key = value`. Additionally, handlers
		 can set node level data by using the capture id on the
		 metadata table `metadata[capture_id].key = value`
		
		@*param* `name` — Name of the directive, without leading #
		
		   - pattern: the index of the matching pattern in the query file
		   - predicate: list of strings containing the full directive being called, e.g.
		     `(node (#set! conceal "-"))` would get the predicate `{ "#set!", "conceal", "-" }`
	**/
	@:luaDotMethod
	inline function add_directive(name:String, handler:(match:lua.Table<Float, lua.Table<Int, nvim.type.TSNode>>, pattern:Float, source:haxe.extern.EitherType<Float, String>, predicate:lua.Table<Int, Any>, metadata:nvim.type.vim.treesitter.query.TSMetadata) -> Dynamic, opts:nvim.type.vim.treesitter.query.add_predicate.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __add_directive(name, handler, opts);
		return result;
	}
	@:native("add_predicate")
	@:luaDotMethod
	private function __add_predicate(name:String, handler:(match:lua.Table<Float, lua.Table<Int, nvim.type.TSNode>>, pattern:Float, source:haxe.extern.EitherType<Float, String>, predicate:lua.Table<Int, Any>, metadata:nvim.type.vim.treesitter.query.TSMetadata) -> Null<Bool>, ?opts:nvim.type.vim.treesitter.query.add_predicate.Opts):Dynamic;
	/**
		```lua
		function M.add_predicate(name: string, handler: fun(match: table<integer, TSNode[]>, pattern: integer, source: string|integer, predicate: any[], metadata: vim.treesitter.query.TSMetadata):boolean?, opts?: vim.treesitter.query.add_predicate.Opts)
		```
		
		---
		
		 Adds a new predicate to be used in queries
		
		@*param* `name` — Name of the predicate, without leading #
		
		   - see |vim.treesitter.query.add_directive()| for argument meanings
	**/
	@:luaDotMethod
	inline function add_predicate(name:String, handler:(match:lua.Table<Float, lua.Table<Int, nvim.type.TSNode>>, pattern:Float, source:haxe.extern.EitherType<Float, String>, predicate:lua.Table<Int, Any>, metadata:nvim.type.vim.treesitter.query.TSMetadata) -> Null<Bool>, ?opts:nvim.type.vim.treesitter.query.add_predicate.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __add_predicate(name, handler, opts);
		return result;
	}
	/**
		```lua
		function M.edit(lang?: string)
		```
		
		---
		
		 Opens a live editor to query the buffer you started from.
		
		 Can also be shown with [:EditQuery](file:///usr/local/share/nvim/runtime/lua/vim/treesitter).
		
		 If you move the cursor to a capture name ("@foo"), text matching the capture is highlighted in
		 the source buffer. The query editor is a scratch buffer, use `:write` to save it. You can find
		 example queries at `$VIMRUNTIME/queries/`.
		
		@*param* `lang` — language to open the query editor for. If omitted, inferred from the current buffer's filetype.
	**/
	@:luaDotMethod
	function edit(?lang:String):Dynamic;
	/**
		```lua
		function (lang: string, query_name: string)
		  -> (vim.treesitter.Query)?
		```
		
		---
		
		@*param* `lang` — Language to use for the query
		
		@*param* `query_name` — Name of the query (e.g. "highlights")
		
		@*return* — : Parsed query. `nil` if no query files are found.
	**/
	@:luaDotMethod
	function get(lang:String, query_name:String):Null<nvim.type.vim.treesitter.Query>;
	/**
		```lua
		function M.get_files(lang: string, query_name: string, is_included?: boolean)
		  -> query_files: string[]
		```
		
		---
		
		 Gets the list of files used to make up a query
		
		@*param* `lang` — Language to get query for
		
		@*param* `query_name` — Name of the query to load (e.g., "highlights")
		
		@*param* `is_included` — Internal parameter, most of the time left as `nil`
		
		@*return* `query_files` — List of files to load for given query and language
	**/
	@:luaDotMethod
	function get_files(lang:String, query_name:String, ?is_included:Bool):lua.Table<Int, String>;
	@:native("lint")
	@:luaDotMethod
	private function __lint(buf:Float, ?opts:nvim.type.vim.treesitter.query.lint.Opts):Dynamic;
	/**
		```lua
		function M.lint(buf: integer, opts?: vim.treesitter.query.lint.Opts)
		```
		
		---
		
		 Lint treesitter queries using installed parser, or clear lint errors.
		
		 Use |treesitter-parsers| in runtimepath to check the query file in {buf} for errors:
		
		   - verify that used nodes are valid identifiers in the grammar.
		   - verify that predicates and directives are valid.
		   - verify that top-level s-expressions are valid.
		
		 The found diagnostics are reported using |diagnostic-api|.
		 By default, the parser used for verification is determined by the containing folder
		 of the query file, e.g., if the path ends in `/lua/highlights.scm`, the parser for the
		 `lua` language will be used.
		
		@*param* `buf` — Buffer handle
	**/
	@:luaDotMethod
	inline function lint(buf:Float, ?opts:nvim.type.vim.treesitter.query.lint.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __lint(buf, opts);
		return result;
	}
	/**
		```lua
		function M.list_directives()
		  -> string[]
		```
		
		---
		
		 Lists the currently available directives to use in queries.
		
		@*return* — : Supported directives.
	**/
	@:luaDotMethod
	function list_directives():lua.Table<Int, String>;
	/**
		```lua
		function M.list_predicates()
		  -> string[]
		```
		
		---
		
		 Lists the currently available predicates to use in queries.
		
		@*return* — : Supported predicates.
	**/
	@:luaDotMethod
	function list_predicates():lua.Table<Int, String>;
	/**
		```lua
		function M.omnifunc(findstart: 0|1, base: string)
		  -> integer|table
		```
		
		---
		
		 Omnifunc for completing node names and predicates in treesitter queries.
		
		 Use via
		
		 ```lua
		 vim.bo.omnifunc = 'v:lua.vim.treesitter.query.omnifunc'
		 ```
		
		
		```lua
		findstart:
		    | 0
		    | 1
		```
	**/
	@:luaDotMethod
	function omnifunc(findstart:Float, base:String):Dynamic;
	/**
		```lua
		function (lang: string, query: string)
		  -> vim.treesitter.Query
		```
		
		---
		
		@*param* `lang` — Language to use for the query
		
		@*param* `query` — Query text, in s-expr syntax
		
		@*return* — : Parsed query
	**/
	@:luaDotMethod
	function parse(lang:String, query:String):nvim.type.vim.treesitter.Query;
	/**
		```lua
		function M.set(lang: string, query_name: string, text: string)
		```
		
		---
		
		 Sets the runtime query named {query_name} for {lang}
		
		 This allows users to override or extend any runtime files and/or configuration
		 set by plugins.
		
		 For example, you could enable spellchecking of `C` identifiers with the
		 following code:
		 ```lua
		 vim.treesitter.query.set(
		   'c',
		   'highlights',
		   [[;inherits c
		   (identifier) @spell]])
		 ]])
		 ```
		
		@*param* `lang` — Language to use for the query
		
		@*param* `query_name` — Name of the query (e.g., "highlights")
		
		@*param* `text` — Query text (unparsed).
	**/
	@:luaDotMethod
	function set(lang:String, query_name:String, text:String):Dynamic;
}