package nvim.type.vim.fn.getbufinfo.ret;

/**
	```lua
	(field) vim.fn.getbufinfo.ret.item.variables: table<string, any>
	```
**/
@:structInit class Variables {

}

/**
	```lua
	(class) vim.fn.getbufinfo.ret.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.bufnr: integer
		```
	**/
	extern public var bufnr : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.changed: 0|1
		```
	**/
	extern public var changed : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.changedtick: integer
		```
	**/
	extern public var changedtick : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.hidden: 0|1
		```
	**/
	extern public var hidden : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.lastused: integer
		```
	**/
	extern public var lastused : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.linecount: integer
		```
	**/
	extern public var linecount : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.listed: 0|1
		```
	**/
	extern public var listed : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.lnum: integer
		```
	**/
	extern public var lnum : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.loaded: 0|1
		```
	**/
	extern public var loaded : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.name: string
		```
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.signs: vim.fn.sign[]
		```
	**/
	extern public var signs : lua.Table<Int, nvim.type.vim.fn.Sign>;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.windows: integer[]
		```
	**/
	extern public var windows : lua.Table<Int, Float>;
}