package nvim.type.vim.treesitter;

/**
	```lua
	(class) vim.treesitter.Query
	```
	
	---
	
	Parsed query, see |vim.treesitter.query.parse()|
	
**/
@:structInit extern class Query {
	/**
		```lua
		(field) vim.treesitter.Query.captures: string[]
		```
		
		---
		
		list of (unique) capture names defined in query
	**/
	var captures : Array<String>;
	/**
		```lua
		(field) vim.treesitter.Query.has_combined_injections: boolean
		```
		
		---
		
		whether the query contains combined injections
	**/
	var has_combined_injections : Bool;
	/**
		```lua
		(field) vim.treesitter.Query.has_conceal_line: boolean
		```
		
		---
		
		whether the query sets conceal_lines metadata
	**/
	var has_conceal_line : Bool;
	/**
		```lua
		(field) vim.treesitter.Query.info: vim.treesitter.QueryInfo
		```
		
		---
		
		Information for Query, see |vim.treesitter.query.parse()|
		
		---
		
		query context (e.g. captures, predicates, directives)
	**/
	var info : nvim.type.vim.treesitter.QueryInfo;
	/**
		```lua
		(field) vim.treesitter.Query.lang: string
		```
		
		---
		
		parser language name
	**/
	var lang : String;
	/**
		```lua
		(field) vim.treesitter.Query.query: TSQuery
		```
		
		---
		
		 Reference to an object held by the treesitter library that is used as a
		 component of the |vim.treesitter.Query| for language feature support.
		 See |treesitter-query| for more about queries or |vim.treesitter.query.parse()|
		 for an example of how to obtain a query object.
		
		
		---
		
		userdata query object
	**/
	var query : nvim.type.TSQuery;
	/**
		```lua
		(method) vim.treesitter.Query:_process_patterns()
		```
		
		---
		
		 Splits the query patterns into predicates and directives.
	**/
	function _process_patterns():Dynamic;
	/**
		```lua
		(method) vim.treesitter.Query:iter_captures(node: TSNode, source: string|integer, start?: integer, stop?: integer, opts?: table)
		  -> fun(end_line: integer|nil):integer, TSNode, vim.treesitter.query.TSMetadata, TSQueryMatch, TSTree
		```
		
		---
		
		 Iterates over all captures from all matches in {node}.
		
		 {source} is required if the query contains predicates; then the caller
		 must ensure to use a freshly parsed tree consistent with the current
		 text of the buffer (if relevant). {start} and {stop} can be used to limit
		 matches inside a row range (this is typically used with root node
		 as the {node}, i.e., to get syntax highlight matches in the current
		 viewport). When omitted, the {start} and {stop} row values are used from the given node.
		
		 The iterator returns four values:
		 1. the numeric id identifying the capture
		 2. the captured node
		 3. metadata from any directives processing the match
		 4. the match itself
		
		 Example: how to get captures by name:
		 ```lua
		 for id, node, metadata, match in query:iter_captures(tree:root(), bufnr, first, last) do
		   local name = query.captures[id] -- name of the capture in the query
		   -- typically useful info about the node:
		   local type = node:type() -- type of the captured node
		   local row1, col1, row2, col2 = node:range() -- range of the capture
		   -- ... use the info here ...
		 end
		 ```
		
		@*param* `node` — under which the search will occur
		
		@*param* `source` — Source buffer or string to extract text from
		
		@*param* `start` — Starting line for the search. Defaults to `node:start()`.
		
		@*param* `stop` — Stopping line for the search (end-exclusive). Defaults to `node:end_()`.
		
		@*param* `opts` — Optional keyword arguments:
		
		   - max_start_depth (integer) if non-zero, sets the maximum start depth
		     for each match. This is used to prevent traversing too deep into a tree.
		   - match_limit (integer) Set the maximum number of in-progress matches (Default: 256).
		
		@*return* — :
		
		        capture id, capture node, metadata, match, tree
	**/
	function iter_captures(node:nvim.type.TSNode, source:haxe.extern.EitherType<Int, String>, ?start:Int, ?stop:Int, ?opts:lua.Table.AnyTable):(end_line:Null<Int>) -> nvim.helper.Multireturn<Int, nvim.type.TSNode, nvim.type.vim.treesitter.query.TSMetadata, nvim.type.TSQueryMatch, nvim.type.TSTree, Void>;
	/**
		```lua
		(method) vim.treesitter.Query:iter_matches(node: TSNode, source: string|integer, start?: integer, stop?: integer, opts?: table)
		  -> fun():integer, table<integer, TSNode[]>, vim.treesitter.query.TSMetadata, TSTree
		```
		
		---
		
		 Iterates the matches of self on a given range.
		
		 Iterate over all matches within a {node}. The arguments are the same as for
		 |Query:iter_captures()| but the iterated values are different: an (1-based)
		 index of the pattern in the query, a table mapping capture indices to a list
		 of nodes, and metadata from any directives processing the match.
		
		 Example:
		
		 ```lua
		 for pattern, match, metadata in cquery:iter_matches(tree:root(), bufnr, 0, -1) do
		   for id, nodes in pairs(match) do
		     local name = query.captures[id]
		     for _, node in ipairs(nodes) do
		       -- `node` was captured by the `name` capture in the match
		
		       local node_data = metadata[id] -- Node level metadata
		       -- ... use the info here ...
		     end
		   end
		 end
		 ```
		
		
		@*param* `node` — under which the search will occur
		
		@*param* `source` — Source buffer or string to search
		
		@*param* `start` — Starting line for the search. Defaults to `node:start()`.
		
		@*param* `stop` — Stopping line for the search (end-exclusive). Defaults to `node:end_()`.
		
		@*param* `opts` — Optional keyword arguments:
		
		   - max_start_depth (integer) if non-zero, sets the maximum start depth
		     for each match. This is used to prevent traversing too deep into a tree.
		   - match_limit (integer) Set the maximum number of in-progress matches (Default: 256).
		 - all (boolean) When `false` (default `true`), the returned table maps capture IDs to a single
		   (last) node instead of the full list of matching nodes. This option is only for backward
		   compatibility and will be removed in a future release.
		
		@*return* — : pattern id, match, metadata, tree
	**/
	function iter_matches(node:nvim.type.TSNode, source:haxe.extern.EitherType<Int, String>, ?start:Int, ?stop:Int, ?opts:lua.Table.AnyTable):() -> nvim.helper.Multireturn<Int, lua.Table<Int, Array<nvim.type.TSNode>>, nvim.type.vim.treesitter.query.TSMetadata, nvim.type.TSTree, Void, Void>;
}