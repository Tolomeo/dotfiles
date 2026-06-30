package nvim.type.vim.treesitter;

/**
	```lua
	(field) vim.treesitter.QueryInfo.patterns: table<integer, (string|integer)[][]>
	```
	
	---
	
	
	Contains information about predicates and directives.
	Key is pattern id, and value is list of predicates or directives defined in the pattern.
	A predicate or directive is a list of (integer|string); integer represents `capture_id`, and
	string represents (literal) arguments to predicate/directive. See |treesitter-predicates|
	and |treesitter-directives| for more details.
**/
@:structInit class Patterns {

}

/**
	```lua
	(class) vim.treesitter.QueryInfo
	```
	
	---
	
	Information for Query, see |vim.treesitter.query.parse()|
**/
@:structInit class QueryInfo {
	/**
		```lua
		(field) vim.treesitter.QueryInfo.captures: string[]
		```
		
		---
		
		
		List of (unique) capture names defined in query.
	**/
	extern public var captures : lua.Table<Int, String>;
}