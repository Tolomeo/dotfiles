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
	extern public function captures():lua.Table<Float, lua.Table<Int, nvim.type.TSNode>>;
	/**
		```lua
		(method) TSQueryMatch:info()
		  -> match_id: integer
		  2. pattern_index: integer
		```
	**/
	@:native("info")
	private extern function __info():nvim.helper.Multireturn<Float, Float, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) TSQueryMatch:info()
		  -> match_id: integer
		  2. pattern_index: integer
		```
	**/
	inline public function info():nvim.helper.Multireturn.Return2<Float, Float> {
		final result = __info();
		return new nvim.helper.Multireturn.Return2<Float, Float>(result._0, result._1);
	}
}