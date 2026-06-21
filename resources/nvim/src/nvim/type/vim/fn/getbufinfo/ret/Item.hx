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
	extern var bufnr : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.changed: 0|1
		```
	**/
	extern var changed : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.changedtick: integer
		```
	**/
	extern var changedtick : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.hidden: 0|1
		```
	**/
	extern var hidden : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.lastused: integer
		```
	**/
	extern var lastused : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.linecount: integer
		```
	**/
	extern var linecount : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.listed: 0|1
		```
	**/
	extern var listed : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.lnum: integer
		```
	**/
	extern var lnum : Int;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.loaded: 0|1
		```
	**/
	extern var loaded : Float;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.signs: vim.fn.sign[]
		```
	**/
	extern var signs : Array<nvim.type.vim.fn.Sign>;
	/**
		```lua
		(field) vim.fn.getbufinfo.ret.item.windows: integer[]
		```
	**/
	extern var windows : Array<Int>;
}