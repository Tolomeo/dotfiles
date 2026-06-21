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
	extern var types : Null<Array<String>>;
}