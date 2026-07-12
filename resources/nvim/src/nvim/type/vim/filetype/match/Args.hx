package nvim.type.vim.filetype.match;

/**
	```lua
	(class) vim.filetype.match.args
	```
**/
@:structInit class Args {
	/**
		```lua
		(field) vim.filetype.match.args.buf: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Buffer number to use for matching. Mutually exclusive with {contents}
	**/
	@:optional
	extern public var buf : Null<Int>;
	/**
		```lua
		(field) vim.filetype.match.args.contents: string[]?
		```
		
		---
		
		
		 An array of lines representing file contents to use for
		 matching. Can be used with {filename}. Mutually exclusive
		 with {buf}.
	**/
	@:optional
	extern public var contents : Null<lua.Table<Int, String>>;
	/**
		```lua
		(field) vim.filetype.match.args.filename: string?
		```
		
		---
		
		
		 Filename to use for matching. When {buf} is given,
		 defaults to the filename of the given buffer number. The
		 file need not actually exist in the filesystem. When used
		 without {buf} only the name of the file is used for
		 filetype matching. This may result in failure to detect
		 the filetype in cases where the filename alone is not
		 enough to disambiguate the filetype.
	**/
	@:optional
	extern public var filename : Null<String>;
}