package nvim.type;

/**
	```lua
	(class) TSQueryMatch
	```
**/
@:structInit extern class TSQueryMatch {
	/**
		```lua
		(field) TSQueryMatch.captures: fun(self: TSQueryMatch):table<integer, TSNode[]>
		```
		
		---
		
		```lua
		function (self: TSQueryMatch)
		  -> table<integer, TSNode[]>
		```
	**/
	@:luaDotMethod
	function captures():lua.Table<Int, Array<nvim.type.TSNode>>;
	/**
		```lua
		(method) TSQueryMatch:info()
		  -> match_id: integer
		  2. pattern_index: integer
		```
	**/
	function info():nvim.helper.Multireturn<Int, Int, Void, Void, Void, Void>;
}