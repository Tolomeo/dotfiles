package nvim.type.vim._inspector;

/**
	```lua
	(class) vim._inspector.Filter
	```
**/
@:structInit class Filter {
	/**
		```lua
		(field) vim._inspector.Filter.extmarks: boolean|"all"
		```
		
		---
		
		
		 Include extmarks. When `all`, then extmarks without a `hl_group` will also be included.
		 (default: true)
	**/
	extern public var extmarks : haxe.extern.EitherType<Bool, String>;
	/**
		```lua
		(field) vim._inspector.Filter.semantic_tokens: boolean
		```
		
		---
		
		
		 Include semantic token highlights.
		 (default: true)
	**/
	extern public var semantic_tokens : Bool;
	/**
		```lua
		(field) vim._inspector.Filter.syntax: boolean
		```
		
		---
		
		 @inlinedoc
		
		 Include syntax based highlight groups.
		 (default: `true`)
	**/
	extern public var syntax : Bool;
	/**
		```lua
		(field) vim._inspector.Filter.treesitter: boolean
		```
		
		---
		
		
		 Include treesitter based highlight groups.
		 (default: `true`)
	**/
	extern public var treesitter : Bool;
}