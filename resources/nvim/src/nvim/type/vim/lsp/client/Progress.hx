package nvim.type.vim.lsp.client;

/**
	```lua
	(field) vim.lsp.Client.Progress.pending: table<string|integer, boolean|string|number|lsp.LSPAny[]|table<string, lsp.LSPAny>|nil>
	```
**/
@:structInit extern class Pending {

}

/**
	```lua
	(class) vim.lsp.Client.Progress
	```
**/
@:structInit extern class Progress {
	/**
		```lua
		function vim.Ringbuf.clear(self: vim.Ringbuf)
		```
		
		---
		
		 Clear all items
	**/
	function clear():Dynamic;
	/**
		```lua
		function vim.Ringbuf.peek(self: vim.Ringbuf)
		  -> <T>?
		```
		
		---
		
		 Returns the first unread item without removing it
	**/
	function peek<T>():Null<T>;
	/**
		```lua
		function vim.Ringbuf.pop(self: vim.Ringbuf)
		  -> <T>?
		```
		
		---
		
		 Removes and returns the first unread item
	**/
	function pop<T>():Null<T>;
	/**
		```lua
		function vim.Ringbuf.push(self: vim.Ringbuf, item: <T>)
		```
		
		---
		
		 Adds an item, overriding the oldest item if the buffer is full.
	**/
	function push<T>(item:T):Dynamic;
}