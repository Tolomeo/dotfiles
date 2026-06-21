package nvim.type.vim.fn.undotree;

/**
	```lua
	(class) vim.fn.undotree.entry
	```
**/
@:structInit class Entry {
	/**
		```lua
		(field) vim.fn.undotree.entry.alt: vim.fn.undotree.entry[]?
		```
		
		---
		
		
		 Alternate entry.  This is again a List of undo
		 blocks.  Each item may again have an "alt"
		 item.
	**/
	@:optional
	extern var alt : Null<Array<nvim.type.vim.fn.undotree.Entry>>;
	/**
		```lua
		(field) vim.fn.undotree.entry.curhead: integer?
		```
		
		---
		
		
		 Only appears in the item that is the last one
		 that was undone.  This marks the current
		 position in the undo tree, the block that will
		 be used by a redo command.  When nothing was
		 undone after the last change this item will
		 not appear anywhere.
	**/
	@:optional
	extern var curhead : Null<Int>;
	/**
		```lua
		(field) vim.fn.undotree.entry.newhead: integer?
		```
		
		---
		
		
		 Only appears in the item that is the last one
		 that was added.  This marks the last change
		 and where further changes will be added.
	**/
	@:optional
	extern var newhead : Null<Int>;
	/**
		```lua
		(field) vim.fn.undotree.entry.save: integer?
		```
		
		---
		
		
		 Only appears on the last block before a file
		 write.  The number is the write count.  The
		 first write has number 1, the last one the
		 "save_last" mentioned above.
	**/
	@:optional
	extern var save : Null<Int>;
	/**
		```lua
		(field) vim.fn.undotree.entry.seq: integer
		```
		
		---
		
		
		 Undo sequence number.  Same as what appears in
		 \|:undolist|.
	**/
	extern var seq : Int;
	/**
		```lua
		(field) vim.fn.undotree.entry.time: integer
		```
		
		---
		
		
		 Timestamp when the change happened.  Use
		 \|strftime()| to convert to something readable.
	**/
	extern var time : Int;
}