package nvim.type.lsp;

/**
	```lua
	(class) lsp.CompletionItem
	```
	
	---
	
	A completion item represents a text snippet that is
	proposed to complete text that is being typed.
**/
@:structInit class CompletionItem {
	/**
		```lua
		(field) lsp.CompletionItem.additionalTextEdits: lsp.TextEdit[]?
		```
		
		---
		
		
		An optional array of additional {@link TextEdit text edits} that are applied when
		selecting this completion. Edits must not overlap (including the same insert position)
		with the main {@link CompletionItem.textEdit edit} nor with themselves.
		
		Additional text edits should be used to change text unrelated to the current cursor position
		(for example adding an import statement at the top of the file if the completion item will
		insert an unqualified type).
	**/
	@:optional
	extern var additionalTextEdits : Null<Array<nvim.type.lsp.TextEdit>>;
	/**
		```lua
		(field) lsp.CompletionItem.command: (lsp.Command)?
		```
		
		---
		
		Represents a reference to a command. Provides a title which
		will be used to represent a command in the UI and, optionally,
		an array of arguments which will be passed to the command handler
		function when invoked.
		
		---
		
		
		An optional {@link Command command} that is executed *after* inserting this completion. *Note* that
		additional modifications to the current document should be described with the
		{@link CompletionItem.additionalTextEdits additionalTextEdits}-property.
	**/
	@:optional
	extern var command : Null<nvim.type.lsp.Command>;
	/**
		```lua
		(field) lsp.CompletionItem.commitCharacters: string[]?
		```
		
		---
		
		
		An optional set of characters that when pressed while this completion is active will accept it first and
		then type that character. *Note* that all commit characters should have `length=1` and that superfluous
		characters will be ignored.
	**/
	@:optional
	extern var commitCharacters : Null<Array<String>>;
	/**
		```lua
		(field) lsp.CompletionItem.data: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		A data entry field that is preserved on a completion item between a
		{@link CompletionRequest} and a {@link CompletionResolveRequest}.
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	@:optional
	extern var data : Null<nvim.type.lsp.LSPAny>;
	/**
		```lua
		(field) lsp.CompletionItem.deprecated: boolean?
		```
		
		---
		
		
		Indicates if this item is deprecated.
	**/
	@:optional
	extern var deprecated : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionItem.detail: string?
		```
		
		---
		
		
		A human-readable string with additional information
		about this item, like type or symbol information.
	**/
	@:optional
	extern var detail : Null<String>;
	/**
		```lua
		(field) lsp.CompletionItem.documentation: (string|lsp.MarkupContent)?
		```
		
		---
		
		A `MarkupContent` literal represents a string value which content is interpreted base on its
		kind flag. Currently the protocol supports `plaintext` and `markdown` as markup kinds.
		
		If the kind is `markdown` then the value can contain fenced code blocks like in GitHub issues.
		See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
		
		Here is an example how such a string can be constructed using JavaScript / TypeScript:
		```ts
		let markdown: MarkdownContent = {
		 kind: MarkupKind.Markdown,
		 value: [
		   '# Header',
		   'Some text',
		   '```typescript',
		   'someCode();',
		   '```'
		 ].join('\n')
		};
		```
		
		*Please Note* that clients might sanitize the return markdown. A client could decide to
		remove HTML from the markdown to avoid script execution.
		
		---
		
		
		A human-readable string that represents a doc-comment.
	**/
	@:optional
	extern var documentation : Null<haxe.extern.EitherType<String, nvim.type.lsp.MarkupContent>>;
	/**
		```lua
		(field) lsp.CompletionItem.filterText: string?
		```
		
		---
		
		
		A string that should be used when filtering a set of
		completion items. When `falsy` the {@link CompletionItem.label label}
		is used.
	**/
	@:optional
	extern var filterText : Null<String>;
	/**
		```lua
		(field) lsp.CompletionItem.insertText: string?
		```
		
		---
		
		
		A string that should be inserted into a document when selecting
		this completion. When `falsy` the {@link CompletionItem.label label}
		is used.
		
		The `insertText` is subject to interpretation by the client side.
		Some tools might not take the string literally. For example
		VS Code when code complete is requested in this example
		`con<cursor position>` and a completion item with an `insertText` of
		`console` is provided it will only insert `sole`. Therefore it is
		recommended to use `textEdit` instead since it avoids additional client
		side interpretation.
	**/
	@:optional
	extern var insertText : Null<String>;
	/**
		```lua
		(field) lsp.CompletionItem.insertTextFormat: (1|2)?
		```
		
		---
		
		Defines whether the insert text in a completion item should be interpreted as
		plain text or a snippet.
		
		---
		
		
		The format of the insert text. The format applies to both the
		`insertText` property and the `newText` property of a provided
		`textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
		
		Please note that the insertTextFormat doesn't apply to
		`additionalTextEdits`.
		
		---
		
		```lua
		-- Defines whether the insert text in a completion item should be interpreted as
		-- plain text or a snippet.
		lsp.InsertTextFormat:
		    | 1 -- PlainText
		    | 2 -- Snippet
		```
	**/
	@:optional
	extern var insertTextFormat : Null<nvim.type.lsp.InsertTextFormat>;
	/**
		```lua
		(field) lsp.CompletionItem.insertTextMode: (1|2)?
		```
		
		---
		
		How whitespace and indentation is handled during completion
		item insertion.
		
		
		---
		
		
		How whitespace and indentation is handled during completion
		item insertion. If not provided the clients default value depends on
		the `textDocument.completion.insertTextMode` client capability.
		
		
		---
		
		```lua
		-- How whitespace and indentation is handled during completion
		-- item insertion.
		-- 
		lsp.InsertTextMode:
		    | 1 -- asIs
		    | 2 -- adjustIndentation
		```
	**/
	@:optional
	extern var insertTextMode : Null<nvim.type.lsp.InsertTextMode>;
	/**
		```lua
		(field) lsp.CompletionItem.kind: (1|10|11|12|13|14|15|16|17|18|19|2|20|21|22|23|24|25|3|4|5|6|7|8|9)?
		```
		
		---
		
		The kind of a completion entry.
		
		---
		
		
		The kind of this completion item. Based of the kind
		an icon is chosen by the editor.
		
		---
		
		```lua
		-- The kind of a completion entry.
		lsp.CompletionItemKind:
		    | 1 -- Text
		    | 2 -- Method
		    | 3 -- Function
		    | 4 -- Constructor
		    | 5 -- Field
		    | 6 -- Variable
		    | 7 -- Class
		    | 8 -- Interface
		    | 9 -- Module
		    | 10 -- Property
		    | 11 -- Unit
		    | 12 -- Value
		    | 13 -- Enum
		    | 14 -- Keyword
		    | 15 -- Snippet
		    | 16 -- Color
		    | 17 -- File
		    | 18 -- Reference
		    | 19 -- Folder
		    | 20 -- EnumMember
		    | 21 -- Constant
		    | 22 -- Struct
		    | 23 -- Event
		    | 24 -- Operator
		    | 25 -- TypeParameter
		```
	**/
	@:optional
	extern var kind : Null<nvim.type.lsp.CompletionItemKind>;
	/**
		```lua
		(field) lsp.CompletionItem.label: string
		```
		
		---
		
		
		The label of this completion item.
		
		The label property is also by default the text that
		is inserted when selecting this completion.
		
		If label details are provided the label itself should
		be an unqualified name of the completion item.
	**/
	extern var label : String;
	/**
		```lua
		(field) lsp.CompletionItem.labelDetails: (lsp.CompletionItemLabelDetails)?
		```
		
		---
		
		Additional details for a completion item label.
		
		
		---
		
		
		Additional details for the label
		
	**/
	@:optional
	extern var labelDetails : Null<nvim.type.lsp.CompletionItemLabelDetails>;
	/**
		```lua
		(field) lsp.CompletionItem.preselect: boolean?
		```
		
		---
		
		
		Select this item when showing.
		
		*Note* that only one completion item can be selected and that the
		tool / client decides which item that is. The rule is that the *first*
		item of those that match best is selected.
	**/
	@:optional
	extern var preselect : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionItem.sortText: string?
		```
		
		---
		
		
		A string that should be used when comparing this item
		with other items. When `falsy` the {@link CompletionItem.label label}
		is used.
	**/
	@:optional
	extern var sortText : Null<String>;
	/**
		```lua
		(field) lsp.CompletionItem.tags: 1[]?
		```
		
		---
		
		
		Tags for this completion item.
		
	**/
	@:optional
	extern var tags : Null<Array<nvim.type.lsp.CompletionItemTag>>;
	/**
		```lua
		(field) lsp.CompletionItem.textEdit: (lsp.InsertReplaceEdit|lsp.TextEdit)?
		```
		
		---
		
		A text edit applicable to a text document.
		
		---
		
		
		An {@link TextEdit edit} which is applied to a document when selecting
		this completion. When an edit is provided the value of
		{@link CompletionItem.insertText insertText} is ignored.
		
		Most editors support two different operations when accepting a completion
		item. One is to insert a completion text and the other is to replace an
		existing text with a completion text. Since this can usually not be
		predetermined by a server it can report both ranges. Clients need to
		signal support for `InsertReplaceEdits` via the
		`textDocument.completion.insertReplaceSupport` client capability
		property.
		
		*Note 1:* The text edit's range as well as both ranges from an insert
		replace edit must be a [single line] and they must contain the position
		at which completion has been requested.
		*Note 2:* If an `InsertReplaceEdit` is returned the edit's insert range
		must be a prefix of the edit's replace range, that means it must be
		contained and starting at the same position.
		
		
		---
		
		A special text edit to provide an insert and a replace operation.
		
	**/
	@:optional
	extern var textEdit : Null<haxe.extern.EitherType<nvim.type.lsp.TextEdit, nvim.type.lsp.InsertReplaceEdit>>;
	/**
		```lua
		(field) lsp.CompletionItem.textEditText: string?
		```
		
		---
		
		
		The edit text used if the completion item is part of a CompletionList and
		CompletionList defines an item default for the text edit range.
		
		Clients will only honor this property if they opt into completion list
		item defaults using the capability `completionList.itemDefaults`.
		
		If not provided and a list's default range is provided the label
		property is used as a text.
		
	**/
	@:optional
	extern var textEditText : Null<String>;
}