package nvim.module.vim;

extern class Keymap {
	@:native("del")
	@:luaDotMethod
	private function __del(modes:haxe.extern.EitherType<String, lua.Table<Int, String>>, lhs:String, ?opts:nvim.type.vim.keymap.del.Opts):Dynamic;
	/**
		```lua
		function keymap.del(modes: string|string[], lhs: string, opts?: vim.keymap.del.Opts)
		```
		
		---
		
		 Remove an existing mapping.
		 Examples:
		
		 ```lua
		 vim.keymap.del('n', 'lhs')
		
		 vim.keymap.del({'n', 'i', 'v'}, '<leader>w', { buffer = 5 })
		 ```
	**/
	@:luaDotMethod
	inline function del(modes:haxe.extern.EitherType<String, lua.Table<Int, String>>, lhs:String, ?opts:nvim.type.vim.keymap.del.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __del(modes, lhs, opts);
		return result;
	}
	@:native("set")
	@:luaDotMethod
	private function __set(mode:haxe.extern.EitherType<String, lua.Table<Int, String>>, lhs:String, rhs:haxe.extern.EitherType<String, haxe.Constraints.Function>, ?opts:nvim.type.vim.keymap.set.Opts):Dynamic;
	/**
		```lua
		function keymap.set(mode: string|string[], lhs: string, rhs: string|function, opts?: vim.keymap.set.Opts)
		```
		
		---
		
		 Defines a |mapping| of |keycodes| to a function or keycodes.
		
		 Examples:
		
		 ```lua
		 -- Map "x" to a Lua function:
		 vim.keymap.set('n', 'x', function() print("real lua function") end)
		 -- Map "<leader>x" to multiple modes for the current buffer:
		 vim.keymap.set({'n', 'v'}, '<leader>x', vim.lsp.buf.references, { buffer = true })
		 -- Map <Tab> to an expression (|:map-<expr>|):
		 vim.keymap.set('i', '<Tab>', function()
		   return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
		 end, { expr = true })
		 -- Map "[%%" to a <Plug> mapping:
		 vim.keymap.set('n', '[%%', '<Plug>(MatchitNormalMultiBackward)')
		 ```
		
		@*param* `mode` — Mode "short-name" (see |nvim_set_keymap()|), or a list thereof.
		
		@*param* `lhs` — Left-hand side |{lhs}| of the mapping.
		
		@*param* `rhs` — Right-hand side |{rhs}| of the mapping, can be a Lua function.
	**/
	@:luaDotMethod
	inline function set(mode:haxe.extern.EitherType<String, lua.Table<Int, String>>, lhs:String, rhs:haxe.extern.EitherType<String, haxe.Constraints.Function>, ?opts:nvim.type.vim.keymap.set.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __set(mode, lhs, rhs, opts);
		return result;
	}
}