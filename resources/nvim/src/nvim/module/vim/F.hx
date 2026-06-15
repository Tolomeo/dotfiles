package nvim.module.vim;

extern class F {
	/**
		```lua
		function F.if_nil(...<T>)
		  -> <T>
		```
		
		---
		
		 Returns the first argument which is not nil.
		
		 If all arguments are nil, returns nil.
		
		 Examples:
		
		 ```lua
		 local a = nil
		 local b = nil
		 local c = 42
		 local d = true
		 assert(vim.F.if_nil(a, b, c, d) == 42)
		 ```
	**/
	@:luaDotMethod
	function if_nil<T>(___:haxe.Rest<T>):T;
	/**
		```lua
		function F.nil_wrap(fn: any)
		  -> function
		```
		
		---
		
		 Wrap a function to return nil if it fails, otherwise the value
	**/
	@:luaDotMethod
	function nil_wrap(fn:Dynamic):Dynamic;
	/**
		```lua
		function F.npcall(fn: any, ...any)
		  -> unknown|nil
		```
		
		---
		
		 Nil pcall.
	**/
	@:luaDotMethod
	function npcall(fn:Dynamic, ___:haxe.Rest<Dynamic>):Dynamic;
	/**
		```lua
		function F.ok_or_nil(status: any, ...any)
		  -> unknown|nil
		```
		
		---
		
		 Use in combination with pcall
	**/
	@:luaDotMethod
	function ok_or_nil(status:Dynamic, ___:haxe.Rest<Dynamic>):Dynamic;
	/**
		```lua
		function F.pack_len(...any)
		  -> table
		```
		
		---
		
		 like {...} except preserve the length explicitly
	**/
	@:luaDotMethod
	function pack_len(___:haxe.Rest<Dynamic>):Dynamic;
	/**
		```lua
		function F.unpack_len(t: any)
		  -> unknown
		  2. unknown
		  3. unknown
		  4. unknown
		  5. unknown
		  6. unknown
		  7. unknown
		  8. unknown
		  9. unknown
		 10. unknown
		```
		
		---
		
		 like unpack() but use the length set by F.pack_len if present
	**/
	@:luaDotMethod
	function unpack_len(t:Dynamic):Dynamic;
}