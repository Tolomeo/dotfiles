package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSignatureParameterInformationOptions
	```
**/
@:structInit class ClientSignatureParameterInformationOptions {
	/**
		```lua
		(field) lsp.ClientSignatureParameterInformationOptions.labelOffsetSupport: boolean?
		```
		
		---
		
		
		The client supports processing label offsets instead of a
		simple label string.
		
	**/
	@:optional
	extern public var labelOffsetSupport : Null<Bool>;
}