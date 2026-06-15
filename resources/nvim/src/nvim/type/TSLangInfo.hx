package nvim.type;

/**
	```lua
	(field) TSLangInfo.supertypes: table<string, string[]>
	```
**/
@:structInit extern class Supertypes {

}

/**
	```lua
	(field) TSLangInfo.symbols: table<string, boolean>
	```
**/
@:structInit extern class Symbols {

}

/**
	```lua
	(class) TSLangInfo
	```
**/
@:structInit extern class TSLangInfo {
	/**
		```lua
		(field) TSLangInfo._wasm: boolean
		```
	**/
	var _wasm : Bool;
	/**
		```lua
		(field) TSLangInfo.abi_version: integer
		```
	**/
	var abi_version : Int;
	/**
		```lua
		(field) TSLangInfo.fields: string[]
		```
	**/
	var fields : Array<String>;
	/**
		```lua
		(field) TSLangInfo.metadata: TSLangMetadata?
		```
		
		---
		
		
		
		---
		
		ABI 15 only
	**/
	var metadata : Null<nvim.type.TSLangMetadata>;
	/**
		```lua
		(field) TSLangInfo.state_count: integer
		```
	**/
	var state_count : Int;
}