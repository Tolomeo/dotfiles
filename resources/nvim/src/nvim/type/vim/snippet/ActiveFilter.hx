package nvim.type.vim.snippet;

/**
	```lua
	(class) vim.snippet.ActiveFilter
	```
**/
@:structInit class ActiveFilter {
	/**
		```lua
		(field) vim.snippet.ActiveFilter.direction: -1|1
		```
		
		---
		
		Navigation direction. -1 for previous, 1 for next.
		
		---
		
		```lua
		vim.snippet.Direction:
		    | -1
		    | 1
		```
	**/
	extern public var direction : nvim.type.vim.snippet.Direction;
}