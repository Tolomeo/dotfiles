package nvim.type.uv.cpu_info;

/**
	```lua
	(class) uv.cpu_info.cpu
	```
**/
@:structInit extern class Cpu {
	/**
		```lua
		(field) uv.cpu_info.cpu.model: string
		```
	**/
	var model : String;
	/**
		```lua
		(field) uv.cpu_info.cpu.speed: number
		```
	**/
	var speed : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times: uv.cpu_info.cpu.times
		```
	**/
	var times : nvim.type.uv.cpu_info.cpu.Times;
}