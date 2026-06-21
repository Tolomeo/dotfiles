package nvim.type;

/**
	```lua
	(field) TSQueryInfo.patterns: table<integer, (string|integer)[][]>
	```
**/
@:structInit class Patterns {

}

/**
	```lua
	(class) TSQueryInfo
	```
**/
@:structInit class TSQueryInfo {
	/**
		```lua
		(field) TSQueryInfo.captures: string[]
		```
	**/
	extern var captures : Array<String>;
}