package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.JumpOpts
	```
	
	---
	
	 Configuration table with the keys listed below. Some parameters can have their default values
	 changed with |vim.diagnostic.config()|.
**/
@:structInit class JumpOpts {
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.count: integer?
		```
		
		---
		
		
		 The number of diagnostics to move by, starting from {pos}. A positive
		 integer moves forward by {count} diagnostics, while a negative integer moves
		 backward by {count} diagnostics. Mutually exclusive with {diagnostic}.
	**/
	@:optional
	extern var count : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.diagnostic: (vim.Diagnostic)?
		```
		
		---
		
		 [diagnostic-structure](file:///usr/local/share/nvim/runtime/lua/vim)
		
		 Diagnostics use the same indexing as the rest of the Nvim API (i.e. 0-based
		 rows and columns). |api-indexing|
		
		---
		
		
		 The diagnostic to jump to. Mutually exclusive with {count}, {namespace},
		 and {severity}.
	**/
	@:optional
	extern var diagnostic : Null<nvim.type.vim.Diagnostic>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.float: (boolean|vim.diagnostic.Opts.Float)?
		```
		
		---
		
		
		 If `true`, call |vim.diagnostic.open_float()| after moving.
		 If a table, pass the table as the {opts} parameter to |vim.diagnostic.open_float()|.
		 Unless overridden, the float will show diagnostics at the new cursor
		 position (as if "cursor" were passed to the "scope" option).
		 (default: `false`)
	**/
	@:optional
	extern var float : Null<haxe.extern.EitherType<Bool, nvim.type.vim.diagnostic.opts.Float>>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.lnum: integer?
		```
		
		---
		
		
		 Limit diagnostics to those spanning the specified line number.
	**/
	@:optional
	extern var lnum : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.namespace: (integer|integer[])?
		```
		
		---
		
		
		 Limit diagnostics to one or more namespaces.
	**/
	@:optional
	extern var namespace : Null<haxe.extern.EitherType<Array<Int>, Int>>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.pos: [integer, integer]?
		```
		
		---
		
		
		 Cursor position as a `(row, col)` tuple. See |nvim_win_get_cursor()|. Used
		 to find the nearest diagnostic when {count} is used. Only used when {count}
		 is non-nil. Default is the current cursor position.
	**/
	extern var pos : Dynamic;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 See |diagnostic-severity|.
		
		---
		
		 @nodoc
	**/
	@:optional
	extern var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.winid: integer?
		```
		
		---
		
		
		 Window ID
		 (default: `0`)
	**/
	@:optional
	extern var winid : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.JumpOpts.wrap: boolean?
		```
		
		---
		
		
		 Whether to loop around file or not. Similar to 'wrapscan'.
		 (default: `true`)
	**/
	@:optional
	extern var wrap : Null<Bool>;
}