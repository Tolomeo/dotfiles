package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_hl_info
	```
**/
@:structInit class GetHlInfo {
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.altfont: true?
		```
	**/
	@:optional
	extern public var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bg: integer?
		```
	**/
	@:optional
	extern public var bg : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.blend: integer?
		```
	**/
	@:optional
	extern public var blend : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bold: true?
		```
	**/
	@:optional
	extern public var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.cterm: (vim.api.keyset.hl_info.cterm)?
		```
	**/
	@:optional
	extern public var cterm : Null<nvim.type.vim.api.keyset.hl_info.Cterm>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermbg: integer?
		```
	**/
	@:optional
	extern public var ctermbg : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermfg: integer?
		```
	**/
	@:optional
	extern public var ctermfg : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.default: true?
		```
	**/
	@:optional
	@:native("default")
	extern public var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.fg: integer?
		```
	**/
	@:optional
	extern public var fg : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.italic: true?
		```
	**/
	@:optional
	extern public var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.link: string?
		```
	**/
	@:optional
	extern public var link : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.nocombine: true?
		```
	**/
	@:optional
	extern public var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.reverse: true?
		```
	**/
	@:optional
	extern public var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.sp: integer?
		```
	**/
	@:optional
	extern public var sp : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.standout: true?
		```
	**/
	@:optional
	extern public var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.strikethrough: true?
		```
	**/
	@:optional
	extern public var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.undercurl: true?
		```
	**/
	@:optional
	extern public var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdashed: true?
		```
	**/
	@:optional
	extern public var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdotted: true?
		```
	**/
	@:optional
	extern public var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdouble: true?
		```
	**/
	@:optional
	extern public var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underline: true?
		```
	**/
	@:optional
	extern public var underline : Null<Bool>;
}