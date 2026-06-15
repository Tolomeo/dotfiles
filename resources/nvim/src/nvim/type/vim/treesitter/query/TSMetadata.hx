package nvim.type.vim.treesitter.query;

/**
	```lua
	(class) vim.treesitter.query.TSMetadata
	```
**/
@:structInit extern class TSMetadata {
	/**
		```lua
		(field) vim.treesitter.query.TSMetadata.conceal: string?
		```
	**/
	var conceal : Null<String>;
	/**
		```lua
		(field) vim.treesitter.query.TSMetadata.range: (Range2|Range4|Range6)?
		```
	**/
	var range : Null<nvim.type.Range>;
}