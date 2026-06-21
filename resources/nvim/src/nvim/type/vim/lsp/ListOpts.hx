package nvim.type.vim.lsp;

/**
	```lua
	(class) vim.lsp.ListOpts
	```
**/
@:structInit class ListOpts {
	/**
		```lua
		(field) vim.lsp.ListOpts.loclist: boolean?
		```
		
		---
		
		 Whether to use the |location-list| or the |quickfix| list in the default handler.
		 ```lua
		 vim.lsp.buf.definition({ loclist = true })
		 vim.lsp.buf.references(nil, { loclist = false })
		 ```
	**/
	@:optional
	extern var loclist : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.ListOpts.on_list: fun(t: vim.lsp.LocationOpts.OnList)?
		```
		
		---
		
		
		 list-handler replacing the default handler.
		 Called for any non-empty result.
		 This table can be used with |setqflist()| or |setloclist()|. E.g.:
		 ```lua
		 local function on_list(options)
		   vim.fn.setqflist({}, ' ', options)
		   vim.cmd.cfirst()
		 end
		
		 vim.lsp.buf.definition({ on_list = on_list })
		 vim.lsp.buf.references(nil, { on_list = on_list })
		 ```
		
		---
		
		```lua
		function (t: vim.lsp.LocationOpts.OnList)
		```
	**/
	@:optional
	extern var on_list : Null<(t:nvim.type.vim.lsp.locationopts.OnList) -> Dynamic>;
}