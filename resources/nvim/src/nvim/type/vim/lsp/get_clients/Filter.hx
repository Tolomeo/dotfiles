package nvim.type.vim.lsp.get_clients;

/**
	```lua
	(class) vim.lsp.get_clients.Filter
	```
	
	---
	
	 Key-value pairs used to filter the returned clients.
**/
@:structInit class Filter {
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.bufnr: integer?
		```
		
		---
		
		
		 Only return clients attached to this buffer
	**/
	@:optional
	extern public var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.id: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Only return clients with the given id
	**/
	@:optional
	extern public var id : Null<Int>;
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.method: string?
		```
		
		---
		
		
		 Only return clients supporting the given method
	**/
	@:optional
	extern public var method : Null<String>;
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.name: string?
		```
		
		---
		
		
		 Only return clients with the given name
	**/
	@:optional
	extern public var name : Null<String>;
}