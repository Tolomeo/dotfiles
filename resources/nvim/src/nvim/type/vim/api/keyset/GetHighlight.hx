package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_highlight
	```
**/
@:structInit extern class GetHighlight {
	/**
		```lua
		(field) vim.api.keyset.get_highlight.create: boolean?
		```
	**/
	var create : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.id: integer?
		```
	**/
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.link: boolean?
		```
	**/
	var link : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.name: string?
		```
	**/
	var name : Null<String>;
}