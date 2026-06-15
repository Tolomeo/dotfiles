package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.win_config
	```
**/
@:structInit extern class WinConfig {
	/**
		```lua
		(field) vim.api.keyset.win_config.anchor: ('NE'|'NW'|'SE'|'SW')?
		```
	**/
	var anchor : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.border: ('double'|'none'|'rounded'|'shadow'|'single'|'solid'|string[])?
		```
	**/
	var border : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.bufpos: integer[]?
		```
	**/
	var bufpos : Null<Array<Int>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.col: number?
		```
	**/
	var col : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.external: boolean?
		```
	**/
	var external : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.fixed: boolean?
		```
	**/
	var fixed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.focusable: boolean?
		```
	**/
	var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer: any
		```
	**/
	var footer : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer_pos: ('center'|'left'|'right')?
		```
	**/
	var footer_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.height: integer?
		```
	**/
	var height : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.hide: boolean?
		```
	**/
	var hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.mouse: boolean?
		```
	**/
	var mouse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.noautocmd: boolean?
		```
	**/
	var noautocmd : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.relative: ('cursor'|'editor'|'laststatus'|'mouse'|'tabline'|'win')?
		```
	**/
	var relative : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.row: number?
		```
	**/
	var row : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.split: ('above'|'below'|'left'|'right')?
		```
	**/
	var split : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.style: 'minimal'?
		```
	**/
	var style : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title: any
		```
	**/
	var title : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title_pos: ('center'|'left'|'right')?
		```
	**/
	var title_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.vertical: boolean?
		```
	**/
	var vertical : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.width: integer?
		```
	**/
	var width : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.win: integer?
		```
	**/
	var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.zindex: integer?
		```
	**/
	var zindex : Null<Int>;
}