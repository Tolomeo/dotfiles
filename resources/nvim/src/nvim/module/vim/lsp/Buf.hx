package nvim.module.vim.lsp;

extern class Buf {
	/**
		```lua
		function M.add_workspace_folder(workspace_folder?: string)
		```
		
		---
		
		 Add the folder at path to the workspace folders. If {path} is
		 not provided, the user will be prompted for a path using |input()|.
	**/
	@:luaDotMethod
	function add_workspace_folder(?workspace_folder:String):Dynamic;
	/**
		```lua
		function M.clear_references()
		```
		
		---
		
		 Removes document highlights from current buffer.
	**/
	@:luaDotMethod
	function clear_references():Dynamic;
	/**
		```lua
		function M.code_action(opts?: vim.lsp.buf.code_action.Opts)
		```
		
		---
		
		 Selects a code action (LSP: "textDocument/codeAction" request) available at cursor position.
		
		See:
		  * ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_codeAction
		  * [vim.lsp.protocol.CodeActionTriggerKind](file:///usr/local/share/nvim/runtime/lua/vim/lsp/protocol.lua#301#2)
	**/
	@:luaDotMethod
	function code_action(?opts:nvim.type.vim.lsp.buf.code_action.Opts):Dynamic;
	/**
		```lua
		function M.completion(context: table)
		  -> table<integer, integer>
		  2. function
		```
		
		---
		
		 Retrieves the completion items at the current cursor position. Can only be
		 called in Insert mode.
		
		@*param* `context` — (context support not yet implemented) Additional information
		
		 about the context in which a completion was triggered (how it was triggered,
		 and by which trigger character, if applicable)
		
		See: [vim.lsp.protocol.CompletionTriggerKind](file:///usr/local/share/nvim/runtime/lua/vim/lsp/protocol.lua#89#2)
	**/
	@:luaDotMethod
	@:deprecated
	function completion(context:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		function M.declaration(opts?: vim.lsp.LocationOpts)
		```
		
		---
		
		 Jumps to the declaration of the symbol under the cursor.
		 @note Many servers do not implement this method. Generally, see |vim.lsp.buf.definition()| instead.
	**/
	@:luaDotMethod
	function declaration(?opts:nvim.type.vim.lsp.LocationOpts):Dynamic;
	/**
		```lua
		function M.definition(opts?: vim.lsp.LocationOpts)
		```
		
		---
		
		 Jumps to the definition of the symbol under the cursor.
	**/
	@:luaDotMethod
	function definition(?opts:nvim.type.vim.lsp.LocationOpts):Dynamic;
	/**
		```lua
		function M.document_highlight()
		```
		
		---
		
		 Send request to the server to resolve document highlights for the current
		 text document position. This request can be triggered by a  key mapping or
		 by events such as `CursorHold`, e.g.:
		
		 ```vim
		 autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
		 autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
		 autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		 ```
		
		 Note: Usage of |vim.lsp.buf.document_highlight()| requires the following highlight groups
		       to be defined or you won't be able to see the actual highlights.
		         |hl-LspReferenceText|
		         |hl-LspReferenceRead|
		         |hl-LspReferenceWrite|
	**/
	@:luaDotMethod
	function document_highlight():Dynamic;
	/**
		```lua
		function M.document_symbol(opts?: vim.lsp.ListOpts)
		```
		
		---
		
		 Lists all symbols in the current buffer in the |location-list|.
	**/
	@:luaDotMethod
	function document_symbol(?opts:nvim.type.vim.lsp.ListOpts):Dynamic;
	/**
		```lua
		function M.execute_command(command_params: lsp.ExecuteCommandParams)
		```
		
		---
		
		 Executes an LSP server command.
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#workspace_executeCommand
	**/
	@:luaDotMethod
	@:deprecated
	function execute_command(command_params:nvim.type.lsp.ExecuteCommandParams):Dynamic;
	/**
		```lua
		function M.format(opts?: vim.lsp.buf.format.Opts)
		```
		
		---
		
		 Formats a buffer using the attached (and optionally filtered) language
		 server clients.
	**/
	@:luaDotMethod
	function format(?opts:nvim.type.vim.lsp.buf.format.Opts):Dynamic;
	/**
		```lua
		function M.hover(config?: vim.lsp.buf.hover.Opts)
		```
		
		---
		
		 Displays hover information about the symbol under the cursor in a floating
		 window. The window will be dismissed on cursor move.
		 Calling the function twice will jump into the floating window
		 (thus by default, "KK" will open the hover window and focus it).
		 In the floating window, all commands and mappings are available as usual,
		 except that "q" dismisses the window.
		 You can scroll the contents the same as you would any other buffer.
		
		 Note: to disable hover highlights, add the following to your config:
		
		 ```lua
		 vim.api.nvim_create_autocmd('ColorScheme', {
		   callback = function()
		     vim.api.nvim_set_hl(0, 'LspReferenceTarget', {})
		   end,
		 })
		 ```
	**/
	@:luaDotMethod
	function hover(?config:nvim.type.vim.lsp.buf.hover.Opts):Dynamic;
	/**
		```lua
		function M.implementation(opts?: vim.lsp.LocationOpts)
		```
		
		---
		
		 Lists all the implementations for the symbol under the cursor in the
		 quickfix window.
	**/
	@:luaDotMethod
	function implementation(?opts:nvim.type.vim.lsp.LocationOpts):Dynamic;
	/**
		```lua
		function M.incoming_calls()
		```
		
		---
		
		 Lists all the call sites of the symbol under the cursor in the
		 |quickfix| window. If the symbol can resolve to multiple
		 items, the user can pick one in the |inputlist()|.
	**/
	@:luaDotMethod
	function incoming_calls():Dynamic;
	/**
		```lua
		function M.list_workspace_folders()
		  -> table
		```
		
		---
		
		 List workspace folders.
	**/
	@:luaDotMethod
	function list_workspace_folders():Dynamic;
	/**
		```lua
		function M.outgoing_calls()
		```
		
		---
		
		 Lists all the items that are called by the symbol under the
		 cursor in the |quickfix| window. If the symbol can resolve to
		 multiple items, the user can pick one in the |inputlist()|.
	**/
	@:luaDotMethod
	function outgoing_calls():Dynamic;
	/**
		```lua
		function M.references(context?: lsp.ReferenceContext, opts?: vim.lsp.ListOpts)
		```
		
		---
		
		 Lists all the references to the symbol under the cursor in the quickfix window.
		
		@*param* `context` — Context for the request
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_references
	**/
	@:luaDotMethod
	function references(?context:Null<nvim.type.lsp.ReferenceContext>, ?opts:nvim.type.vim.lsp.ListOpts):Dynamic;
	/**
		```lua
		function M.remove_workspace_folder(workspace_folder?: string)
		```
		
		---
		
		 Remove the folder at path from the workspace folders. If
		 {path} is not provided, the user will be prompted for
		 a path using |input()|.
	**/
	@:luaDotMethod
	function remove_workspace_folder(?workspace_folder:String):Dynamic;
	/**
		```lua
		function M.rename(new_name: string|nil, opts?: vim.lsp.buf.rename.Opts)
		```
		
		---
		
		 Renames all references to the symbol under the cursor.
		
		@*param* `new_name` — If not provided, the user will be prompted for a new
		
		                name using |vim.ui.input()|.
		
		@*param* `opts` — Additional options:
	**/
	@:luaDotMethod
	function rename(?new_name:Null<String>, ?opts:nvim.type.vim.lsp.buf.rename.Opts):Dynamic;
	/**
		```lua
		function M.signature_help(config?: vim.lsp.buf.signature_help.Opts)
		```
		
		---
		
		 Displays signature information about the symbol under the cursor in a
		 floating window.
	**/
	@:luaDotMethod
	function signature_help(?config:nvim.type.vim.lsp.buf.signature_help.Opts):Dynamic;
	/**
		```lua
		function M.type_definition(opts?: vim.lsp.LocationOpts)
		```
		
		---
		
		 Jumps to the definition of the type of the symbol under the cursor.
	**/
	@:luaDotMethod
	function type_definition(?opts:nvim.type.vim.lsp.LocationOpts):Dynamic;
	/**
		```lua
		function M.typehierarchy(kind: "subtypes"|"supertypes")
		```
		
		---
		
		 Lists all the subtypes or supertypes of the symbol under the
		 cursor in the |quickfix| window. If the symbol can resolve to
		 multiple items, the user can pick one using |vim.ui.select()|.
		
		```lua
		kind:
		    | "subtypes"
		    | "supertypes"
		```
	**/
	@:luaDotMethod
	function typehierarchy(kind:String):Dynamic;
	/**
		```lua
		function M.workspace_symbol(query?: string, opts?: vim.lsp.ListOpts)
		```
		
		---
		
		 Lists all symbols in the current workspace in the quickfix window.
		
		 The list is filtered against {query}; if the argument is omitted from the
		 call, the user is prompted to enter a string on the command line. An empty
		 string means no filtering is done.
		
		@*param* `query` — optional
	**/
	@:luaDotMethod
	function workspace_symbol(?query:Null<String>, ?opts:nvim.type.vim.lsp.ListOpts):Dynamic;
}