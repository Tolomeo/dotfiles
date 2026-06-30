package nvim.type.lsp;

/**
	```lua
	(class) lsp.MarkupContent
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
**/
@:structInit class MarkupContent {
	/**
		```lua
		(field) lsp.MarkupContent.kind: "markdown"|"plaintext"
		```
		
		---
		
		Describes the content type that a client supports in various
		result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
		
		Please note that `MarkupKinds` must not start with a `$`. This kinds
		are reserved for internal usage.
		
		---
		
		
		The type of the Markup
		
		---
		
		```lua
		-- Describes the content type that a client supports in various
		-- result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
		-- 
		-- Please note that `MarkupKinds` must not start with a `$`. This kinds
		-- are reserved for internal usage.
		lsp.MarkupKind:
		    | "plaintext" -- PlainText
		    | "markdown" -- Markdown
		```
	**/
	extern public var kind : nvim.type.lsp.MarkupKind;
	/**
		```lua
		(field) lsp.MarkupContent.value: string
		```
		
		---
		
		
		The content itself
	**/
	extern public var value : String;
}