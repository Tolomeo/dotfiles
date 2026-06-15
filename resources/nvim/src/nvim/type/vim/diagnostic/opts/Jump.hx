package nvim.type.vim.diagnostic.opts;

/**
	```lua
	(class) vim.diagnostic.Opts.Jump
	```
**/
@:structInit extern class Jump {
	/**
		```lua
		(field) vim.diagnostic.Opts.Jump.float: (boolean|vim.diagnostic.Opts.Float)?
		```
		
		---
		
		
		 Default value of the {float} parameter of |vim.diagnostic.jump()|.
		 (default: false)
	**/
	var float : Null<haxe.extern.EitherType<Bool, nvim.type.vim.diagnostic.opts.Float>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Jump.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Default value of the {severity} parameter of |vim.diagnostic.jump()|.
		
		---
		
		 @nodoc
	**/
	var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Jump.wrap: boolean?
		```
		
		---
		
		
		 Default value of the {wrap} parameter of |vim.diagnostic.jump()|.
		 (default: true)
	**/
	var wrap : Null<Bool>;
}