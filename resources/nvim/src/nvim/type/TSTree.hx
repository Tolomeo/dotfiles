package nvim.type;

/**
	```lua
	(class) TSTree
	```
**/
@:structInit class TSTree {
	/**
		```lua
		(method) TSTree:copy()
		  -> TSTree
		```
		
		---
		
		 Returns a copy of the `TSTree`.
	**/
	extern public function copy():nvim.type.TSTree;
	/**
		```lua
		(method) TSTree:edit(start_byte: integer, end_byte_old: integer, end_byte_new: integer, start_row: integer, start_col: integer, end_row_old: integer, end_col_old: integer, end_row_new: integer, end_col_new: integer)
		  -> TSTree
		```
		
		---
		
		 stylua: ignore
	**/
	extern public function edit(start_byte:Float, end_byte_old:Float, end_byte_new:Float, start_row:Float, start_col:Float, end_row_old:Float, end_col_old:Float, end_row_new:Float, end_col_new:Float):nvim.type.TSTree;
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
	extern public function included_ranges(include_bytes:Bool):lua.Table<Int, nvim.type.Range6>;
	/**
		```lua
		(method) TSTree:root()
		  -> TSNode
		```
		
		---
		
		 Return the root node of this tree.
	**/
	extern public function root():nvim.type.TSNode;
}