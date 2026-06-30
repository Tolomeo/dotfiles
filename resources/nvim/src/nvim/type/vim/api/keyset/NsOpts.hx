package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.ns_opts
	```
**/
@:structInit class NsOpts {
	/**
		```lua
		(field) vim.api.keyset.ns_opts.wins: any[]?
		```
	**/
	@:optional
	extern public var wins : Null<lua.Table<Int, Any>>;
}