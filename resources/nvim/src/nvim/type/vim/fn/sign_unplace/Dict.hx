package nvim.type.vim.fn.sign_unplace;

/**
	```lua
	(class) vim.fn.sign_unplace.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_unplace.dict.buffer: (string|integer)?
		```
	**/
	@:optional
	extern var buffer : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_unplace.dict.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
}