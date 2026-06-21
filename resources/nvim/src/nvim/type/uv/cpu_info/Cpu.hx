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
	extern var model : String;
	/**
		```lua
		(field) uv.cpu_info.cpu.speed: number
		```
	**/
	extern var speed : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times: uv.cpu_info.cpu.times
		```
	**/
	extern var times : nvim.type.uv.cpu_info.cpu.Times;
}