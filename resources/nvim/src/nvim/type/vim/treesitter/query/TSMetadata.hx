package nvim.type.vim.treesitter.query;

/**
	```lua
	(class) vim.treesitter.query.TSMetadata
	```
**/
@:structInit class TSMetadata {
	/**
		```lua
		(field) vim.treesitter.query.TSMetadata.conceal: string?
		```
	**/
	@:optional
	extern public var conceal : Null<String>;
	/**
		```lua
		(field) vim.treesitter.query.TSMetadata.range: (Range2|Range4|Range6)?
		```
	**/
	@:optional
	extern public var range : Null<nvim.type.Range>;
}