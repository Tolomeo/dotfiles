package nvim.type;

/**
	```lua
	(alias) ParserThreadState Expand to { timeout: integer? }
	```
**/
@:structInit class ParserThreadState {
	@:optional
	extern var timeout : Null<Int>;
}