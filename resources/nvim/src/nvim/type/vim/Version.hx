package nvim.type.vim;

/**
	```lua
	(class) vim.Version
	```
**/
@:structInit class Version {
	/**
		```lua
		(field) vim.Version.build: string?
		```
	**/
	@:optional
	extern public var build : Null<String>;
	/**
		```lua
		(field) vim.Version.major: number
		```
	**/
	extern public var major : Float;
	/**
		```lua
		(field) vim.Version.minor: number
		```
	**/
	extern public var minor : Float;
	/**
		```lua
		(field) vim.Version.patch: number
		```
	**/
	extern public var patch : Float;
	/**
		```lua
		(field) vim.Version.prerelease: string?
		```
	**/
	@:optional
	extern public var prerelease : Null<String>;
	/**
		```lua
		(method) vim.Version:__tostring()
		  -> string
		```
	**/
	extern public function __tostring():Dynamic;
}