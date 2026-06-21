package nvim.type.lsp;

/**
	```lua
	(class) lsp.ParameterInformation
	```
	
	---
	
	Represents a parameter of a callable-signature. A parameter can
	have a label and a doc-comment.
**/
@:structInit class ParameterInformation {
	/**
		```lua
		(field) lsp.ParameterInformation.documentation: (string|lsp.MarkupContent)?
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
		
		
		The human-readable doc-comment of this parameter. Will be shown
		in the UI but can be omitted.
	**/
	@:optional
	extern var documentation : Null<haxe.extern.EitherType<String, nvim.type.lsp.MarkupContent>>;
	/**
		```lua
		(field) lsp.ParameterInformation.label: string|[integer, integer]
		```
		
		---
		
		
		The label of this parameter information.
		
		Either a string or an inclusive start and exclusive end offsets within its containing
		signature label. (see SignatureInformation.label). The offsets are based on a UTF-16
		string representation as `Position` and `Range` does.
		
		To avoid ambiguities a server should use the [start, end] offset value instead of using
		a substring. Whether a client support this is controlled via `labelOffsetSupport` client
		capability.
		
		*Note*: a label of type string should be a substring of its containing signature label.
		Its intended use case is to highlight the parameter label part in the `SignatureInformation.label`.
	**/
	extern var label : Dynamic;
}