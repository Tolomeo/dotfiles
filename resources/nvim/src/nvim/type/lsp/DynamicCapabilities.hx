package nvim.type.lsp;

/**
	```lua
	(field) lsp.DynamicCapabilities.capabilities: table<string, lsp.Registration[]>
	```
**/
@:structInit class Capabilities {

}

/**
	```lua
	(class) lsp.DynamicCapabilities
	```
**/
@:structInit class DynamicCapabilities {
	/**
		```lua
		(field) lsp.DynamicCapabilities.capabilities: table<string, lsp.Registration[]>
		```
	**/
	extern public var capabilities : Capabilities;
	/**
		```lua
		(field) lsp.DynamicCapabilities.client_id: integer
		```
	**/
	extern public var client_id : Float;
	/**
		```lua
		function get(_: any, method: any, opts: any)
		  -> lsp.Registration
		```
	**/
	@:luaDotMethod
	extern public function get(_:Dynamic, method:Dynamic, opts:Dynamic):Dynamic;
	/**
		```lua
		function register(_: any, registrations: any)
		```
	**/
	@:luaDotMethod
	extern public function register(_:Dynamic, registrations:Dynamic):Dynamic;
	/**
		```lua
		function supports(_: any, method: any, opts: any)
		  -> boolean
		```
	**/
	@:luaDotMethod
	extern public function supports(_:Dynamic, method:Dynamic, opts:Dynamic):Dynamic;
	/**
		```lua
		function supports_registration(_: any, method: any)
		  -> false
		```
	**/
	@:luaDotMethod
	extern public function supports_registration(_:Dynamic, method:Dynamic):Dynamic;
	/**
		```lua
		function unregister(_: any, unregistrations: any)
		```
	**/
	@:luaDotMethod
	extern public function unregister(_:Dynamic, unregistrations:Dynamic):Dynamic;
}