package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.context
	```
**/
@:structInit class Context {
	/**
		```lua
		(field) vim.api.keyset.context.types: string[]?
		```
	**/
	@:optional
	extern public var types : Null<lua.Table<Int, String>>;
}