package nvim.type.vim.fn.sign_getplaced;

/**
	```lua
	(class) vim.fn.sign_getplaced.dict
	```
**/
@:structInit extern class Dict {
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.group: string?
		```
	**/
	var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.id: integer?
		```
	**/
	var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.lnum: (string|integer)?
		```
	**/
	var lnum : Null<haxe.extern.EitherType<String, Int>>;
}