package nvim.type.vim.fn.sign_unplace;

/**
	```lua
	(class) vim.fn.sign_unplace.dict
	```
**/
@:structInit extern class Dict {
	/**
		```lua
		(field) vim.fn.sign_unplace.dict.buffer: (string|integer)?
		```
	**/
	var buffer : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_unplace.dict.id: integer?
		```
	**/
	var id : Null<Int>;
}