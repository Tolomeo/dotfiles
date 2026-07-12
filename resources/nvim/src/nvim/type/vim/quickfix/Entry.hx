package nvim.type.vim.quickfix;

/**
	```lua
	(class) vim.quickfix.entry
	```
**/
@:structInit class Entry {
	/**
		```lua
		(field) vim.quickfix.entry.bufnr: integer?
		```
		
		---
		
		 buffer number; must be the number of a valid buffer
	**/
	@:optional
	extern public var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.quickfix.entry.col: integer?
		```
		
		---
		
		
		 column number
	**/
	@:optional
	extern public var col : Null<Int>;
	/**
		```lua
		(field) vim.quickfix.entry.end_col: integer?
		```
		
		---
		
		
		 end column, if the item spans multiple columns
	**/
	@:optional
	extern public var end_col : Null<Int>;
	/**
		```lua
		(field) vim.quickfix.entry.end_lnum: integer?
		```
		
		---
		
		
		 end of lines, if the item spans multiple lines
	**/
	@:optional
	extern public var end_lnum : Null<Int>;
	/**
		```lua
		(field) vim.quickfix.entry.filename: string?
		```
		
		---
		
		
		 name of a file; only used when "bufnr" is not
		 present or it is invalid.
	**/
	@:optional
	extern public var filename : Null<String>;
	/**
		```lua
		(field) vim.quickfix.entry.lnum: integer?
		```
		
		---
		
		
		 line number in the file
	**/
	@:optional
	extern public var lnum : Null<Int>;
	/**
		```lua
		(field) vim.quickfix.entry.module: string?
		```
		
		---
		
		
		 name of a module; if given it will be used in
		 quickfix error window instead of the filename.
	**/
	@:optional
	extern public var module : Null<String>;
	/**
		```lua
		(field) vim.quickfix.entry.nr: integer?
		```
		
		---
		
		
		 error number
	**/
	@:optional
	extern public var nr : Null<Int>;
	/**
		```lua
		(field) vim.quickfix.entry.pattern: string?
		```
		
		---
		
		
		 search pattern used to locate the error
	**/
	@:optional
	extern public var pattern : Null<String>;
	/**
		```lua
		(field) vim.quickfix.entry.text: string?
		```
		
		---
		
		
		 description of the error
	**/
	@:optional
	extern public var text : Null<String>;
	/**
		```lua
		(field) vim.quickfix.entry.type: string?
		```
		
		---
		
		
		 single-character error type, 'E', 'W', etc.
	**/
	@:optional
	extern public var type : Null<String>;
	/**
		```lua
		(field) vim.quickfix.entry.user_data: any
		```
		
		---
		
		
		 custom data associated with the item, can be
		 any type.
	**/
	@:optional
	extern public var user_data : Null<Any>;
	/**
		```lua
		(field) vim.quickfix.entry.valid: boolean?
		```
		
		---
		
		
		 recognized error message
	**/
	@:optional
	extern public var valid : Null<Bool>;
	/**
		```lua
		(field) vim.quickfix.entry.vcol: integer?
		```
		
		---
		
		
		 when non-zero: "col" is visual column
		 when zero: "col" is byte index
	**/
	@:optional
	extern public var vcol : Null<Int>;
}