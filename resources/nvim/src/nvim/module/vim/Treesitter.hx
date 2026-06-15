package nvim.module.vim;

extern class Treesitter {
	/**
		```lua
		(global) vim.treesitter.dev: table
		```
	**/
	var dev : nvim.module.vim.treesitter.Dev;
	/**
		```lua
		function M.foldexpr(lnum: integer|nil)
		  -> string
		```
		
		---
		
		 Returns the fold level for {lnum} in the current buffer. Can be set directly to 'foldexpr':
		
		 ```lua
		 vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		 ```
		
		@*param* `lnum` — Line number to calculate fold level for
	**/
	@:luaDotMethod
	function foldexpr(?lnum:Null<Int>):String;
	/**
		```lua
		function M.get_captures_at_cursor(winnr: integer|nil)
		  -> List: string[]
		```
		
		---
		
		 Returns a list of highlight capture names under the cursor
		
		@*param* `winnr` — : |window-ID| or 0 for current window (default)
		
		
		@*return* `List` — of capture names
	**/
	@:luaDotMethod
	function get_captures_at_cursor(?winnr:Null<Int>):Array<String>;
	/**
		```lua
		function M.get_captures_at_pos(bufnr: integer, row: integer, col: integer)
		  -> { capture: string, lang: string, metadata: vim.treesitter.query.TSMetadata, id: integer }[]
		```
		
		---
		
		 Returns a list of highlight captures at the given position
		
		 Each capture is represented by a table containing the capture name as a string, the capture's
		 language, a table of metadata (`priority`, `conceal`, ...; empty if none are defined), and the
		 id of the capture.
		
		@*param* `bufnr` — Buffer number (0 for current buffer)
		
		@*param* `row` — Position row
		
		@*param* `col` — Position column
	**/
	@:luaDotMethod
	function get_captures_at_pos(bufnr:Int, row:Int, col:Int):Array<{ var capture : String; var lang : String; var metadata : nvim.type.vim.treesitter.query.TSMetadata; var id : Int; }>;
	/**
		```lua
		function M.get_node(opts?: vim.treesitter.get_node.Opts)
		  -> Node: TSNode|nil
		```
		
		---
		
		 Returns the smallest named node at the given position
		
		 NOTE: Calling this on an unparsed tree can yield an invalid node.
		 If the tree is not known to be parsed by, e.g., an active highlighter,
		 parse the tree first via
		
		 ```lua
		 vim.treesitter.get_parser(bufnr):parse(range)
		 ```
		
		
		@*return* `Node` — at the given position
	**/
	@:luaDotMethod
	function get_node(?opts:Null<nvim.type.vim.treesitter.get_node.Opts>):Null<nvim.type.TSNode>;
	/**
		```lua
		function M.get_node_range(node_or_range: Range4|TSNode)
		  -> start_row: integer
		  2. start_col: integer
		  3. end_row: integer
		  4. end_col: integer
		```
		
		---
		
		 Returns the node's range or an unpacked range table
		
		@*param* `node_or_range` — Node or table of positions
	**/
	@:luaDotMethod
	function get_node_range(node_or_range:haxe.extern.EitherType<nvim.type.TSNode, nvim.type.Range4>):nvim.helper.Multireturn<Int, Int, Int, Int, Void, Void>;
	/**
		```lua
		function M.get_node_text(node: TSNode, source: string|integer, opts: table|nil)
		  -> string
		```
		
		---
		
		 Gets the text corresponding to a given node
		
		@*param* `source` — Buffer or string from which the {node} is extracted
		
		@*param* `opts` — Optional parameters.
		
		          - metadata (table) Metadata of a specific capture. This would be
		            set to `metadata[capture_id]` when using |vim.treesitter.query.add_directive()|.
	**/
	@:luaDotMethod
	function get_node_text(node:nvim.type.TSNode, source:haxe.extern.EitherType<Int, String>, ?opts:Null<lua.Table.AnyTable>):String;
	/**
		```lua
		function M.get_parser(bufnr: integer|nil, lang: string|nil, opts: table|nil)
		  -> object: (vim.treesitter.LanguageTree)?
		  2. error: string?
		```
		
		---
		
		 Returns the parser for a specific buffer and attaches it to the buffer
		
		 If needed, this will create the parser.
		
		 If no parser can be created, an error is thrown. Set `opts.error = false` to suppress this and
		 return nil (and an error message) instead. WARNING: This behavior will become default in Nvim
		 0.12 and the option will be removed.
		
		@*param* `bufnr` — Buffer the parser should be tied to (default: current buffer)
		
		@*param* `lang` — Language of this parser (default: from buffer filetype)
		
		@*param* `opts` — Options to pass to the created language tree
		
		
		@*return* `object` — to use for parsing
		
		@*return* `error` — message, if applicable
	**/
	@:luaDotMethod
	function get_parser(?bufnr:Null<Int>, ?lang:Null<String>, ?opts:Null<lua.Table.AnyTable>):nvim.helper.Multireturn<Null<nvim.type.vim.treesitter.LanguageTree>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		function M.get_range(node: TSNode, source: string|integer|nil, metadata: vim.treesitter.query.TSMetadata|nil)
		  -> Range6
		```
		
		---
		
		Get the range of a |TSNode|. Can also supply {source} and {metadata}
		to get the range with directives applied.
		
		@*param* `source` — Buffer or string from which the {node} is extracted
	**/
	@:luaDotMethod
	function get_range(node:nvim.type.TSNode, ?source:Null<haxe.extern.EitherType<Int, String>>, ?metadata:Null<nvim.type.vim.treesitter.query.TSMetadata>):nvim.type.Range6;
	/**
		```lua
		function M.get_string_parser(str: string, lang: string, opts: table|nil)
		  -> object: vim.treesitter.LanguageTree
		```
		
		---
		
		 Returns a string parser
		
		@*param* `str` — Text to parse
		
		@*param* `lang` — Language of this string
		
		@*param* `opts` — Options to pass to the created language tree
		
		
		@*return* `object` — to use for parsing
	**/
	@:luaDotMethod
	function get_string_parser(str:String, lang:String, ?opts:Null<lua.Table.AnyTable>):nvim.type.vim.treesitter.LanguageTree;
	/**
		```lua
		(global) vim.treesitter.highlighter: vim.treesitter.highlighter
		```
	**/
	var highlighter : nvim.module.vim.treesitter.Highlighter;
	/**
		```lua
		function M.inspect_tree(opts: table|nil)
		```
		
		---
		
		 Open a window that displays a textual representation of the nodes in the language tree.
		
		 While in the window, press "a" to toggle display of anonymous nodes, "I" to toggle the
		 display of the source language of each node, "o" to toggle the query editor, and press
		 [<Enter>] to jump to the node under the cursor in the source buffer. Folding also works
		 (try |zo|, |zc|, etc.).
		
		 Can also be shown with `:InspectTree`. [:InspectTree](file:///usr/local/share/nvim/runtime/lua/vim)
		
		@*param* `opts` — Optional options table with the following possible keys:
		
		                      - lang (string|nil): The language of the source buffer. If omitted, detect
		                        from the filetype of the source buffer.
		                      - bufnr (integer|nil): Buffer to draw the tree into. If omitted, a new
		                        buffer is created.
		                      - winid (integer|nil): Window id to display the tree buffer in. If omitted,
		                        a new window is created with {command}.
		                      - command (string|nil): Vimscript command to create the window. Default
		                        value is "60vnew". Only used when {winid} is nil.
		                      - title (string|fun(bufnr:integer):string|nil): Title of the window. If a
		                        function, it accepts the buffer number of the source buffer as its only
		                        argument and should return a string.
	**/
	@:luaDotMethod
	function inspect_tree(?opts:Null<lua.Table.AnyTable>):Dynamic;
	/**
		```lua
		function M.is_ancestor(dest: TSNode, source: TSNode)
		  -> True: boolean
		```
		
		---
		
		 Determines whether a node is the ancestor of another
		
		@*param* `dest` — Possible ancestor
		
		@*param* `source` — Possible descendant
		
		
		@*return* `True` — if {dest} is an ancestor of {source}
	**/
	@:luaDotMethod
	function is_ancestor(dest:nvim.type.TSNode, source:nvim.type.TSNode):Bool;
	/**
		```lua
		function M.is_in_node_range(node: TSNode, line: integer, col: integer)
		  -> True: boolean
		```
		
		---
		
		 Determines whether (line, col) position is in node range
		
		@*param* `node` — defining the range
		
		@*param* `line` — Line (0-based)
		
		@*param* `col` — Column (0-based)
		
		
		@*return* `True` — if the position is in node range
	**/
	@:luaDotMethod
	function is_in_node_range(node:nvim.type.TSNode, line:Int, col:Int):Bool;
	/**
		```lua
		(global) vim.treesitter.language: table
		```
	**/
	var language : nvim.module.vim.treesitter.Language;
	/**
		```lua
		(global) vim.treesitter.language_version: integer
		```
		
		---
		
		 @nodoc
	**/
	var language_version : Int;
	/**
		```lua
		(global) vim.treesitter.languagetree: vim.treesitter.LanguageTree
		```
	**/
	var languagetree : nvim.module.vim.treesitter.Languagetree;
	/**
		```lua
		(global) vim.treesitter.minimum_language_version: integer
		```
		
		---
		
		 @nodoc
	**/
	var minimum_language_version : Int;
	/**
		```lua
		function M.node_contains(node: TSNode, range: table)
		  -> True: boolean
		```
		
		---
		
		 Determines if a node contains a range
		
		
		@*return* `True` — if the {node} contains the {range}
	**/
	@:luaDotMethod
	function node_contains(node:nvim.type.TSNode, range:lua.Table.AnyTable):Bool;
	/**
		```lua
		(global) vim.treesitter.query: table
		```
	**/
	var query : nvim.module.vim.treesitter.Query;
	/**
		```lua
		function M.start(bufnr?: integer, lang?: string)
		```
		
		---
		
		 Starts treesitter highlighting for a buffer
		
		 Can be used in an ftplugin or FileType autocommand.
		
		 Note: By default, disables regex syntax highlighting, which may be required for some plugins.
		 In this case, add `vim.bo.syntax = 'on'` after the call to `start`.
		
		 Note: By default, the highlighter parses code asynchronously, using a segment time of 3ms.
		
		 Example:
		
		 ```lua
		 vim.api.nvim_create_autocmd( 'FileType', { pattern = 'tex',
		     callback = function(args)
		         vim.treesitter.start(args.buf, 'latex')
		         vim.bo[args.buf].syntax = 'on'  -- only if additional legacy syntax is needed
		     end
		 })
		 ```
		
		@*param* `bufnr` — Buffer to be highlighted (default: current buffer)
		
		@*param* `lang` — Language of the parser (default: from buffer filetype)
	**/
	@:luaDotMethod
	function start(?bufnr:Null<Int>, ?lang:Null<String>):Dynamic;
	/**
		```lua
		function M.stop(bufnr: integer|nil)
		```
		
		---
		
		 Stops treesitter highlighting for a buffer
		
		@*param* `bufnr` — Buffer to stop highlighting (default: current buffer)
	**/
	@:luaDotMethod
	function stop(?bufnr:Null<Int>):Dynamic;
}