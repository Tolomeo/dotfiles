package nvim.type.uv.getrusage;

/**
	```lua
	(class) uv.getrusage.result
	```
**/
@:structInit extern class Result {
	/**
		```lua
		(field) uv.getrusage.result.idrss: integer
		```
		
		---
		
		integral unshared data size
	**/
	var idrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.inblock: integer
		```
		
		---
		
		block input operations
	**/
	var inblock : Int;
	/**
		```lua
		(field) uv.getrusage.result.isrss: integer
		```
		
		---
		
		integral unshared stack size
	**/
	var isrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.ixrss: integer
		```
		
		---
		
		integral shared memory size
	**/
	var ixrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.majflt: integer
		```
		
		---
		
		page faults (hard page faults)
	**/
	var majflt : Int;
	/**
		```lua
		(field) uv.getrusage.result.maxrss: integer
		```
		
		---
		
		maximum resident set size
	**/
	var maxrss : Int;
	/**
		```lua
		(field) uv.getrusage.result.minflt: integer
		```
		
		---
		
		page reclaims (soft page faults)
	**/
	var minflt : Int;
	/**
		```lua
		(field) uv.getrusage.result.msgrcv: integer
		```
		
		---
		
		IPC messages received
	**/
	var msgrcv : Int;
	/**
		```lua
		(field) uv.getrusage.result.msgsnd: integer
		```
		
		---
		
		IPC messages sent
	**/
	var msgsnd : Int;
	/**
		```lua
		(field) uv.getrusage.result.nivcsw: integer
		```
		
		---
		
		involuntary context switches
	**/
	var nivcsw : Int;
	/**
		```lua
		(field) uv.getrusage.result.nsignals: integer
		```
		
		---
		
		signals received
	**/
	var nsignals : Int;
	/**
		```lua
		(field) uv.getrusage.result.nswap: integer
		```
		
		---
		
		swaps
	**/
	var nswap : Int;
	/**
		```lua
		(field) uv.getrusage.result.nvcsw: integer
		```
		
		---
		
		voluntary context switches
	**/
	var nvcsw : Int;
	/**
		```lua
		(field) uv.getrusage.result.oublock: integer
		```
		
		---
		
		block output operations
	**/
	var oublock : Int;
	/**
		```lua
		(field) uv.getrusage.result.stime: uv.getrusage.result.time_t
		```
		
		---
		
		system CPU time used
	**/
	var stime : nvim.type.uv.getrusage.result.TimeT;
	/**
		```lua
		(field) uv.getrusage.result.utime: uv.getrusage.result.time_t
		```
		
		---
		
		user CPU time used
	**/
	var utime : nvim.type.uv.getrusage.result.TimeT;
}