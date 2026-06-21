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
@:structInit class Diagnostic {
	/**
		```lua
		(field) vim.Diagnostic._tags: { deprecated: boolean, unnecessary: boolean }?
		```
	**/
	@:optional
	extern var _tags : Null<{ var deprecated : Bool; var unnecessary : Bool; }>;
	/**
		```lua
		(field) vim.Diagnostic.bufnr: integer?
		```
		
		---
		
		
		 Buffer number
	**/
	@:optional
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.code: (string|integer)?
		```
		
		---
		
		
		 The diagnostic code
	**/
	@:optional
	extern var code : Null<haxe.extern.EitherType<String, Int>>;
	/**
		```lua
		(field) vim.Diagnostic.col: integer
		```
		
		---
		
		
		 The starting column of the diagnostic (0-indexed)
	**/
	extern var col : Int;
	/**
		```lua
		(field) vim.Diagnostic.end_col: integer?
		```
		
		---
		
		
		 The final column of the diagnostic (0-indexed)
	**/
	@:optional
	extern var end_col : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.end_lnum: integer?
		```
		
		---
		
		
		 The final line of the diagnostic (0-indexed)
	**/
	@:optional
	extern var end_lnum : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.lnum: integer
		```
		
		---
		
		
		 The starting line of the diagnostic (0-indexed)
	**/
	extern var lnum : Int;
	/**
		```lua
		(field) vim.Diagnostic.message: string
		```
		
		---
		
		
		 The diagnostic text
	**/
	extern var message : String;
	/**
		```lua
		(field) vim.Diagnostic.namespace: integer?
		```
	**/
	@:optional
	extern var namespace : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.severity: (vim.diagnostic.Severity)?
		```
		
		---
		
		 @nodoc
		
		---
		
		
		 The severity of the diagnostic |vim.diagnostic.severity|
	**/
	@:optional
	extern var severity : Null<nvim.type.vim.diagnostic.Severity>;
	/**
		```lua
		(field) vim.Diagnostic.source: string?
		```
		
		---
		
		
		 The source of the diagnostic
	**/
	@:optional
	extern var source : Null<String>;
	/**
		```lua
		(field) vim.Diagnostic.user_data: any
		```
		
		---
		
		arbitrary data plugins can add
	**/
	@:optional
	extern var user_data : Null<Any>;
}