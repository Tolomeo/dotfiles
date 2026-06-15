package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.highlight
	```
**/
@:structInit extern class Highlight {
	/**
		```lua
		(field) vim.api.keyset.highlight.altfont: boolean?
		```
	**/
	var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.background: (string|integer)?
		```
	**/
	var background : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg: (string|integer)?
		```
	**/
	var bg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg_indexed: boolean?
		```
	**/
	var bg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.blend: integer?
		```
	**/
	var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bold: boolean?
		```
	**/
	var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.cterm: (string|integer)?
		```
	**/
	var cterm : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermbg: (string|integer)?
		```
	**/
	var ctermbg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermfg: (string|integer)?
		```
	**/
	var ctermfg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.default: boolean?
		```
	**/
	@:native("default")
	var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fallback: boolean?
		```
	**/
	var fallback : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg: (string|integer)?
		```
	**/
	var fg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg_indexed: boolean?
		```
	**/
	var fg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.force: boolean?
		```
	**/
	var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.foreground: (string|integer)?
		```
	**/
	var foreground : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.global_link: (string|integer)?
		```
	**/
	var global_link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.italic: boolean?
		```
	**/
	var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.link: (string|integer)?
		```
	**/
	var link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.nocombine: boolean?
		```
	**/
	var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.reverse: boolean?
		```
	**/
	var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.sp: (string|integer)?
		```
	**/
	var sp : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.special: (string|integer)?
		```
	**/
	var special : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.standout: boolean?
		```
	**/
	var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.strikethrough: boolean?
		```
	**/
	var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.undercurl: boolean?
		```
	**/
	var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdashed: boolean?
		```
	**/
	var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdotted: boolean?
		```
	**/
	var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdouble: boolean?
		```
	**/
	var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underline: boolean?
		```
	**/
	var underline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.url: string?
		```
	**/
	var url : Null<String>;
}