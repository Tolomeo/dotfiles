package nvim.type.vim;

/**
	```lua
	(class) vim.Ringbuf
	```
**/
@:structInit class Ringbuf {
	/**
		```lua
		function vim.Ringbuf.clear(self: vim.Ringbuf)
		```
		
		---
		
		 Clear all items
	**/
	extern function clear():Dynamic;
	/**
		```lua
		function vim.Ringbuf.peek(self: vim.Ringbuf)
		  -> <T>?
		```
		
		---
		
		 Returns the first unread item without removing it
	**/
	extern function peek<T>():Null<T>;
	/**
		```lua
		function vim.Ringbuf.pop(self: vim.Ringbuf)
		  -> <T>?
		```
		
		---
		
		 Removes and returns the first unread item
	**/
	extern function pop<T>():Null<T>;
	/**
		```lua
		function vim.Ringbuf.push(self: vim.Ringbuf, item: <T>)
		```
		
		---
		
		 Adds an item, overriding the oldest item if the buffer is full.
	**/
	extern function push<T>(item:T):Dynamic;
}