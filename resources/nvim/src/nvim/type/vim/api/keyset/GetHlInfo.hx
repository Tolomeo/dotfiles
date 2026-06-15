package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_hl_info
	```
**/
@:structInit extern class GetHlInfo {
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.altfont: true?
		```
	**/
	var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bg: integer?
		```
	**/
	var bg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.blend: integer?
		```
	**/
	var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bold: true?
		```
	**/
	var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.cterm: (vim.api.keyset.hl_info.cterm)?
		```
	**/
	var cterm : Null<nvim.type.vim.api.keyset.hl_info.Cterm>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermbg: integer?
		```
	**/
	var ctermbg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermfg: integer?
		```
	**/
	var ctermfg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.default: true?
		```
	**/
	@:native("default")
	var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.fg: integer?
		```
	**/
	var fg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.italic: true?
		```
	**/
	var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.link: string?
		```
	**/
	var link : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.nocombine: true?
		```
	**/
	var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.reverse: true?
		```
	**/
	var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.sp: integer?
		```
	**/
	var sp : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.standout: true?
		```
	**/
	var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.strikethrough: true?
		```
	**/
	var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.undercurl: true?
		```
	**/
	var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdashed: true?
		```
	**/
	var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdotted: true?
		```
	**/
	var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdouble: true?
		```
	**/
	var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underline: true?
		```
	**/
	var underline : Null<Bool>;
}