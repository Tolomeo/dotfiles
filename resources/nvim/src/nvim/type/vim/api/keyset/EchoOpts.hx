package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.echo_opts
	```
**/
@:structInit class EchoOpts {
	/**
		```lua
		(field) vim.api.keyset.echo_opts.err: boolean?
		```
	**/
	@:optional
	extern var err : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.echo_opts.verbose: boolean?
		```
	**/
	@:optional
	extern var verbose : Null<Bool>;
}