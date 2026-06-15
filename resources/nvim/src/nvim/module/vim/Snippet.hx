package nvim.module.vim;

extern class Snippet {
	/**
		```lua
		function M.active(filter?: vim.snippet.ActiveFilter)
		  -> boolean
		```
		
		---
		
		 Returns `true` if there's an active snippet in the current buffer,
		 applying the given filter if provided.
		
		@*param* `filter` — Filter to constrain the search with:
		
		 - `direction` (vim.snippet.Direction): Navigation direction. Will return `true` if the snippet
		 can be jumped in the given direction.
	**/
	@:luaDotMethod
	function active(?filter:nvim.type.vim.snippet.ActiveFilter):Bool;
	/**
		```lua
		function M.expand(input: string)
		```
		
		---
		
		 Expands the given snippet text.
		 Refer to https://microsoft.github.io/language-server-protocol/specification/#snippet_syntax
		 for the specification of valid input.
		
		 Tabstops are highlighted with |hl-SnippetTabstop|.
	**/
	@:luaDotMethod
	function expand(input:String):Dynamic;
	/**
		```lua
		function M.jump(direction: -1|1)
		```
		
		---
		
		 Jumps to the next (or previous) placeholder in the current snippet, if possible.
		
		 By default `<Tab>` is setup to jump if a snippet is active. The default mapping looks like:
		
		 ```lua
		 vim.keymap.set({ 'i', 's' }, '<Tab>', function()
		    if vim.snippet.active({ direction = 1 }) then
		      return '<Cmd>lua vim.snippet.jump(1)<CR>'
		    else
		      return '<Tab>'
		    end
		  end, { descr = '...', expr = true, silent = true })
		 ```
		
		@*param* `direction` — Navigation direction. -1 for previous, 1 for next.
		
		```lua
		direction:
		    | -1
		    | 1
		```
	**/
	@:luaDotMethod
	function jump(direction:nvim.type.vim.snippet.Direction):Dynamic;
	/**
		```lua
		function M.stop()
		```
		
		---
		
		 Exits the current snippet.
	**/
	@:luaDotMethod
	function stop():Dynamic;
}