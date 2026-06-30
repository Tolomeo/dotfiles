package nvim.type.lsp;

/**
	```lua
	(class) lsp.CompletionListCapabilities
	```
	
	---
	
	The client supports the following `CompletionList` specific
	capabilities.
	
**/
@:structInit class CompletionListCapabilities {
	/**
		```lua
		(field) lsp.CompletionListCapabilities.applyKindSupport: boolean?
		```
		
		---
		
		
		Specifies whether the client supports `CompletionList.applyKind` to
		indicate how supported values from `completionList.itemDefaults`
		and `completion` will be combined.
		
		If a client supports `applyKind` it must support it for all fields
		that it supports that are listed in `CompletionList.applyKind`. This
		means when clients add support for new/future fields in completion
		items the MUST also support merge for them if those fields are
		defined in `CompletionList.applyKind`.
		
	**/
	@:optional
	extern public var applyKindSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionListCapabilities.itemDefaults: string[]?
		```
		
		---
		
		
		The client supports the following itemDefaults on
		a completion list.
		
		The value lists the supported property names of the
		`CompletionList.itemDefaults` object. If omitted
		no properties are supported.
		
	**/
	@:optional
	extern public var itemDefaults : Null<lua.Table<Int, String>>;
}