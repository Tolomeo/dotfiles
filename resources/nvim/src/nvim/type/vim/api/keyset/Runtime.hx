package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.runtime
	```
**/
@:structInit class Runtime {
	/**
		```lua
		(field) vim.api.keyset.runtime.do_source: boolean?
		```
	**/
	@:optional
	extern var do_source : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.runtime.is_lua: boolean?
		```
	**/
	@:optional
	extern var is_lua : Null<Bool>;
}