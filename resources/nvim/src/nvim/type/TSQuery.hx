package nvim.type;

/**
	```lua
	(class) TSQuery
	```
	
	---
	
	 Reference to an object held by the treesitter library that is used as a
	 component of the |vim.treesitter.Query| for language feature support.
	 See |treesitter-query| for more about queries or |vim.treesitter.query.parse()|
	 for an example of how to obtain a query object.
	
**/
@:structInit class TSQuery {
	/**
		```lua
		(method) TSQuery:disable_capture(capture_name: string)
		```
		
		---
		
		 Disable a specific capture in this query; once disabled the capture cannot be re-enabled.
		 {capture_name} should not include a leading "@".
		
		 Example: To disable the `@variable.parameter` capture from the vimdoc highlights query:
		 ```lua
		 local query = vim.treesitter.query.get('vimdoc', 'highlights')
		 query.query:disable_capture("variable.parameter")
		 vim.treesitter.get_parser():parse()
		 ```
	**/
	extern function disable_capture(capture_name:String):Dynamic;
	/**
		```lua
		(method) TSQuery:disable_pattern(pattern_index: integer)
		```
		
		---
		
		 Disable a specific pattern in this query; once disabled the pattern cannot be re-enabled.
		 The {pattern_index} for a particular match can be obtained with |:Inspect!|, or by reading
		 the source of the query (i.e. from |vim.treesitter.query.get_files()|).
		
		 Example: To disable `|` links in vimdoc but keep other `@markup.link`s highlighted:
		 ```lua
		 local link_pattern = 9 -- from :Inspect!
		 local query = vim.treesitter.query.get('vimdoc', 'highlights')
		 query.query:disable_pattern(link_pattern)
		 local tree = vim.treesitter.get_parser():parse()[1]
		 ```
	**/
	extern function disable_pattern(pattern_index:Int):Dynamic;
	/**
		```lua
		(method) TSQuery:inspect()
		  -> TSQueryInfo
		```
		
		---
		
		 Get information about the query's patterns and captures.
	**/
	extern function inspect():nvim.type.TSQueryInfo;
}