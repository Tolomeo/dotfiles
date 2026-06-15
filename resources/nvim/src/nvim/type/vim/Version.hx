package nvim.type.vim;

/**
	```lua
	(class) vim.Version
	```
**/
@:structInit extern class Version {
	/**
		```lua
		(field) vim.Version.build: string?
		```
	**/
	var build : Null<String>;
	/**
		```lua
		(field) vim.Version.major: number
		```
	**/
	var major : Float;
	/**
		```lua
		(field) vim.Version.minor: number
		```
	**/
	var minor : Float;
	/**
		```lua
		(field) vim.Version.patch: number
		```
	**/
	var patch : Float;
	/**
		```lua
		(field) vim.Version.prerelease: string?
		```
	**/
	var prerelease : Null<String>;
	/**
		```lua
		(method) vim.Version:__tostring()
		  -> string
		```
	**/
	function __tostring():Dynamic;
}