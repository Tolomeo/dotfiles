package nvim.type.vim.fn.undotree;

/**
	```lua
	(class) vim.fn.undotree.ret
	```
**/
@:structInit extern class Ret {
	/**
		```lua
		(field) vim.fn.undotree.ret.entries: vim.fn.undotree.entry[]
		```
		
		---
		
		
		 A list of dictionaries with information about
		 undo blocks.
	**/
	var entries : Array<nvim.type.vim.fn.undotree.Entry>;
	/**
		```lua
		(field) vim.fn.undotree.ret.save_cur: integer
		```
		
		---
		
		
		 Number of the current position in the undo
		 tree.
	**/
	var save_cur : Int;
	/**
		```lua
		(field) vim.fn.undotree.ret.save_last: integer
		```
		
		---
		
		
		 Number of the last file write.  Zero when no
		 write yet.
	**/
	var save_last : Int;
	/**
		```lua
		(field) vim.fn.undotree.ret.seq_cur: integer
		```
		
		---
		
		
		 The sequence number of the current position in
		 the undo tree.  This differs from "seq_last"
		 when some changes were undone.
	**/
	var seq_cur : Int;
	/**
		```lua
		(field) vim.fn.undotree.ret.seq_last: integer
		```
		
		---
		
		
		 The highest undo sequence number used.
	**/
	var seq_last : Int;
	/**
		```lua
		(field) vim.fn.undotree.ret.synced: integer
		```
		
		---
		
		
		 Non-zero when the last undo block was synced.
		 This happens when waiting from input from the
		 user.  See |undo-blocks|.
	**/
	var synced : Int;
	/**
		```lua
		(field) vim.fn.undotree.ret.time_cur: integer
		```
		
		---
		
		
		 Time last used for |:earlier| and related
		 commands.  Use |strftime()| to convert to
		 something readable.
	**/
	var time_cur : Int;
}