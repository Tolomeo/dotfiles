package nvim.type.vim.fn.getbufinfo.ret;

/**
	```lua
	(field) vim.fn.getbufinfo.ret.item.variables: table<string, any>
	```
**/
@:structInit extern class Variables {

}

/**
	```lua
	(class) vim.fn.getbufinfo.ret.item
	```
**/
@:structInit extern class Item {
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.bufnr: integer
		```
	**/
	var bufnr : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.changed: 0|1
		```
	**/
	var changed : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.changedtick: integer
		```
	**/
	var changedtick : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.hidden: 0|1
		```
	**/
	var hidden : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.lastused: integer
		```
	**/
	var lastused : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.linecount: integer
		```
	**/
	var linecount : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.listed: 0|1
		```
	**/
	var listed : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.lnum: integer
		```
	**/
	var lnum : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.loaded: 0|1
		```
	**/
	var loaded : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.signs: vim.fn.sign[]
		```
	**/
	var signs : Array<nvim.type.vim.fn.Sign>;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.windows: integer[]
		```
	**/
	var windows : Array<Int>;
}