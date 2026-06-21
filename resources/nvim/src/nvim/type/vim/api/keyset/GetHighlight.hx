package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_highlight
	```
**/
@:structInit class GetHighlight {
	/**
		```lua
		(field) vim.api.keyset.get_highlight.create: boolean?
		```
	**/
	@:optional
	extern var create : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.link: boolean?
		```
	**/
	@:optional
	extern var link : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.name: string?
		```
	**/
	@:optional
	extern var name : Null<String>;
}