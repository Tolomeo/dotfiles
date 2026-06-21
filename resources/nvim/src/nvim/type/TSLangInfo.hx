package nvim.type;

/**
	```lua
	(field) TSLangInfo.supertypes: table<string, string[]>
	```
**/
@:structInit class Supertypes {

}

/**
	```lua
	(field) TSLangInfo.symbols: table<string, boolean>
	```
**/
@:structInit class Symbols {

}

/**
	```lua
	(class) TSLangInfo
	```
**/
@:structInit class TSLangInfo {
	/**
		```lua
		(field) TSLangInfo._wasm: boolean
		```
	**/
	extern var _wasm : Bool;
	/**
		```lua
		(field) TSLangInfo.abi_version: integer
		```
	**/
	extern var abi_version : Int;
	/**
		```lua
		(field) TSLangInfo.fields: string[]
		```
	**/
	extern var fields : Array<String>;
	/**
		```lua
		(field) TSLangInfo.metadata: TSLangMetadata?
		```
		
		---
		
		
		
		---
		
		ABI 15 only
	**/
	@:optional
	extern var metadata : Null<nvim.type.TSLangMetadata>;
	/**
		```lua
		(field) TSLangInfo.state_count: integer
		```
	**/
	extern var state_count : Int;
}