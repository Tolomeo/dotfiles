package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_commands
	```
**/
@:structInit class GetCommands {
	/**
		```lua
		(field) vim.api.keyset.get_commands.builtin: boolean?
		```
	**/
	@:optional
	extern public var builtin : Null<Bool>;
}