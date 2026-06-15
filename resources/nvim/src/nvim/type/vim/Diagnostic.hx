package nvim.type.vim;

/**
	```lua
	(class) vim.Diagnostic
	```
	
	---
	
	 [diagnostic-structure](file:///usr/local/share/nvim/runtime/lua/vim)
	
	 Diagnostics use the same indexing as the rest of the Nvim API (i.e. 0-based
	 rows and columns). |api-indexing|
**/
@:structInit extern class Diagnostic {
	/**
		```lua
		(field) vim.Diagnostic._tags: { deprecated: boolean, unnecessary: boolean }?
		```
	**/
	var _tags : Null<{ var deprecated : Bool; var unnecessary : Bool; }>;
	/**
		```lua
		(field) vim.Diagnostic.bufnr: integer?
		```
		
		---
		
		
		 Buffer number
	**/
	var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.code: (string|integer)?
		```
		
		---
		
		
		 The diagnostic code
	**/
	var code : Null<haxe.extern.EitherType<String, Int>>;
	/**
		```lua
		(field) vim.Diagnostic.col: integer
		```
		
		---
		
		
		 The starting column of the diagnostic (0-indexed)
	**/
	var col : Int;
	/**
		```lua
		(field) vim.Diagnostic.end_col: integer?
		```
		
		---
		
		
		 The final column of the diagnostic (0-indexed)
	**/
	var end_col : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.end_lnum: integer?
		```
		
		---
		
		
		 The final line of the diagnostic (0-indexed)
	**/
	var end_lnum : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.lnum: integer
		```
		
		---
		
		
		 The starting line of the diagnostic (0-indexed)
	**/
	var lnum : Int;
	/**
		```lua
		(field) vim.Diagnostic.message: string
		```
		
		---
		
		
		 The diagnostic text
	**/
	var message : String;
	/**
		```lua
		(field) vim.Diagnostic.namespace: integer?
		```
	**/
	var namespace : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.severity: (vim.diagnostic.Severity)?
		```
		
		---
		
		 @nodoc
		
		---
		
		
		 The severity of the diagnostic |vim.diagnostic.severity|
	**/
	var severity : Null<nvim.type.vim.diagnostic.Severity>;
	/**
		```lua
		(field) vim.Diagnostic.source: string?
		```
		
		---
		
		
		 The source of the diagnostic
	**/
	var source : Null<String>;
	/**
		```lua
		(field) vim.Diagnostic.user_data: any
		```
		
		---
		
		arbitrary data plugins can add
	**/
	var user_data : Null<Any>;
}