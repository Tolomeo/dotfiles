package nvim.type.uv.cpu_info;

/**
	```lua
	(class) uv.cpu_info.cpu
	```
**/
@:structInit class Cpu {
	/**
		```lua
		(field) uv.cpu_info.cpu.model: string
		```
	**/
	extern public var model : String;
	/**
		```lua
		(field) uv.cpu_info.cpu.speed: number
		```
	**/
	extern public var speed : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times: uv.cpu_info.cpu.times
		```
	**/
	extern public var times : nvim.type.uv.cpu_info.cpu.Times;
}