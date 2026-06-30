package nvim.type.vim.fn.setqflist;

/**
	```lua
	(class) vim.fn.setqflist.what
	```
**/
@:structInit class What {
	/**
		```lua
		(field) vim.fn.setqflist.what.context: table?
		```
		
		---
		
		
		 quickfix list context. See |quickfix-context|
	**/
	@:optional
	extern public var context : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.fn.setqflist.what.efm: string?
		```
		
		---
		
		
		 errorformat to use when parsing text from
		 "lines". If this is not present, then the
		 'errorformat' option value is used.
		 See |quickfix-parse|
	**/
	@:optional
	extern public var efm : Null<String>;
	/**
		```lua
		(field) vim.fn.setqflist.what.id: integer?
		```
		
		---
		
		
		 quickfix list identifier |quickfix-ID|
	**/
	@:optional
	extern public var id : Null<Float>;
	/**
		```lua
		(field) vim.fn.setqflist.what.idx: integer?
		```
		
		---
		
		 index of the current entry in the quickfix
		 list specified by "id" or "nr". If set to '$',
		 then the last entry in the list is set as the
		 current entry. See |quickfix-index|
	**/
	@:optional
	extern public var idx : Null<Float>;
	/**
		```lua
		(field) vim.fn.setqflist.what.items: vim.quickfix.entry[]?
		```
		
		---
		
		
		 list of quickfix entries. Same as the {list}
		 argument.
	**/
	@:optional
	extern public var items : Null<lua.Table<Int, nvim.type.vim.quickfix.Entry>>;
	/**
		```lua
		(field) vim.fn.setqflist.what.lines: string[]?
		```
		
		---
		
		
		 use 'errorformat' to parse a list of lines and
		 add the resulting entries to the quickfix list
		 {nr} or {id}. Only a |List| value is supported.
		 See |quickfix-parse|
	**/
	@:optional
	extern public var lines : Null<lua.Table<Int, String>>;
	/**
		```lua
		(field) vim.fn.setqflist.what.nr: integer?
		```
		
		---
		
		
		 list number in the quickfix stack; zero
		 means the current quickfix list and "$" means
		 the last quickfix list.
	**/
	@:optional
	extern public var nr : Null<Float>;
	/**
		```lua
		(field) vim.fn.setqflist.what.quickfixtextfunc: function?
		```
		
		---
		
		
		 function to get the text to display in the
		 quickfix window. The value can be the name of
		 a function or a funcref or a lambda. Refer
		 to |quickfix-window-function| for an explanation
		 of how to write the function and an example.
	**/
	@:optional
	extern public var quickfixtextfunc : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.fn.setqflist.what.title: string?
		```
		
		---
		
		
		 quickfix list title text. See |quickfix-title|
	**/
	@:optional
	extern public var title : Null<String>;
}