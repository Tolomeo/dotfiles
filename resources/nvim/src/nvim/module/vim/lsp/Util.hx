package nvim.module.vim.lsp;

/**
	```lua
	(global) vim.lsp.util.buf_versions: table<integer, integer>
	```
**/
extern class BufVersions {

}

extern class Util {
	/**
		```lua
		function M.apply_text_document_edit(text_document_edit: lsp.TextDocumentEdit, index?: integer, position_encoding?: 'utf-16'|'utf-32'|'utf-8')
		```
		
		---
		
		 Applies a `TextDocumentEdit`, which is a list of changes to a single
		 document.
		
		@*param* `index` — : Optional index of the edit, if from a list of edits (or nil, if not from a list)
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentEdit
	**/
	@:luaDotMethod
	function apply_text_document_edit(text_document_edit:nvim.type.lsp.TextDocumentEdit, ?index:Int, ?position_encoding:String):Dynamic;
	/**
		```lua
		function M.apply_text_edits(text_edits: lsp.TextEdit[], bufnr: integer, position_encoding: 'utf-16'|'utf-32'|'utf-8')
		```
		
		---
		
		 Applies a list of text edits to a buffer.
		
		@*param* `bufnr` — Buffer id
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textEdit
	**/
	@:luaDotMethod
	function apply_text_edits(text_edits:Array<nvim.type.lsp.TextEdit>, bufnr:Int, position_encoding:String):Dynamic;
	/**
		```lua
		function M.apply_workspace_edit(workspace_edit: lsp.WorkspaceEdit, position_encoding: 'utf-16'|'utf-32'|'utf-8')
		```
		
		---
		
		 Applies a `WorkspaceEdit`.
		
		@*param* `position_encoding` — (required)
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#workspace_applyEdit
	**/
	@:luaDotMethod
	function apply_workspace_edit(workspace_edit:nvim.type.lsp.WorkspaceEdit, position_encoding:String):Dynamic;
	/**
		```lua
		function M.buf_clear_references(bufnr?: integer)
		```
		
		---
		
		 Removes document highlights from a buffer.
		
		@*param* `bufnr` — Buffer id
	**/
	@:luaDotMethod
	function buf_clear_references(?bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.buf_highlight_references(bufnr: integer, references: lsp.DocumentHighlight[], position_encoding: 'utf-16'|'utf-32'|'utf-8')
		```
		
		---
		
		 Shows a list of document highlights for a certain buffer.
		
		@*param* `bufnr` — Buffer id
		
		@*param* `references` — objects to highlight
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specification/#textDocumentContentChangeEvent
	**/
	@:luaDotMethod
	function buf_highlight_references(bufnr:Int, references:Array<nvim.type.lsp.DocumentHighlight>, position_encoding:String):Dynamic;
	/**
		```lua
		function M.character_offset(buf: integer, row: integer, col: integer, offset_encoding?: 'utf-16'|'utf-32'|'utf-8')
		  -> integer
		```
		
		---
		
		 Returns the UTF-32 and UTF-16 offsets for a position in a certain buffer.
		
		@*param* `buf` — buffer number (0 for current)
		
		@*param* `row` — 0-indexed line
		
		@*param* `col` — 0-indexed byte offset in line
		
		                        defaults to `offset_encoding` of first client of `buf`
		
		@*return* — `offset_encoding` index of the character in line {row} column {col} in buffer {buf}
		
		```lua
		offset_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
	**/
	@:luaDotMethod
	function character_offset(buf:Int, row:Int, col:Int, ?offset_encoding:String):Int;
	/**
		```lua
		function M.convert_input_to_markdown_lines(input: string|lsp.MarkedStringWithLanguage|lsp.MarkupContent|string|lsp.MarkedStringWithLanguage[], contents?: string[])
		  -> extended: string[]
		```
		
		---
		
		 Converts any of `MarkedString` | `MarkedString[]` | `MarkupContent` into
		 a list of lines containing valid markdown. Useful to populate the hover
		 window for `textDocument/hover`, for parsing the result of
		 `textDocument/signatureHelp`, and potentially others.
		
		 Note that if the input is of type `MarkupContent` and its kind is `plaintext`,
		 then the corresponding value is returned without further modifications.
		
		@*param* `contents` — List of strings to extend with converted lines. Defaults to {}.
		
		@*return* `extended` — with lines of converted markdown.
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_hover
	**/
	@:luaDotMethod
	function convert_input_to_markdown_lines(input:haxe.extern.EitherType<nvim.type.lsp.MarkedString, haxe.extern.EitherType<Array<nvim.type.lsp.MarkedString>, nvim.type.lsp.MarkupContent>>, ?contents:Null<Array<String>>):Array<String>;
	/**
		```lua
		function M.convert_signature_help_to_markdown_lines(signature_help: lsp.SignatureHelp, ft?: string, triggers?: string[])
		  -> string[]?
		  2. Range4?
		```
		
		---
		
		 Converts `textDocument/signatureHelp` response to markdown lines.
		
		@*param* `signature_help` — Response of `textDocument/SignatureHelp`
		
		@*param* `ft` — filetype that will be use as the `lang` for the label markdown code block
		
		@*param* `triggers` — list of trigger characters from the lsp server. used to better determine parameter offsets
		
		@*return* — lines of converted markdown.
		
		@*return* — highlight range for the active parameter
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_signatureHelp
	**/
	@:luaDotMethod
	function convert_signature_help_to_markdown_lines(signature_help:nvim.type.lsp.SignatureHelp, ?ft:Null<String>, ?triggers:Null<Array<String>>):nvim.helper.Multireturn<Null<Array<String>>, Null<nvim.type.Range4>, Void, Void, Void, Void>;
	/**
		```lua
		function M.get_effective_tabstop(bufnr?: integer)
		  -> indentation: integer
		```
		
		---
		
		 Returns indentation size.
		
		@*param* `bufnr` — : Buffer handle, defaults to current
		
		@*return* `indentation` — size
	**/
	@:luaDotMethod
	function get_effective_tabstop(?bufnr:Null<Int>):Int;
	/**
		```lua
		function M.jump_to_location(location: lsp.Location|lsp.LocationLink, position_encoding?: 'utf-16'|'utf-32'|'utf-8', reuse_win?: boolean)
		  -> boolean
		```
		
		---
		
		 Jumps to a location.
		
		@*param* `reuse_win` — Jump to existing window if buffer is already open.
		
		@*return* — `true` if the jump succeeded
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
	**/
	@:luaDotMethod
	@:deprecated
	function jump_to_location(location:haxe.extern.EitherType<nvim.type.lsp.Location, nvim.type.lsp.LocationLink>, position_encoding:haxe.extern.EitherType<String, Null<String>>, ?reuse_win:Null<Bool>):Bool;
	/**
		```lua
		function M.locations_to_items(locations: lsp.LocationLink[]|lsp.Location[], position_encoding?: 'utf-16'|'utf-32'|'utf-8')
		  -> vim.quickfix.entry[]
		```
		
		---
		
		 Returns the items with the byte position calculated correctly and in sorted
		 order, for display in quickfix and location lists.
		
		 The `user_data` field of each resulting item will contain the original
		 `Location` or `LocationLink` it was computed from.
		
		 The result can be passed to the {list} argument of |setqflist()| or
		 |setloclist()|.
		
		                         default to first client of buffer
		
		@*return* — See |setqflist()| for the format
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
	**/
	@:luaDotMethod
	function locations_to_items(locations:haxe.extern.EitherType<Array<nvim.type.lsp.Location>, Array<nvim.type.lsp.LocationLink>>, ?position_encoding:String):Array<nvim.type.vim.quickfix.Entry>;
	/**
		```lua
		function M.lookup_section(settings: table, section: string)
		  -> The: string|table|vim.NIL
		```
		
		---
		
		 Helper function to return nested values in language server settings
		
		@*param* `settings` — language server settings
		
		@*param* `section` — indicating the field of the settings table
		
		@*return* `The` — value of settings accessed via section. `vim.NIL` if not found.
	**/
	@:luaDotMethod
	@:deprecated
	function lookup_section(settings:lua.Table.AnyTable, section:String):haxe.extern.EitherType<lua.Table.AnyTable, haxe.extern.EitherType<String, nvim.type.vim.NIL>>;
	/**
		```lua
		function M.make_floating_popup_options(width: integer, height: integer, opts?: vim.lsp.util.open_floating_preview.Opts)
		  -> vim.api.keyset.win_config
		```
		
		---
		
		 Creates a table with sensible default options for a floating window. The
		 table can be passed to |nvim_open_win()|.
		
		@*param* `width` — window width (in character cells)
		
		@*param* `height` — window height (in character cells)
	**/
	@:luaDotMethod
	function make_floating_popup_options(width:Int, height:Int, ?opts:nvim.type.vim.lsp.util.open_floating_preview.Opts):nvim.type.vim.api.keyset.WinConfig;
	/**
		```lua
		function M.make_formatting_params(options?: lsp.FormattingOptions)
		  -> object: lsp.DocumentFormattingParams
		```
		
		---
		
		 Creates a `DocumentFormattingParams` object for the current buffer and cursor position.
		
		@*param* `options` — with valid `FormattingOptions` entries
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_formatting
	**/
	@:luaDotMethod
	function make_formatting_params(?options:Null<nvim.type.lsp.FormattingOptions>):nvim.type.lsp.DocumentFormattingParams;
	/**
		```lua
		function M.make_given_range_params(start_pos?: [integer, integer], end_pos?: [integer, integer], bufnr?: integer, position_encoding: 'utf-16'|'utf-32'|'utf-8')
		  -> { textDocument: { uri: string }, range: lsp.Range }
		```
		
		---
		
		 Using the given range in the current buffer, creates an object that
		 is similar to |vim.lsp.util.make_range_params()|.
		
		@*param* `start_pos` — {row,col} mark-indexed position.
		
		 Defaults to the start of the last visual selection.
		
		@*param* `end_pos` — {row,col} mark-indexed position.
		
		 Defaults to the end of the last visual selection.
		
		@*param* `bufnr` — buffer handle or 0 for current, defaults to current
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
	**/
	@:luaDotMethod
	function make_given_range_params(start_pos:Dynamic, end_pos:Dynamic, bufnr:Null<Int>, position_encoding:String):{ var textDocument : { var uri : nvim.type.lsp.DocumentUri; }; var range : nvim.type.lsp.Range; };
	/**
		```lua
		function M.make_position_params(window?: integer, position_encoding: 'utf-16'|'utf-32'|'utf-8')
		  -> lsp.TextDocumentPositionParams
		```
		
		---
		
		 Creates a `TextDocumentPositionParams` object for the current buffer and cursor position.
		
		@*param* `window` — : |window-ID| or 0 for current, defaults to current
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentPositionParams
	**/
	@:luaDotMethod
	function make_position_params(window:Null<Int>, position_encoding:String):nvim.type.lsp.TextDocumentPositionParams;
	/**
		```lua
		function M.make_range_params(window?: integer, position_encoding: "utf-16"|"utf-32"|"utf-8")
		  -> { textDocument: { uri: string }, range: lsp.Range }
		```
		
		---
		
		 Using the current position in the current buffer, creates an object that
		 can be used as a building block for several LSP requests, such as
		 `textDocument/codeAction`, `textDocument/colorPresentation`,
		 `textDocument/rangeFormatting`.
		
		@*param* `window` — : |window-ID| or 0 for current, defaults to current
		
		```lua
		position_encoding:
		    | "utf-8"
		    | "utf-16"
		    | "utf-32"
		```
	**/
	@:luaDotMethod
	function make_range_params(window:Null<Int>, position_encoding:String):{ var textDocument : { var uri : nvim.type.lsp.DocumentUri; }; var range : nvim.type.lsp.Range; };
	/**
		```lua
		function M.make_text_document_params(bufnr?: integer)
		  -> lsp.TextDocumentIdentifier
		```
		
		---
		
		 Creates a `TextDocumentIdentifier` object for the current buffer.
		
		@*param* `bufnr` — : Buffer handle, defaults to current
		
		See: ~https~ ://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentIdentifier
	**/
	@:luaDotMethod
	function make_text_document_params(?bufnr:Null<Int>):nvim.type.lsp.TextDocumentIdentifier;
	/**
		```lua
		function M.make_workspace_params(added: lsp.WorkspaceFolder[], removed: lsp.WorkspaceFolder[])
		  -> lsp.WorkspaceFoldersChangeEvent
		```
		
		---
		
		 Create the workspace params
	**/
	@:luaDotMethod
	function make_workspace_params(added:Array<nvim.type.lsp.WorkspaceFolder>, removed:Array<nvim.type.lsp.WorkspaceFolder>):nvim.type.lsp.WorkspaceFoldersChangeEvent;
	/**
		```lua
		function M.open_floating_preview(contents: table, syntax: string, opts?: vim.lsp.util.open_floating_preview.Opts)
		  -> bufnr: integer
		  2. winid: integer
		```
		
		---
		
		 Shows contents in a floating window.
		
		@*param* `contents` — of lines to show in window
		
		@*param* `syntax` — of syntax to set for opened buffer
		
		@*param* `opts` — with optional fields
		
		 (additional keys are filtered with |vim.lsp.util.make_floating_popup_options()|
		 before they are passed on to |nvim_open_win()|)
		
		@*return* `bufnr` — of newly created float window
		
		@*return* `winid` — of newly created float window preview window
	**/
	@:luaDotMethod
	function open_floating_preview(contents:lua.Table.AnyTable, syntax:String, ?opts:nvim.type.vim.lsp.util.open_floating_preview.Opts):nvim.helper.Multireturn<Int, Int, Void, Void, Void, Void>;
	/**
		```lua
		function M.preview_location(location: lsp.Location|lsp.LocationLink, opts?: vim.lsp.util.open_floating_preview.Opts)
		  -> buffer: integer?
		  2. window: integer?
		```
		
		---
		
		 Previews a location in a floating window
		
		 behavior depends on type of location:
		   - for Location, range is shown (e.g., function definition)
		   - for LocationLink, targetRange is shown (e.g., body of function definition)
		
		@*return* `buffer` — id of float window
		
		@*return* `window` — id of float window
	**/
	@:luaDotMethod
	function preview_location(location:haxe.extern.EitherType<nvim.type.lsp.Location, nvim.type.lsp.LocationLink>, ?opts:nvim.type.vim.lsp.util.open_floating_preview.Opts):nvim.helper.Multireturn<Null<Int>, Null<Int>, Void, Void, Void, Void>;
	/**
		```lua
		function M.rename(old_fname: string, new_fname: string, opts?: vim.lsp.util.rename.Opts)
		```
		
		---
		
		 Rename old_fname to new_fname
		
		 Existing buffers are renamed as well, while maintaining their bufnr.
		
		 It deletes existing buffers that conflict with the renamed file name only when
		 * `opts` requests overwriting; or
		 * the conflicting buffers are not loaded, so that deleting them does not result in data loss.
		
		@*param* `opts` — Options:
	**/
	@:luaDotMethod
	function rename(old_fname:String, new_fname:String, ?opts:nvim.type.vim.lsp.util.rename.Opts):Dynamic;
	/**
		```lua
		function M.set_lines(lines: string[], A: [integer, integer], B: [integer, integer], new_lines: string[])
		  -> The: string[]
		```
		
		---
		
		 Replaces text in a range with new text.
		
		 CAUTION: Changes in-place!
		
		@*param* `lines` — Original list of strings
		
		@*param* `A` — Start position; a 2-tuple of {line,col} numbers
		
		@*param* `B` — End position; a 2-tuple {line,col} numbers
		
		@*param* `new_lines` — list of strings to replace the original
		
		@*return* `The` — modified {lines} object
	**/
	@:luaDotMethod
	@:deprecated
	function set_lines(lines:Array<String>, A:Dynamic, B:Dynamic, new_lines:Array<String>):Array<String>;
	/**
		```lua
		function M.show_document(location: lsp.Location|lsp.LocationLink, position_encoding?: 'utf-16'|'utf-32'|'utf-8', opts?: vim.lsp.util.show_document.Opts)
		  -> boolean
		```
		
		---
		
		 Shows document and optionally jumps to the location.
		
		@*return* — `true` if succeeded
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
	**/
	@:luaDotMethod
	function show_document(location:haxe.extern.EitherType<nvim.type.lsp.Location, nvim.type.lsp.LocationLink>, position_encoding:haxe.extern.EitherType<String, Null<String>>, ?opts:nvim.type.vim.lsp.util.show_document.Opts):Bool;
	/**
		```lua
		function M.stylize_markdown(bufnr: integer, contents: string[], opts?: table)
		  -> stripped: table
		```
		
		---
		
		 Converts markdown into syntax highlighted regions by stripping the code
		 blocks and converting them into highlighted code.
		 This will by default insert a blank line separator after those code block
		 regions to improve readability.
		
		 This method configures the given buffer and returns the lines to set.
		
		 If you want to open a popup with fancy markdown, use `open_floating_preview` instead
		
		@*param* `contents` — of lines to show in window
		
		@*param* `opts` — with optional fields
		
		  - height    of floating window
		  - width     of floating window
		  - wrap_at   character to wrap at for computing height
		  - max_width  maximal width of floating window
		  - max_height maximal height of floating window
		  - separator insert separator after code block
		
		@*return* `stripped` — content
	**/
	@:luaDotMethod
	function stylize_markdown(bufnr:Int, contents:Array<String>, ?opts:lua.Table.AnyTable):lua.Table.AnyTable;
	/**
		```lua
		function M.symbols_to_items(symbols: lsp.DocumentSymbol[]|lsp.SymbolInformation[], bufnr?: integer, position_encoding?: 'utf-16'|'utf-32'|'utf-8')
		  -> vim.quickfix.entry[]
		```
		
		---
		
		 Converts symbols to quickfix list items.
		
		@*param* `symbols` — list of symbols
		
		@*param* `bufnr` — buffer handle or 0 for current, defaults to current
		
		                         default to first client of buffer
		
		@*return* — See |setqflist()| for the format
		
		```lua
		position_encoding:
		    | 'utf-8'
		    | 'utf-16'
		    | 'utf-32'
		```
	**/
	@:luaDotMethod
	function symbols_to_items(symbols:haxe.extern.EitherType<Array<nvim.type.lsp.DocumentSymbol>, Array<nvim.type.lsp.SymbolInformation>>, ?bufnr:Int, ?position_encoding:String):Array<nvim.type.vim.quickfix.Entry>;
	/**
		```lua
		function M.trim_empty_lines(lines: table)
		  -> trimmed: table
		```
		
		---
		
		 Removes empty lines from the beginning and end.
		
		@*param* `lines` — list of lines to trim
		
		@*return* `trimmed` — list of lines
	**/
	@:luaDotMethod
	@:deprecated
	function trim_empty_lines(lines:lua.Table.AnyTable):lua.Table.AnyTable;
	/**
		```lua
		function M.try_trim_markdown_code_blocks(lines: string[])
		  -> filetype: string
		```
		
		---
		
		 Accepts markdown lines and tries to reduce them to a filetype if they
		 comprise just a single code block.
		
		 CAUTION: Modifies the input in-place!
		
		@*param* `lines` — list of lines
		
		@*return* `filetype` — or "markdown" if it was unchanged.
	**/
	@:luaDotMethod
	@:deprecated
	function try_trim_markdown_code_blocks(lines:Array<String>):String;
}