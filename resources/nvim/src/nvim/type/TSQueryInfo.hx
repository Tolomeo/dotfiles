package nvim.type;

/**
	```lua
	(field) TSQueryInfo.patterns: table<integer, (string|integer)[][]>
	```
**/
@:structInit extern class Patterns {

}

/**
	```lua
	(class) TSQueryInfo
	```
**/
@:structInit extern class TSQueryInfo {
	/**
		```lua
		(field) TSQueryInfo.captures: string[]
		```
	**/
	var captures : Array<String>;
}