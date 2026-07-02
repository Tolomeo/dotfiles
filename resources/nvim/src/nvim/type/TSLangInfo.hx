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
	extern public var _wasm : Bool;
	/**
		```lua
		(field) TSLangInfo.abi_version: integer
		```
	**/
	extern public var abi_version : Float;
	/**
		```lua
		(field) TSLangInfo.fields: string[]
		```
	**/
	extern public var fields : lua.Table<Int, String>;
	/**
		```lua
		(field) TSLangInfo.metadata: TSLangMetadata?
		```
		
		---
		
		
		
		---
		
		ABI 15 only
	**/
	@:optional
	extern public var metadata : Null<nvim.type.TSLangMetadata>;
	/**
		```lua
		(field) TSLangInfo.state_count: integer
		```
	**/
	extern public var state_count : Float;
	/**
		```lua
		(field) TSLangInfo.supertypes: table<string, string[]>
		```
	**/
	extern public var supertypes : Supertypes;
	/**
		```lua
		(field) TSLangInfo.symbols: table<string, boolean>
		```
	**/
	extern public var symbols : Symbols;
}