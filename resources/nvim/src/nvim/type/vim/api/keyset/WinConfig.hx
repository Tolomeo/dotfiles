package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.win_config
	```
**/
@:structInit class WinConfig {
	/**
		```lua
		(field) vim.api.keyset.win_config.anchor: ('NE'|'NW'|'SE'|'SW')?
		```
	**/
	@:optional
	extern var anchor : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.border: ('double'|'none'|'rounded'|'shadow'|'single'|'solid'|string[])?
		```
	**/
	@:optional
	extern var border : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.bufpos: integer[]?
		```
	**/
	@:optional
	extern var bufpos : Null<Array<Int>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.col: number?
		```
	**/
	@:optional
	extern var col : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.external: boolean?
		```
	**/
	@:optional
	extern var external : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.fixed: boolean?
		```
	**/
	@:optional
	extern var fixed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.focusable: boolean?
		```
	**/
	@:optional
	extern var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer: any
		```
	**/
	@:optional
	extern var footer : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	extern var footer_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.height: integer?
		```
	**/
	@:optional
	extern var height : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.hide: boolean?
		```
	**/
	@:optional
	extern var hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.mouse: boolean?
		```
	**/
	@:optional
	extern var mouse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.noautocmd: boolean?
		```
	**/
	@:optional
	extern var noautocmd : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.relative: ('cursor'|'editor'|'laststatus'|'mouse'|'tabline'|'win')?
		```
	**/
	@:optional
	extern var relative : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.row: number?
		```
	**/
	@:optional
	extern var row : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.split: ('above'|'below'|'left'|'right')?
		```
	**/
	@:optional
	extern var split : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.style: 'minimal'?
		```
	**/
	@:optional
	extern var style : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title: any
		```
	**/
	@:optional
	extern var title : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	extern var title_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.vertical: boolean?
		```
	**/
	@:optional
	extern var vertical : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.width: integer?
		```
	**/
	@:optional
	extern var width : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.win: integer?
		```
	**/
	@:optional
	extern var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.zindex: integer?
		```
	**/
	@:optional
	extern var zindex : Null<Int>;
}