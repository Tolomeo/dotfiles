package nvim.type.vim.fs.dir;

/**
	```lua
	(class) vim.fs.dir.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.fs.dir.Opts.depth: integer?
		```
		
		---
		
		 @inlinedoc
		
		 How deep the traverse.
		 (default: `1`)
	**/
	var depth : Null<Int>;
	/**
		```lua
		(field) vim.fs.dir.Opts.follow: boolean?
		```
		
		---
		
		
		 Follow symbolic links.
		 (default: `false`)
	**/
	var follow : Null<Bool>;
	/**
		```lua
		(field) vim.fs.dir.Opts.skip: (fun(dir_name: string):boolean)?
		```
		
		---
		
		
		 Predicate to control traversal.
		 Return false to stop searching the current directory.
		 Only useful when depth > 1
		 Return an iterator over the items located in {path}
		
		---
		
		```lua
		function (dir_name: string)
		  -> boolean
		```
	**/
	var skip : Null<(dir_name:String) -> Bool>;
}