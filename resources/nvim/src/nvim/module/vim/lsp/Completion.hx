package nvim.module.vim.lsp;

extern class Completion {
	@:native("enable")
	@:luaDotMethod
	private function __enable(enable:Bool, client_id:Float, bufnr:Float, ?opts:nvim.type.vim.lsp.completion.BufferOpts):Dynamic;
	/**
		```lua
		function M.enable(enable: boolean, client_id: integer, bufnr: integer, opts?: vim.lsp.completion.BufferOpts)
		```
		
		---
		
		 Enables or disables completions from the given language client in the given
		 buffer. Effects of enabling completions are:
		
		 - Calling |vim.lsp.completion.get()| uses the enabled clients to retrieve
		   completion candidates
		
		 - Accepting a completion candidate using `<c-y>` applies side effects like
		   expanding snippets, text edits (e.g. insert import statements) and
		   executing associated commands. This works for completions triggered via
		   autotrigger, omnifunc or completion.get()
		
		 Example: |lsp-attach| |lsp-completion|
		
		 Note: the behavior of `autotrigger=true` is controlled by the LSP `triggerCharacters` field. You
		 can override it on LspAttach, see |lsp-autocompletion|.
		
		@*param* `enable` — True to enable, false to disable
		
		@*param* `client_id` — Client ID
		
		@*param* `bufnr` — Buffer handle, or 0 for the current buffer
	**/
	@:luaDotMethod
	inline function enable(enable:Bool, client_id:Float, bufnr:Float, ?opts:nvim.type.vim.lsp.completion.BufferOpts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __enable(enable, client_id, bufnr, opts);
		return result;
	}
	@:native("get")
	@:luaDotMethod
	private function __get(?opts:nvim.type.vim.lsp.completion.get.Opts):Dynamic;
	/**
		```lua
		function M.get(opts?: vim.lsp.completion.get.Opts)
		```
		
		---
		
		 Triggers LSP completion once in the current buffer, if LSP completion is enabled
		 (see |lsp-attach| |lsp-completion|).
		
		 Used by the default LSP |omnicompletion| provider |vim.lsp.omnifunc()|, thus |i_CTRL-X_CTRL-O|
		 invokes this in LSP-enabled buffers. Use CTRL-Y to select an item from the completion menu.
		 |complete_CTRL-Y|
		
		 To invoke manually with CTRL-space, use this mapping:
		 ```lua
		 -- Use CTRL-space to trigger LSP completion.
		 -- Use CTRL-Y to select an item. |complete_CTRL-Y|
		 vim.keymap.set('i', '<c-space>', function()
		   vim.lsp.completion.get()
		 end)
		 ```
	**/
	@:luaDotMethod
	inline function get(?opts:nvim.type.vim.lsp.completion.get.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __get(opts);
		return result;
	}
}