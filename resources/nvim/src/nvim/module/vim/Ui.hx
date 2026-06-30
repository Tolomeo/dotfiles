package nvim.module.vim;

extern class Ui {
	/**
		```lua
		function M.input(opts?: table, on_confirm: function)
		```
		
		---
		
		 Prompts the user for input, allowing arbitrary (potentially asynchronous) work until
		 `on_confirm`.
		
		 Example:
		
		 ```lua
		 vim.ui.input({ prompt = 'Enter value for shiftwidth: ' }, function(input)
		     vim.o.shiftwidth = tonumber(input)
		 end)
		 ```
		
		@*param* `opts` — Additional options. See |input()|
		
		     - prompt (string|nil)
		               Text of the prompt
		     - default (string|nil)
		               Default reply to the input
		     - completion (string|nil)
		               Specifies type of completion supported
		               for input. Supported types are the same
		               that can be supplied to a user-defined
		               command using the "-complete=" argument.
		               See |:command-completion|
		     - highlight (function)
		               Function that will be used for highlighting
		               user inputs.
		
		@*param* `on_confirm` — ((input|nil) -> ())
		
		               Called once the user confirms or abort the input.
		               `input` is what the user typed (it might be
		               an empty string if nothing was entered), or
		               `nil` if the user aborted the dialog.
	**/
	@:luaDotMethod
	function input(opts:Null<lua.Table.AnyTable>, on_confirm:Dynamic):Dynamic;
	/**
		```lua
		function M.open(path: string, opt?: { cmd: string[] })
		  -> vim.SystemObj|nil
		  2. string|nil
		```
		
		---
		
		 Opens `path` with the system default handler (macOS `open`, Windows `explorer.exe`, Linux
		 `xdg-open`, …), or returns (but does not show) an error message on failure.
		
		 Can also be invoked with `:Open`. [:Open](file:///usr/local/share/nvim/runtime/lua/vim)
		
		 Expands "~/" and environment variables in filesystem paths.
		
		 Examples:
		
		 ```lua
		 -- Asynchronous.
		 vim.ui.open("https://neovim.io/")
		 vim.ui.open("~/path/to/file")
		 -- Use the "osurl" command to handle the path or URL.
		 vim.ui.open("gh#neovim/neovim!29490", { cmd = { 'osurl' } })
		 -- Synchronous (wait until the process exits).
		 local cmd, err = vim.ui.open("$VIMRUNTIME")
		 if cmd then
		   cmd:wait()
		 end
		 ```
		
		@*param* `path` — Path or URL to open
		
		@*param* `opt` — Options
		
		     - cmd string[]|nil Command used to open the path or URL.
		
		@*return* — Command object, or nil if not found.
		
		@*return* — Error message on failure, or nil on success.
	**/
	@:native("open")
	@:luaDotMethod
	private function __open(path:String, ?opt:{ @:optional
	var cmd : Null<lua.Table<Int, String>>; }):nvim.helper.Multireturn<Null<nvim.type.vim.SystemObj>, Null<String>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		function M.open(path: string, opt?: { cmd: string[] })
		  -> vim.SystemObj|nil
		  2. string|nil
		```
		
		---
		
		 Opens `path` with the system default handler (macOS `open`, Windows `explorer.exe`, Linux
		 `xdg-open`, …), or returns (but does not show) an error message on failure.
		
		 Can also be invoked with `:Open`. [:Open](file:///usr/local/share/nvim/runtime/lua/vim)
		
		 Expands "~/" and environment variables in filesystem paths.
		
		 Examples:
		
		 ```lua
		 -- Asynchronous.
		 vim.ui.open("https://neovim.io/")
		 vim.ui.open("~/path/to/file")
		 -- Use the "osurl" command to handle the path or URL.
		 vim.ui.open("gh#neovim/neovim!29490", { cmd = { 'osurl' } })
		 -- Synchronous (wait until the process exits).
		 local cmd, err = vim.ui.open("$VIMRUNTIME")
		 if cmd then
		   cmd:wait()
		 end
		 ```
		
		@*param* `path` — Path or URL to open
		
		@*param* `opt` — Options
		
		     - cmd string[]|nil Command used to open the path or URL.
		
		@*return* — Command object, or nil if not found.
		
		@*return* — Error message on failure, or nil on success.
	**/
	@:luaDotMethod
	inline function open(path:String, ?opt:{ @:optional
	var cmd : Null<lua.Table<Int, String>>; }):nvim.helper.Multireturn.Return2<Null<nvim.type.vim.SystemObj>, Null<String>> {
		opt = nvim.helper.Arg.pure(opt);
		final result = __open(path, opt);
		return new nvim.helper.Multireturn.Return2<Null<nvim.type.vim.SystemObj>, Null<String>>(result._0, result._1);
	}
	/**
		```lua
		function M.select(items: <T>[], opts: table, on_choice: fun(item: <T>|nil, idx: integer|nil))
		```
		
		---
		
		 Prompts the user to pick from a list of items, allowing arbitrary (potentially asynchronous)
		 work until `on_choice`.
		
		 Example:
		
		 ```lua
		 vim.ui.select({ 'tabs', 'spaces' }, {
		     prompt = 'Select tabs or spaces:',
		     format_item = function(item)
		         return "I'd like to choose " .. item
		     end,
		 }, function(choice)
		     if choice == 'spaces' then
		         vim.o.expandtab = true
		     else
		         vim.o.expandtab = false
		     end
		 end)
		 ```
		
		@*param* `items` — Arbitrary items
		
		@*param* `opts` — Additional options
		
		     - prompt (string|nil)
		               Text of the prompt. Defaults to `Select one of:`
		     - format_item (function item -> text)
		               Function to format an
		               individual item from `items`. Defaults to `tostring`.
		     - kind (string|nil)
		               Arbitrary hint string indicating the item shape.
		               Plugins reimplementing `vim.ui.select` may wish to
		               use this to infer the structure or semantics of
		               `items`, or the context in which select() was called.
		               `idx` is the 1-based index of `item` within `items`.
		               `nil` if the user aborted the dialog.
	**/
	@:native("select")
	@:luaDotMethod
	private function __select<T>(items:lua.Table<Int, T>, opts:lua.Table.AnyTable, on_choice:(?item:Null<T>, ?idx:Null<Float>) -> Dynamic):Dynamic;
	/**
		```lua
		function M.select(items: <T>[], opts: table, on_choice: fun(item: <T>|nil, idx: integer|nil))
		```
		
		---
		
		 Prompts the user to pick from a list of items, allowing arbitrary (potentially asynchronous)
		 work until `on_choice`.
		
		 Example:
		
		 ```lua
		 vim.ui.select({ 'tabs', 'spaces' }, {
		     prompt = 'Select tabs or spaces:',
		     format_item = function(item)
		         return "I'd like to choose " .. item
		     end,
		 }, function(choice)
		     if choice == 'spaces' then
		         vim.o.expandtab = true
		     else
		         vim.o.expandtab = false
		     end
		 end)
		 ```
		
		@*param* `items` — Arbitrary items
		
		@*param* `opts` — Additional options
		
		     - prompt (string|nil)
		               Text of the prompt. Defaults to `Select one of:`
		     - format_item (function item -> text)
		               Function to format an
		               individual item from `items`. Defaults to `tostring`.
		     - kind (string|nil)
		               Arbitrary hint string indicating the item shape.
		               Plugins reimplementing `vim.ui.select` may wish to
		               use this to infer the structure or semantics of
		               `items`, or the context in which select() was called.
		               `idx` is the 1-based index of `item` within `items`.
		               `nil` if the user aborted the dialog.
	**/
	@:luaDotMethod
	inline function select<T>(items:lua.Table<Int, T>, opts:lua.Table.AnyTable, on_choice:(?item:Null<T>, ?idx:Null<Float>) -> Dynamic):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __select(items, opts, on_choice);
		return result;
	}
}