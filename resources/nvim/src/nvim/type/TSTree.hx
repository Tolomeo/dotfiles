package nvim.type;

/**
	```lua
	(class) TSTree
	```
**/
@:structInit extern class TSTree {
	/**
		```lua
		(method) TSTree:copy()
		  -> TSTree
		```
		
		---
		
		 Returns a copy of the `TSTree`.
	**/
	function copy():nvim.type.TSTree;
	/**
		```lua
		(method) TSTree:edit(start_byte: integer, end_byte_old: integer, end_byte_new: integer, start_row: integer, start_col: integer, end_row_old: integer, end_col_old: integer, end_row_new: integer, end_col_new: integer)
		  -> TSTree
		```
		
		---
		
		 stylua: ignore
	**/
	function edit(start_byte:Int, end_byte_old:Int, end_byte_new:Int, start_row:Int, start_col:Int, end_row_old:Int, end_col_old:Int, end_row_new:Int, end_col_new:Int):nvim.type.TSTree;
	/**
		```lua
		(method) TSTree:included_ranges(include_bytes: true)
		  -> Range6[]
		```
		
		---
		
		```lua
		include_bytes:
		    | true
		```
		
		---
		
		```lua
		(method) TSTree:included_ranges(include_bytes: false)
		  -> Range4[]
		```
		
		---
		
		```lua
		include_bytes:
		    | false
		```
	**/
	function included_ranges(include_bytes:Bool):Array<nvim.type.Range6>;
	/**
		```lua
		(method) TSTree:root()
		  -> TSNode
		```
		
		---
		
		 Return the root node of this tree.
	**/
	function root():nvim.type.TSNode;
}