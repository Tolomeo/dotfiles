package nvim.type;

/**
	```lua
	(class) TSQueryMatch
	```
**/
@:structInit class TSQueryMatch {
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
	extern public function captures():lua.Table<Int, lua.Table<Int, nvim.type.TSNode>>;
	@:native("info")
	private extern function __info():nvim.helper.Multireturn<Int, Int, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) TSQueryMatch:info()
		  -> match_id: integer
		  2. pattern_index: integer
		```
	**/
	inline public function info():nvim.helper.Multireturn.Return2<Int, Int> {
		return __info();
	}
}