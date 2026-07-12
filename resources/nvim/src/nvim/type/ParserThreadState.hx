package nvim.type;

/**
	```lua
	(alias) ParserThreadState Expand to { timeout: integer? }
	```
**/
@:structInit class ParserThreadState {
	@:optional
	extern public var timeout : Null<Int>;
}