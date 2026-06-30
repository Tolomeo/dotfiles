package nvim.type.lsp;

/**
	```lua
	(class) lsp.SignatureInformation
	```
	
	---
	
	Represents the signature of something callable. A signature
	can have a label, like a function-name, a doc-comment, and
	a set of parameters.
**/
@:structInit class SignatureInformation {
	/**
		```lua
		(field) lsp.SignatureInformation.activeParameter: (integer|nil)?
		```
		
		---
		
		
		The index of the active parameter.
		
		If `null`, no parameter of the signature is active (for example a named
		argument that does not match any declared parameters). This is only valid
		if the client specifies the client capability
		`textDocument.signatureHelp.noActiveParameterSupport === true`
		
		If provided (or `null`), this is used in place of
		`SignatureHelp.activeParameter`.
		
	**/
	@:optional
	extern public var activeParameter : Null<haxe.extern.EitherType<nvim.type.Uinteger, nvim.type.lsp.Null>>;
	/**
		```lua
		(field) lsp.SignatureInformation.documentation: (string|lsp.MarkupContent)?
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
		
		
		The human-readable doc-comment of this signature. Will be shown
		in the UI but can be omitted.
	**/
	@:optional
	extern public var documentation : Null<haxe.extern.EitherType<String, nvim.type.lsp.MarkupContent>>;
	/**
		```lua
		(field) lsp.SignatureInformation.label: string
		```
		
		---
		
		
		The label of this signature. Will be shown in
		the UI.
	**/
	extern public var label : String;
	/**
		```lua
		(field) lsp.SignatureInformation.parameters: lsp.ParameterInformation[]?
		```
		
		---
		
		
		The parameters of this signature.
	**/
	@:optional
	extern public var parameters : Null<lua.Table<Int, nvim.type.lsp.ParameterInformation>>;
}