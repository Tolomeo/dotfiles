package nvim.type;

/**
	```lua
	(class) uv
	```
	
	---
	
	 The luv project provides access to the multi-platform support library
	 libuv in Lua code. It was primarily developed for the luvit project as
	 the built-in `uv` module, but can be used in other Lua environments.
	
	 More information about the core libuv library can be found at the original
	 libuv documentation page.
	
	
	 Here is a small example showing a TCP echo server:
	
	 ```lua
	 local uv = require("luv") -- "luv" when stand-alone, "uv" in luvi apps
	
	 local server = uv.new_tcp()
	 server:bind("127.0.0.1", 1337)
	 server:listen(128, function (err)
	   assert(not err, err)
	   local client = uv.new_tcp()
	   server:accept(client)
	   client:read_start(function (err, chunk)
	     assert(not err, err)
	     if chunk then
	       client:write(chunk)
	     else
	       client:shutdown()
	       client:close()
	     end
	   end)
	 end)
	 print("TCP server listening at 127.0.0.1 port 1337")
	 uv.run() -- an explicit run call is necessary outside of luvit
	 ```
	
	
	 The luv library contains a single Lua module referred to hereafter as `uv` for
	 simplicity. This module consists mostly of functions with names corresponding to
	 their original libuv versions. For example, the libuv function `uv_tcp_bind` has
	 a luv version at `uv.tcp_bind`. Currently, only one non-function field exists:
	 `uv.constants`, which is a table.
	
	
	 In addition to having simple functions, luv provides an optional method-style
	 API. For example, `uv.tcp_bind(server, host, port)` can alternatively be called
	 as `server:bind(host, port)`. Note that the first argument `server` becomes the
	 object and `tcp_` is removed from the function name. Method forms are
	 documented below where they exist.
	
	
	 Functions that accept a callback are asynchronous. These functions may
	 immediately return results to the caller to indicate their initial status, but
	 their final execution is deferred until at least the next libuv loop iteration.
	 After completion, their callbacks are executed with any results passed to it.
	
	 Functions that do not accept a callback are synchronous. These functions
	 immediately return their results to the caller.
	
	 Some (generally FS and DNS) functions can behave either synchronously or
	 asynchronously. If a callback is provided to these functions, they behave
	 asynchronously; if no callback is provided, they behave synchronously.
	
	
	 Some unique types are defined. These are not actual types in Lua, but they are
	 used here to facilitate documenting consistent behavior:
	 - `fail`: an assertable `nil, string, string` tuple (see Error handling)
	 - `callable`: a `function`; or a `table` or `userdata` with a `__call`
	   metamethod
	 - `buffer`: a `string` or a sequential `table` of `string`s
	 - `threadargs`: variable arguments (`...`) of type `nil`, `boolean`, `number`,
	   `string`, or `userdata`
	
	
	 This documentation is mostly a retelling of the libuv API documentation
	 within the context of luv's Lua API. Low-level implementation details and
	 unexposed C functions and types are not documented here except for when they
	 are relevant to behavior seen in the Lua module.
	
	 [Error handling]: #error-handling
	
	 In libuv, errors are negative numbered constants; however, these errors and the
	 functions used to handle them are not exposed to luv users. Instead, if an
	 internal error is encountered, the luv function will return to the caller an
	 assertable `nil, err, name` tuple.
	
	 - `nil` idiomatically indicates failure
	 - `err` is a string with the format `{name}: {message}`
	   - `{name}` is the error name provided internally by `uv_err_name`
	   - `{message}` is a human-readable message provided internally by `uv_strerror`
	 - `name` is the same string used to construct `err`
	
	 This tuple is referred to below as the `fail` pseudo-type.
	
	 When a function is called successfully, it will return either a value that is
	 relevant to the operation of the function, or the integer `0` to indicate
	 success, or sometimes nothing at all. These cases are documented below.
	
	
	 [reference counting]: #reference-counting
	
	 The libuv event loop (if run in the default mode) will run until there are no
	 active and referenced handles left. The user can force the loop to exit early by
	 unreferencing handles which are active, for example by calling `uv.unref()`
	 after calling `uv.timer_start()`.
	
	 A handle can be referenced or unreferenced, the refcounting scheme doesn't use a
	 counter, so both operations are idempotent.
	
	 All handles are referenced when active by default, see `uv.is_active()` for a
	 more detailed explanation on what being active involves.
	
	
	 [File system operations]: #file-system-operations
	
	 Most file system functions can operate synchronously or asynchronously. When a synchronous version is called (by omitting a callback), the function will
	 immediately return the results of the FS call. When an asynchronous version is
	 called (by providing a callback), the function will immediately return a
	 `uv_fs_t userdata` and asynchronously execute its callback; if an error is encountered, the first and only argument passed to the callback will be the `err` error string; if the operation completes successfully, the first argument will be `nil` and the remaining arguments will be the results of the FS call.
	
	 Synchronous and asynchronous versions of `readFile` (with naive error handling)
	 are implemented below as an example:
	
	 ```lua
	 local function readFileSync(path)
	   local fd = assert(uv.fs_open(path, "r", 438))
	   local stat = assert(uv.fs_fstat(fd))
	   local data = assert(uv.fs_read(fd, stat.size, 0))
	   assert(uv.fs_close(fd))
	   return data
	 end
	
	 local data = readFileSync("main.lua")
	 print("synchronous read", data)
	 ```
	
	 ```lua
	 local function readFile(path, callback)
	   uv.fs_open(path, "r", 438, function(err, fd)
	     assert(not err, err)
	     uv.fs_fstat(fd, function(err, stat)
	       assert(not err, err)
	       uv.fs_read(fd, stat.size, 0, function(err, data)
	         assert(not err, err)
	         uv.fs_close(fd, function(err)
	           assert(not err, err)
	           return callback(data)
	         end)
	       end)
	     end)
	   end)
	 end
	
	 readFile("main.lua", function(data)
	   print("asynchronous read", data)
	 end)
	 ```
	
	
	 [Thread pool work scheduling]: #thread-pool-work-scheduling
	
	 Libuv provides a threadpool which can be used to run user code and get notified
	 in the loop thread. This threadpool is internally used to run all file system
	 operations, as well as `getaddrinfo` and `getnameinfo` requests.
	
	 ```lua
	 local function work_callback(a, b)
	   return a + b
	 end
	
	 local function after_work_callback(c)
	   print("The result is: " .. c)
	 end
	
	 local work = uv.new_work(work_callback, after_work_callback)
	
	 work:queue(1, 2)
	
	 -- output: "The result is: 3"
	 ```
	
	
	 [DNS utility functions]: #dns-utility-functions
	
	
	 [Threading and synchronization utilities]: #threading-and-synchronization-utilities
	
	 Libuv provides cross-platform implementations for multiple threading an
	  synchronization primitives. The API largely follows the pthreads API.
	
	
	 [Miscellaneous utilities]: #miscellaneous-utilities
	
	
	 [Metrics operations]: #metrics-operations
	
**/
@:structInit extern class Uv {
	/**
		```lua
		function uv.accept(stream: uv.uv_stream_t, client_stream: uv.uv_stream_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 This call is used in conjunction with `uv.listen()` to accept incoming
		 connections. Call this function after receiving a callback to accept the
		 connection.
		
		 When the connection callback is called it is guaranteed that this function
		 will complete successfully the first time. If you attempt to use it more than
		 once, it may fail. It is suggested to only call this function once per
		 connection call.
		
		 ```lua
		 server:listen(128, function (err)
		   local client = uv.new_tcp()
		   server:accept(client)
		 end)
		 ```
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function accept(stream:nvim.type.uv.UvStreamT, client_stream:nvim.type.uv.UvStreamT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.async_send(async: uv.uv_async_t, ...any)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Wakeup the event loop and call the async handle's callback.
		
		 **Note**: It's safe to call this function from any thread. The callback will be
		 called on the loop thread.
		
		 **Warning**: libuv will coalesce calls to `uv.async_send(async)`, that is, not
		 every call to it will yield an execution of the callback. For example: if
		 `uv.async_send()` is called 5 times in a row before the callback is called, the
		 callback will only be called once. If `uv.async_send()` is called again after
		 the callback was called, it will be called again.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function async_send(async:nvim.type.uv.UvAsyncT, ___:haxe.Rest<nvim.type.uv.Threadargs>):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.available_parallelism()
		  -> integer
		```
		
		---
		
		 Returns an estimate of the default amount of parallelism a program should use. Always returns a non-zero value.
		
		 On Linux, inspects the calling thread’s CPU affinity mask to determine if it has been pinned to specific CPUs.
		
		 On Windows, the available parallelism may be underreported on systems with more than 64 logical CPUs.
		
		 On other platforms, reports the number of CPUs that the operating system considers to be online.
	**/
	@:luaDotMethod
	function available_parallelism():Int;
	/**
		```lua
		function uv.backend_fd()
		  -> fd: integer|nil
		```
		
		---
		
		 Get backend file descriptor. Only kqueue, epoll, and event ports are supported.
		
		 This can be used in conjunction with `uv.run("nowait")` to poll in one thread
		 and run the event loop's callbacks in another
		
		 **Note**: Embedding a kqueue fd in another kqueue pollset doesn't work on all
		 platforms. It's not an error to add the fd but it never generates events.
	**/
	@:luaDotMethod
	function backend_fd():Null<Int>;
	/**
		```lua
		function uv.backend_timeout()
		  -> integer
		```
		
		---
		
		 Get the poll timeout. The return value is in milliseconds, or -1 for no timeout.
	**/
	@:luaDotMethod
	function backend_timeout():Int;
	/**
		```lua
		function uv.cancel(req: uv.uv_req_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Cancel a pending request. Fails if the request is executing or has finished
		 executing. Only cancellation of `uv_fs_t`, `uv_getaddrinfo_t`,
		 `uv_getnameinfo_t` and `uv_work_t` requests is currently supported.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function cancel(req:nvim.type.uv.UvReqT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.chdir(cwd: string)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Sets the current working directory with the string `cwd`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function chdir(cwd:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.check_start(check: uv.uv_check_t, callback: function)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start the handle with the given callback.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function check_start(check:nvim.type.uv.UvCheckT, callback:haxe.Constraints.Function):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.check_stop(check: uv.uv_check_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the handle, the callback will no longer be called.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function check_stop(check:nvim.type.uv.UvCheckT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.close(handle: uv.uv_handle_t, callback?: function)
		```
		
		---
		
		 Request handle to be closed. `callback` will be called asynchronously after this
		 call. This MUST be called on each handle before memory is released.
		
		 Handles that wrap file descriptors are closed immediately but `callback` will
		 still be deferred to the next iteration of the event loop. It gives you a chance
		 to free up any resources associated with the handle.
		
		 In-progress requests, like `uv_connect_t` or `uv_write_t`, are cancelled and
		 have their callbacks called asynchronously with `ECANCELED`.
	**/
	@:luaDotMethod
	function close(handle:nvim.type.uv.UvHandleT, ?callback:haxe.Constraints.Function):Dynamic;
	/**
		```lua
		function uv.cpu_info()
		  -> info: uv.cpu_info.cpu[]|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns information about the CPU(s) on the system as a table of tables for each
		 CPU found.
		
		 **Returns:** `table` or `fail`
		 - `[1, 2, 3, ..., n]` : `table`
		   - `model` : `string`
		   - `speed` : `number`
		   - `times` : `table`
		     - `user` : `number`
		     - `nice` : `number`
		     - `sys` : `number`
		     - `idle` : `number`
		     - `irq` : `number`
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function cpu_info():nvim.helper.Multireturn<Null<Array<nvim.type.uv.cpu_info.Cpu>>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.cwd()
		  -> cwd: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the current working directory.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function cwd():nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.disable_stdio_inheritance()
		```
		
		---
		
		 Disables inheritance for file descriptors / handles that this process inherited
		 from its parent. The effect is that child processes spawned by this process
		 don't accidentally inherit these handles.
		
		 It is recommended to call this function as early in your program as possible,
		 before the inherited file descriptors can be closed or duplicated.
		
		 **Note:** This function works on a best-effort basis: there is no guarantee that
		 libuv can discover all file descriptors that were inherited. In general it does
		 a better job on Windows than it does on Unix.
	**/
	@:luaDotMethod
	function disable_stdio_inheritance():Dynamic;
	/**
		```lua
		(field) uv.errno: uv.errno
		```
		
		---
		
		 A table value which exposes error constants as a map, where the key is the error name (without the UV_ prefix) and its value is a negative number.
		
	**/
	var errno : nvim.type.uv.Errno;
	/**
		```lua
		function uv.exepath()
		  -> exepath: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the executable path.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function exepath():nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fileno(handle: uv.uv_handle_t)
		  -> fileno: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Gets the platform dependent file descriptor equivalent.
		
		 The following handles are supported: TCP, pipes, TTY, UDP and poll. Passing any
		 other handle type will fail with `EINVAL`.
		
		 If a handle doesn't have an attached file descriptor yet or the handle itself
		 has been closed, this function will return `EBADF`.
		
		 **Warning**: Be very careful when using this function. libuv assumes it's in
		 control of the file descriptor so any change to it may lead to malfunction.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fileno(handle:nvim.type.uv.UvHandleT):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_access(path: string, mode: string|integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `access(2)` on Unix. Windows uses `GetFileAttributesW()`. Access
		 `mode` can be an integer or a string containing `"R"` or `"W"` or `"X"`.
		 Returns `true` or `false` indicating access permission.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_access(path: string, mode: string|integer, callback: fun(err: string|nil, permission?: boolean))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, mode:haxe.extern.EitherType<Int, String>, callback:nvim.type.uv.fs_access.Callback) : nvim.type.uv.UvFsT {})
	function fs_access(path:String, mode:haxe.extern.EitherType<Int, String>):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_chmod(path: string, mode: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `chmod(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_chmod(path: string, mode: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, mode:Int, callback:nvim.type.uv.fs_chmod.Callback) : nvim.type.uv.UvFsT {})
	function fs_chmod(path:String, mode:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_chown(path: string, uid: integer, gid: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `chown(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_chown(path: string, uid: integer, gid: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, uid:Int, gid:Int, callback:nvim.type.uv.fs_chown.Callback) : nvim.type.uv.UvFsT {})
	function fs_chown(path:String, uid:Int, gid:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_close(fd: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `close(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_close(fd: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, callback:nvim.type.uv.fs_close.Callback) : nvim.type.uv.UvFsT {})
	function fs_close(fd:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_closedir(dir: uv.luv_dir_t)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Closes a directory stream returned by a successful `uv.fs_opendir()` call.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_closedir(dir: uv.luv_dir_t, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (dir:nvim.type.uv.LuvDirT, callback:nvim.type.uv.fs_closedir.Callback) : nvim.type.uv.UvFsT {})
	function fs_closedir(dir:nvim.type.uv.LuvDirT):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_copyfile(path: string, new_path: string, flags?: integer|uv.fs_copyfile.flags_t)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Copies a file from path to new_path. If the `flags` parameter is omitted, then the 3rd parameter will be treated as the `callback`.
		
		 **Returns (sync version):** `boolean` or `fail`
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_copyfile(path: string, new_path: string, flags?: integer|uv.fs_copyfile.flags_t, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
		
		---
		
		```lua
		function uv.fs_copyfile(path: string, new_path: string, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, new_path:String, flags:nvim.type.uv.fs_copyfile.Flags, callback:nvim.type.uv.fs_copyfile.Callback) : nvim.type.uv.UvFsT {})
	@:overload(function (path:String, new_path:String, callback:nvim.type.uv.fs_copyfile.Callback) : nvim.type.uv.UvFsT {})
	function fs_copyfile(path:String, new_path:String, ?flags:nvim.type.uv.fs_copyfile.Flags):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_event_getpath(fs_event: uv.uv_fs_event_t)
		  -> path: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the path being monitored by the handle.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_event_getpath(fs_event:nvim.type.uv.UvFsEventT):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_event_start(fs_event: uv.uv_fs_event_t, path: string, flags: uv.fs_event_start.flags, callback: fun(err: string|nil, filename: string, events: uv.fs_event_start.callback.events))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start the handle with the given callback, which will watch the specified path
		 for changes.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_event_start(fs_event:nvim.type.uv.UvFsEventT, path:String, flags:nvim.type.uv.fs_event_start.Flags, callback:nvim.type.uv.fs_event_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_event_stop(fs_event: uv.uv_fs_event_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the handle, the callback will no longer be called.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_event_stop(fs_event:nvim.type.uv.UvFsEventT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_fchmod(fd: integer, mode: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `fchmod(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_fchmod(fd: integer, mode: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, mode:Int, callback:nvim.type.uv.fs_fchmod.Callback) : nvim.type.uv.UvFsT {})
	function fs_fchmod(fd:Int, mode:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_fchown(fd: integer, uid: integer, gid: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `fchown(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_fchown(fd: integer, uid: integer, gid: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, uid:Int, gid:Int, callback:nvim.type.uv.fs_fchown.Callback) : nvim.type.uv.UvFsT {})
	function fs_fchown(fd:Int, uid:Int, gid:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_fdatasync(fd: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `fdatasync(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_fdatasync(fd: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, callback:nvim.type.uv.fs_fdatasync.Callback) : nvim.type.uv.UvFsT {})
	function fs_fdatasync(fd:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_fstat(fd: integer)
		  -> stat: uv.fs_stat.result|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `fstat(2)`.
		
		 **Returns (sync version):** `table` or `fail` (see `uv.fs_stat`)
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_fstat(fd: integer, callback: fun(err: string|nil, stat: uv.fs_stat.result|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, callback:nvim.type.uv.fs_fstat.Callback) : nvim.type.uv.UvFsT {})
	function fs_fstat(fd:Int):nvim.helper.Multireturn<Null<nvim.type.uv.fs_stat.Result>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_fsync(fd: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `fsync(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_fsync(fd: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, callback:nvim.type.uv.fs_fsync.Callback) : nvim.type.uv.UvFsT {})
	function fs_fsync(fd:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_ftruncate(fd: integer, offset: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `ftruncate(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_ftruncate(fd: integer, offset: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, offset:Int, callback:nvim.type.uv.fs_ftruncate.Callback) : nvim.type.uv.UvFsT {})
	function fs_ftruncate(fd:Int, offset:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_futime(fd: integer, atime: number, mtime: number)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `futime(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_futime(fd: integer, atime: number, mtime: number, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, atime:Float, mtime:Float, callback:nvim.type.uv.fs_futime.Callback) : nvim.type.uv.UvFsT {})
	function fs_futime(fd:Int, atime:Float, mtime:Float):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_lchown(fd: integer, uid: integer, gid: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `lchown(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_lchown(fd: integer, uid: integer, gid: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, uid:Int, gid:Int, callback:nvim.type.uv.fs_lchown.Callback) : nvim.type.uv.UvFsT {})
	function fs_lchown(fd:Int, uid:Int, gid:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_link(path: string, new_path: string)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `link(2)`.
		
		 **Returns (sync version):** `boolean` or `fail`
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_link(path: string, new_path: string, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, new_path:String, callback:nvim.type.uv.fs_link.Callback) : nvim.type.uv.UvFsT {})
	function fs_link(path:String, new_path:String):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_lstat(path: integer)
		  -> stat: uv.fs_stat.result|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `lstat(2)`.
		
		 **Returns (sync version):** `table` or `fail` (see `uv.fs_stat`)
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_lstat(path: integer, callback: fun(err: string|nil, stat: uv.fs_stat.result|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:Int, callback:nvim.type.uv.fs_lstat.Callback) : nvim.type.uv.UvFsT {})
	function fs_lstat(path:Int):nvim.helper.Multireturn<Null<nvim.type.uv.fs_stat.Result>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_lutime(path: string, atime: number, mtime: number)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `lutime(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_lutime(path: string, atime: number, mtime: number, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, atime:Float, mtime:Float, callback:nvim.type.uv.fs_lutime.Callback) : nvim.type.uv.UvFsT {})
	function fs_lutime(path:String, atime:Float, mtime:Float):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_mkdir(path: string, mode: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `mkdir(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_mkdir(path: string, mode: integer, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, mode:Int, callback:nvim.type.uv.fs_mkdir.Callback) : nvim.type.uv.UvFsT {})
	function fs_mkdir(path:String, mode:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_mkdtemp(template: string)
		  -> path: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `mkdtemp(3)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_mkdtemp(template: string, callback: fun(err: string|nil, path?: string))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (template:String, callback:nvim.type.uv.fs_mkdtemp.Callback) : nvim.type.uv.UvFsT {})
	function fs_mkdtemp(template:String):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_mkstemp(template: string)
		  -> fd: integer|nil
		  2. path_or_errmsg: string
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `mkstemp(3)`. Returns a temporary file handle and filename.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_mkstemp(template: string, callback: fun(err: string|nil, fd?: integer, path?: string))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (template:String, callback:nvim.type.uv.fs_mkstemp.Callback) : nvim.type.uv.UvFsT {})
	function fs_mkstemp(template:String):nvim.helper.Multireturn<Null<Int>, String, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_open(path: string, flags: string|integer|"a"|"a+"|"ax"|"ax+"|"r"|"r+"|"rs"|"rs+"|"sr"|"sr+"|"w"|"w+"|"wx"|"wx+"|"xa"|"xa+"|"xw"|"xw+", mode: integer)
		  -> fd: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `open(2)`. Access `flags` may be an integer or one of: `"r"`,
		 `"rs"`, `"sr"`, `"r+"`, `"rs+"`, `"sr+"`, `"w"`, `"wx"`, `"xw"`, `"w+"`,
		 `"wx+"`, `"xw+"`, `"a"`, `"ax"`, `"xa"`, `"a+"`, `"ax+"`, or "`xa+`".
		
		 **Returns (sync version):** `integer` or `fail`
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		 **Note:** On Windows, libuv uses `CreateFileW` and thus the file is always
		 opened in binary mode. Because of this, the `O_BINARY` and `O_TEXT` flags are
		 not supported.
		
		
		
		---
		
		```lua
		flags:
		    | "r"
		    | "rs"
		    | "sr"
		    | "r+"
		    | "rs+"
		    | "sr+"
		    | "w"
		    | "wx"
		    | "xw"
		    | "w+"
		    | "wx+"
		    | "xw+"
		    | "a"
		    | "ax"
		    | "xa"
		    | "a+"
		    | "ax+"
		    | "xa+"
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_open(path: string, flags: string|integer|"a"|"a+"|"ax"|"ax+"|"r"|"r+"|"rs"|"rs+"|"sr"|"sr+"|"w"|"w+"|"wx"|"wx+"|"xa"|"xa+"|"xw"|"xw+", mode: integer, callback: fun(err: string|nil, fd?: integer))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, flags:nvim.type.uv.fs_open.Flags, mode:Int, callback:nvim.type.uv.fs_open.Callback) : nvim.type.uv.UvFsT {})
	function fs_open(path:String, flags:nvim.type.uv.fs_open.Flags, mode:Int):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_opendir(path: string)
		  -> dir: uv.luv_dir_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Opens path as a directory stream. Returns a handle that the user can pass to
		 `uv.fs_readdir()`. The `entries` parameter defines the maximum number of entries
		 that should be returned by each call to `uv.fs_readdir()`.
		
		 **Returns (sync version):** `luv_dir_t userdata` or `fail`
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_opendir(path: string, callback: fun(err: string|nil, dir?: uv.luv_dir_t), entries?: integer)
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_opendir.Callback, entries:Int) : nvim.type.uv.UvFsT {})
	function fs_opendir(path:String):nvim.helper.Multireturn<Null<nvim.type.uv.LuvDirT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_poll_getpath(fs_poll: uv.uv_fs_poll_t)
		  -> path: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the path being monitored by the handle.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_poll_getpath(fs_poll:nvim.type.uv.UvFsPollT):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_poll_start(fs_poll: uv.uv_fs_poll_t, path: string, interval: integer, callback: fun(err: string|nil, prev: uv.fs_stat.result|nil, curr: uv.fs_stat.result|nil))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Check the file at `path` for changes every `interval` milliseconds.
		
		 **Note:** For maximum portability, use multi-second intervals. Sub-second
		 intervals will not detect all changes on many file systems.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_poll_start(fs_poll:nvim.type.uv.UvFsPollT, path:String, interval:Int, callback:nvim.type.uv.fs_poll_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_poll_stop(fs_poll: uv.uv_fs_poll_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the handle, the callback will no longer be called.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_poll_stop(fs_poll:nvim.type.uv.UvFsPollT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_read(fd: integer, size: integer, offset?: integer)
		  -> data: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `preadv(2)`. Returns any data. An empty string indicates EOF.
		
		 If `offset` is nil or omitted, it will default to `-1`, which indicates 'use and update the current file offset.'
		
		 **Note:** When `offset` is >= 0, the current file offset will not be updated by the read.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_read(fd: integer, size: integer, offset?: integer, callback: fun(err: string|nil, data?: string))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, size:Int, offset:Int, callback:nvim.type.uv.fs_read.Callback) : nvim.type.uv.UvFsT {})
	function fs_read(fd:Int, size:Int, ?offset:Int):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_readdir(dir: uv.luv_dir_t)
		  -> entries: uv.fs_readdir.entry[]|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Iterates over the directory stream `luv_dir_t` returned by a successful
		 `uv.fs_opendir()` call. A table of data tables is returned where the number
		 of entries `n` is equal to or less than the `entries` parameter used in
		 the associated `uv.fs_opendir()` call.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_readdir(dir: uv.luv_dir_t, callback: fun(err: string|nil, entries: uv.fs_readdir.entry[]|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (dir:nvim.type.uv.LuvDirT, callback:nvim.type.uv.fs_readdir.Callback) : nvim.type.uv.UvFsT {})
	function fs_readdir(dir:nvim.type.uv.LuvDirT):nvim.helper.Multireturn<Null<Array<nvim.type.uv.fs_readdir.Entry>>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_readlink(path: string)
		  -> path: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `readlink(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_readlink(path: string, callback: fun(err: string|nil, path?: string))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_readlink.Callback) : nvim.type.uv.UvFsT {})
	function fs_readlink(path:String):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_realpath(path: string)
		  -> realpath: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `realpath(3)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_realpath(path: string, callback: fun(err: string|nil, path?: string))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_realpath.Callback) : nvim.type.uv.UvFsT {})
	function fs_realpath(path:String):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_rename(path: string, new_path: string)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `rename(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_rename(path: string, new_path: string, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, new_path:String, callback:nvim.type.uv.fs_rename.Callback) : nvim.type.uv.UvFsT {})
	function fs_rename(path:String, new_path:String):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_rmdir(path: string)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `rmdir(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_rmdir(path: string, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_rmdir.Callback) : nvim.type.uv.UvFsT {})
	function fs_rmdir(path:String):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_scandir(path: string, callback?: fun(err: string|nil, success?: uv.uv_fs_t))
		  -> fs: uv.uv_fs_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `scandir(3)`, with a slightly different API. Returns a handle that
		 the user can pass to `uv.fs_scandir_next()`.
		
		 **Note:** This function can be used synchronously or asynchronously. The request
		 userdata is always synchronously returned regardless of whether a callback is
		 provided and the same userdata is passed to the callback if it is provided.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_scandir(path:String, ?callback:nvim.type.uv.fs_scandir.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvFsT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_scandir_next(fs: uv.uv_fs_t)
		  -> name: string|nil
		  2. type_or_errmsg: string
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Called on a `uv_fs_t` returned by `uv.fs_scandir()` to get the next directory
		 entry data as a `name, type` pair. When there are no more entries, `nil` is
		 returned.
		
		 **Note:** This function only has a synchronous version. See `uv.fs_opendir` and
		 its related functions for an asynchronous version.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function fs_scandir_next(fs:nvim.type.uv.UvFsT):nvim.helper.Multireturn<Null<String>, String, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_sendfile(out_fd: integer, in_fd: integer, in_offset: integer, size: integer)
		  -> bytes: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Limited equivalent to `sendfile(2)`. Returns the number of bytes written.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_sendfile(out_fd: integer, in_fd: integer, in_offset: integer, size: integer, callback: fun(err: string|nil, bytes?: integer))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (out_fd:Int, in_fd:Int, in_offset:Int, size:Int, callback:nvim.type.uv.fs_sendfile.Callback) : nvim.type.uv.UvFsT {})
	function fs_sendfile(out_fd:Int, in_fd:Int, in_offset:Int, size:Int):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_stat(path: string)
		  -> success: uv.fs_stat.result|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `stat(2)`.
		
		 **Returns (sync version):** `table` or `fail`
		 - `dev` : `integer`
		 - `mode` : `integer`
		 - `nlink` : `integer`
		 - `uid` : `integer`
		 - `gid` : `integer`
		 - `rdev` : `integer`
		 - `ino` : `integer`
		 - `size` : `integer`
		 - `blksize` : `integer`
		 - `blocks` : `integer`
		 - `flags` : `integer`
		 - `gen` : `integer`
		 - `atime` : `table`
		   - `sec` : `integer`
		   - `nsec` : `integer`
		 - `mtime` : `table`
		   - `sec` : `integer`
		   - `nsec` : `integer`
		 - `ctime` : `table`
		   - `sec` : `integer`
		   - `nsec` : `integer`
		 - `birthtime` : `table`
		   - `sec` : `integer`
		   - `nsec` : `integer`
		 - `type` : `string`
		
		 **Returns (async version):** `uv_fs_t userdata`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_stat(path: string, callback: fun(err: string|nil, stat: uv.fs_stat.result|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_stat.Callback) : nvim.type.uv.UvFsT {})
	function fs_stat(path:String):nvim.helper.Multireturn<Null<nvim.type.uv.fs_stat.Result>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_statfs(path: string)
		  -> stat: uv.fs_statfs.result|nil
		```
		
		---
		
		 Equivalent to `statfs(2)`.
		
		 **Returns** `table` or `nil`
		 - `type` : `integer`
		 - `bsize` : `integer`
		 - `blocks` : `integer`
		 - `bfree` : `integer`
		 - `bavail` : `integer`
		 - `files` : `integer`
		 - `ffree` : `integer`
		
		---
		
		```lua
		function uv.fs_statfs(path: string, callback: fun(err: string|nil, stat: uv.fs_statfs.result|nil))
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_statfs.Callback) : Dynamic {})
	function fs_statfs(path:String):Null<nvim.type.uv.fs_statfs.Result>;
	/**
		```lua
		function uv.fs_symlink(path: string, new_path: string, flags?: integer|uv.fs_symlink.flags)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `symlink(2)`. If the `flags` parameter is omitted, then the 3rd parameter will be treated as the `callback`.
		
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_symlink(path: string, new_path: string, flags?: integer|uv.fs_symlink.flags, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
		
		---
		
		```lua
		function uv.fs_symlink(path: string, new_path: string, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, new_path:String, flags:haxe.extern.EitherType<nvim.type.uv.fs_symlink.Flags, Int>, callback:nvim.type.uv.fs_symlink.Callback) : nvim.type.uv.UvFsT {})
	@:overload(function (path:String, new_path:String, callback:nvim.type.uv.fs_symlink.Callback) : nvim.type.uv.UvFsT {})
	function fs_symlink(path:String, new_path:String, ?flags:haxe.extern.EitherType<nvim.type.uv.fs_symlink.Flags, Int>):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_unlink(path: string)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `unlink(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_unlink(path: string, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, callback:nvim.type.uv.fs_unlink.Callback) : nvim.type.uv.UvFsT {})
	function fs_unlink(path:String):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_utime(path: string, atime: number, mtime: number)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `utime(2)`.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_utime(path: string, atime: number, mtime: number, callback: fun(err: string|nil, success: boolean|nil))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (path:String, atime:Float, mtime:Float, callback:nvim.type.uv.fs_utime.Callback) : nvim.type.uv.UvFsT {})
	function fs_utime(path:String, atime:Float, mtime:Float):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.fs_write(fd: integer, data: string|string[], offset?: integer)
		  -> bytes: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `pwritev(2)`. Returns the number of bytes written.
		
		 If `offset` is nil or omitted, it will default to `-1`, which indicates 'use and update the current file offset.'
		
		 **Note:** When `offset` is >= 0, the current file offset will not be updated by the write.
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.fs_write(fd: integer, data: string|string[], offset?: integer, callback: fun(err: string|nil, bytes?: integer))
		  -> uv.uv_fs_t
		```
	**/
	@:luaDotMethod
	@:overload(function (fd:Int, data:nvim.type.uv.Buffer, offset:Int, callback:nvim.type.uv.fs_write.Callback) : nvim.type.uv.UvFsT {})
	function fs_write(fd:Int, data:nvim.type.uv.Buffer, ?offset:Int):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.get_constrained_memory()
		  -> number
		```
		
		---
		
		 Gets the amount of memory available to the process in bytes based on limits
		 imposed by the OS. If there is no such constraint, or the constraint is unknown,
		 0 is returned. Note that it is not unusual for this value to be less than or
		 greater than the total system memory.
	**/
	@:luaDotMethod
	function get_constrained_memory():Float;
	/**
		```lua
		function uv.get_free_memory()
		  -> number
		```
		
		---
		
		 Returns the current free system memory in bytes.
	**/
	@:luaDotMethod
	function get_free_memory():Float;
	/**
		```lua
		function uv.get_process_title()
		  -> title: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the title of the current process.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function get_process_title():nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.get_total_memory()
		  -> number
		```
		
		---
		
		 Returns the current total system memory in bytes.
		
		 **Returns:** `number`
	**/
	@:luaDotMethod
	function get_total_memory():Float;
	/**
		```lua
		function uv.getaddrinfo(host: string, service: string, hints?: uv.getaddrinfo.hints)
		  -> info: uv.getaddrinfo.result[]|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `getaddrinfo(3)`. Either `node` or `service` may be `nil` but not
		 both.
		
		 Valid hint strings for the keys that take a string:
		 - `family`: `"unix"`, `"inet"`, `"inet6"`, `"ipx"`,
		 `"netlink"`, `"x25"`, `"ax25"`, `"atmpvc"`, `"appletalk"`, or `"packet"`
		 - `socktype`: `"stream"`, `"dgram"`, `"raw"`,
		 `"rdm"`, or `"seqpacket"`
		 - `protocol`: will be looked up using the `getprotobyname(3)` function (examples: `"ip"`, `"icmp"`, `"tcp"`, `"udp"`, etc)
		
		 **Returns (sync version):** `table` or `fail`
		 - `[1, 2, 3, ..., n]` : `table`
		   - `addr` : `string`
		   - `family` : `string`
		   - `port` : `integer` or `nil`
		   - `socktype` : `string`
		   - `protocol` : `string`
		   - `canonname` : `string` or `nil`
		
		 **Returns (async version):** `uv_getaddrinfo_t userdata` or `fail`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.getaddrinfo(host: string, service: string, hints?: uv.getaddrinfo.hints, callback: fun(err: string|nil, addresses: uv.getaddrinfo.result[]|nil))
		  -> uv.uv_getaddrinfo_t
		```
	**/
	@:luaDotMethod
	@:overload(function (host:String, service:String, hints:nvim.type.uv.getaddrinfo.Hints, callback:nvim.type.uv.getaddrinfo.Callback) : nvim.type.uv.UvGetaddrinfoT {})
	function getaddrinfo(host:String, service:String, ?hints:nvim.type.uv.getaddrinfo.Hints):nvim.helper.Multireturn<Null<Array<nvim.type.uv.getaddrinfo.Result>>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.getgid()
		  -> integer
		```
		
		---
		
		 Returns the group ID of the process.
		
		 **Note:** This is not a libuv function and is not supported on Windows.
	**/
	@:luaDotMethod
	function getgid():Int;
	/**
		```lua
		function uv.getnameinfo(address: uv.getnameinfo.address)
		  -> host: string|nil
		  2. service_or_errmsg: string
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Equivalent to `getnameinfo(3)`.
		
		 When specified, `family` must be one of `"unix"`, `"inet"`, `"inet6"`, `"ipx"`,
		 `"netlink"`, `"x25"`, `"ax25"`, `"atmpvc"`, `"appletalk"`, or `"packet"`.
		
		 **Returns (sync version):** `string, string` or `fail`
		
		 **Returns (async version):** `uv_getnameinfo_t userdata` or `fail`
		
		
		
		---
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.getnameinfo(address: uv.getnameinfo.address, callback: fun(err: string|nil, host?: string, service?: string))
		  -> uv.uv_getnameinfo_t|nil
		  2. string|nil
		  3. string|nil
		```
	**/
	@:luaDotMethod
	@:overload(function (address:nvim.type.uv.getnameinfo.Address, callback:nvim.type.uv.getnameinfo.Callback) : nvim.helper.Multireturn<Null<nvim.type.uv.UvGetnameinfoT>, Null<String>, Null<String>, Void, Void, Void> {})
	function getnameinfo(address:nvim.type.uv.getnameinfo.Address):nvim.helper.Multireturn<Null<String>, String, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.getpid()
		```
		
		---
		
		 **Deprecated:** Please use `uv.os_getpid()` instead.
	**/
	@:luaDotMethod
	function getpid():Dynamic;
	/**
		```lua
		function uv.getrusage()
		  -> usage: uv.getrusage.result|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the resource usage.
		
		 **Returns:** `table` or `fail`
		 - `utime` : `table` (user CPU time used)
		   - `sec` : `integer`
		   - `usec` : `integer`
		 - `stime` : `table` (system CPU time used)
		   - `sec` : `integer`
		   - `usec` : `integer`
		 - `maxrss` : `integer` (maximum resident set size)
		 - `ixrss` : `integer` (integral shared memory size)
		 - `idrss` : `integer` (integral unshared data size)
		 - `isrss` : `integer` (integral unshared stack size)
		 - `minflt` : `integer` (page reclaims (soft page faults))
		 - `majflt` : `integer` (page faults (hard page faults))
		 - `nswap` : `integer` (swaps)
		 - `inblock` : `integer` (block input operations)
		 - `oublock` : `integer` (block output operations)
		 - `msgsnd` : `integer` (IPC messages sent)
		 - `msgrcv` : `integer` (IPC messages received)
		 - `nsignals` : `integer` (signals received)
		 - `nvcsw` : `integer` (voluntary context switches)
		 - `nivcsw` : `integer` (involuntary context switches)
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function getrusage():nvim.helper.Multireturn<Null<nvim.type.uv.getrusage.Result>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.gettimeofday()
		  -> seconds: integer|nil
		  2. usecs_or_errmsg: string|integer
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Cross-platform implementation of `gettimeofday(2)`. Returns the seconds and
		 microseconds of a unix time as a pair.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function gettimeofday():nvim.helper.Multireturn<Null<Int>, haxe.extern.EitherType<Int, String>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.getuid()
		  -> integer
		```
		
		---
		
		 Returns the user ID of the process.
		
		 **Note:** This is not a libuv function and is not supported on Windows.
	**/
	@:luaDotMethod
	function getuid():Int;
	/**
		```lua
		function uv.guess_handle(fd: integer)
		  -> string
		```
		
		---
		
		 Used to detect what type of stream should be used with a given file
		 descriptor `fd`. Usually this will be used during initialization to guess the
		 type of the stdio streams.
	**/
	@:luaDotMethod
	function guess_handle(fd:Int):String;
	/**
		```lua
		function uv.handle_get_type(handle: uv.uv_handle_t)
		  -> type: string
		  2. enum: integer
		```
		
		---
		
		 Returns the name of the struct for a given handle (e.g. `"pipe"` for `uv_pipe_t`)
		 and the libuv enum integer for the handle's type (`uv_handle_type`).
	**/
	@:luaDotMethod
	function handle_get_type(handle:nvim.type.uv.UvHandleT):nvim.helper.Multireturn<String, Int, Void, Void, Void, Void>;
	/**
		```lua
		function uv.has_ref(handle: uv.uv_handle_t)
		  -> has_ref: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns `true` if the handle referenced, `false` if not.
		
		 See [Reference counting][].
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function has_ref(handle:nvim.type.uv.UvHandleT):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.hrtime()
		  -> number
		```
		
		---
		
		 Returns a current high-resolution time in nanoseconds as a number. This is
		 relative to an arbitrary time in the past. It is not related to the time of day
		 and therefore not subject to clock drift. The primary use is for measuring
		 time between intervals.
		
		 **Returns:** `number`
	**/
	@:luaDotMethod
	function hrtime():Float;
	/**
		```lua
		function uv.idle_start(idle: uv.uv_idle_t, callback: function)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start the handle with the given callback.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function idle_start(idle:nvim.type.uv.UvIdleT, callback:haxe.Constraints.Function):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.idle_stop(idle: uv.uv_idle_t, check: any)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the handle, the callback will no longer be called.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function idle_stop(idle:nvim.type.uv.UvIdleT, check:Any):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.if_indextoiid(ifindex: integer)
		  -> id: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Retrieves a network interface identifier suitable for use in an IPv6 scoped
		 address. On Windows, returns the numeric `ifindex` as a string. On all other
		 platforms, `uv.if_indextoname()` is used.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function if_indextoiid(ifindex:Int):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.if_indextoname(ifindex: integer)
		  -> name: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 IPv6-capable implementation of `if_indextoname(3)`.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function if_indextoname(ifindex:Int):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.interface_addresses()
		  -> table<string, uv.interface_addresses.addr>
		```
		
		---
		
		 Returns address information about the network interfaces on the system in a
		 table. Each table key is the name of the interface while each associated value
		 is an array of address information where fields are `ip`, `family`, `netmask`,
		 `internal`, and `mac`.
	**/
	@:luaDotMethod
	function interface_addresses():lua.Table<String, nvim.type.uv.interface_addresses.Addr>;
	/**
		```lua
		function uv.is_active(handle: uv.uv_handle_t)
		  -> active: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns `true` if the handle is active, `false` if it's inactive. What "active”
		 means depends on the type of handle:
		
		   - A [`uv_async_t`][] handle is always active and cannot be deactivated, except
		   by closing it with `uv.close()`.
		
		   - A [`uv_pipe_t`][], [`uv_tcp_t`][], [`uv_udp_t`][], etc. handle - basically
		   any handle that deals with I/O - is active when it is doing something that
		   involves I/O, like reading, writing, connecting, accepting new connections,
		   etc.
		
		   - A [`uv_check_t`][], [`uv_idle_t`][], [`uv_timer_t`][], etc. handle is active
		   when it has been started with a call to `uv.check_start()`, `uv.idle_start()`,
		   `uv.timer_start()` etc. until it has been stopped with a call to its
		   respective stop function.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function is_active(handle:nvim.type.uv.UvHandleT):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.is_closing(handle: uv.uv_handle_t)
		  -> closing: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns `true` if the handle is closing or closed, `false` otherwise.
		
		 **Note**: This function should only be used between the initialization of the
		 handle and the arrival of the close callback.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function is_closing(handle:nvim.type.uv.UvHandleT):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.is_readable(stream: uv.uv_stream_t)
		  -> boolean
		```
		
		---
		
		 Returns `true` if the stream is readable, `false` otherwise.
	**/
	@:luaDotMethod
	function is_readable(stream:nvim.type.uv.UvStreamT):Bool;
	/**
		```lua
		function uv.is_writable(stream: uv.uv_stream_t)
		  -> boolean
		```
		
		---
		
		 Returns `true` if the stream is writable, `false` otherwise.
	**/
	@:luaDotMethod
	function is_writable(stream:nvim.type.uv.UvStreamT):Bool;
	/**
		```lua
		function uv.kill(pid: integer, signum: string|integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Sends the specified signal to the given PID. Check the documentation on
		 `uv_signal_t` for signal support, specially on Windows.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function kill(pid:Int, signum:haxe.extern.EitherType<Int, String>):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.listen(stream: uv.uv_stream_t, backlog: integer, callback: fun(err: string|nil))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start listening for incoming connections. `backlog` indicates the number of
		 connections the kernel might queue, same as `listen(2)`. When a new incoming
		 connection is received the callback is called.
		
		 **Returns:** `0` or `fail`
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function listen(stream:nvim.type.uv.UvStreamT, backlog:Int, callback:nvim.type.uv.listen.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.loadavg()
		  -> number
		  2. number
		  3. number
		```
		
		---
		
		 Returns the load average as a triad. Not supported on Windows.
	**/
	@:luaDotMethod
	function loadavg():nvim.helper.Multireturn<Float, Float, Float, Void, Void, Void>;
	/**
		```lua
		function uv.loop_alive()
		  -> alive: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns `true` if there are referenced active handles, active requests, or
		 closing handles in the loop; otherwise, `false`.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function loop_alive():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.loop_close()
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Closes all internal loop resources. In normal execution, the loop will
		 automatically be closed when it is garbage collected by Lua, so it is not
		 necessary to explicitly call `loop_close()`. Call this function only after the
		 loop has finished executing and all open handles and requests have been closed,
		 or it will return `EBUSY`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function loop_close():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.loop_configure(option: "block_signal", value: "sigprof")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set additional loop options. You should normally call this before the first call
		 to uv_run() unless mentioned otherwise.
		
		 Supported options:
		
		   - `"block_signal"`: Block a signal when polling for new events. The second argument
		   to loop_configure() is the signal name (as a lowercase string) or the signal number.
		   This operation is currently only implemented for `"sigprof"` signals, to suppress
		   unnecessary wakeups when using a sampling profiler. Requesting other signals will
		   fail with `EINVAL`.
		   - `"metrics_idle_time"`: Accumulate the amount of idle time the event loop spends
		   in the event provider. This option is necessary to use `metrics_idle_time()`.
		
		 An example of a valid call to this function is:
		
		 ```lua
		 uv.loop_configure("block_signal", "sigprof")
		 ```
		
		 **Note:** Be prepared to handle the `ENOSYS` error; it means the loop option is
		 not supported by the platform.
		
		
		
		---
		
		```lua
		option:
		    | "block_signal"
		
		value:
		    | "sigprof"
		
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.loop_configure(option: "metrics_idle_time")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
	**/
	@:luaDotMethod
	function loop_configure(option:String, value:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.loop_mode()
		  -> string|nil
		```
		
		---
		
		 If the loop is running, returns a string indicating the mode in use. If the loop
		 is not running, `nil` is returned instead.
	**/
	@:luaDotMethod
	function loop_mode():Null<String>;
	/**
		```lua
		function uv.metrics_idle_time()
		  -> number
		```
		
		---
		
		 Retrieve the amount of time the event loop has been idle in the kernel’s event
		 provider (e.g. `epoll_wait`). The call is thread safe.
		
		 The return value is the accumulated time spent idle in the kernel’s event
		 provider starting from when the [`uv_loop_t`][] was configured to collect the idle time.
		
		 **Note:** The event loop will not begin accumulating the event provider’s idle
		 time until calling `loop_configure` with `"metrics_idle_time"`.
		
		 **Returns:** `number`
		
		 ---
		
		 [luv]: https://github.com/luvit/luv
		 [luvit]: https://github.com/luvit/luvit
		 [libuv]: https://github.com/libuv/libuv
		 [libuv documentation page]: http://docs.libuv.org/
		 [libuv API documentation]: http://docs.libuv.org/en/v1.x/api.html
	**/
	@:luaDotMethod
	function metrics_idle_time():Float;
	/**
		```lua
		function uv.new_async(callback?: fun(...any))
		  -> async: uv.uv_async_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_async_t`. Returns the Lua userdata wrapping
		 it. A `nil` callback is allowed.
		
		 **Note**: Unlike other handle initialization functions, this immediately starts
		 the handle.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_async(?callback:nvim.type.uv.new_async.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvAsyncT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_check()
		  -> check: uv.uv_check_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_check_t`. Returns the Lua userdata wrapping
		 it.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_check():nvim.helper.Multireturn<Null<nvim.type.uv.UvCheckT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_fs_event()
		  -> fs_event: uv.uv_fs_event_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_fs_event_t`. Returns the Lua userdata wrapping
		 it.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_fs_event():nvim.helper.Multireturn<Null<nvim.type.uv.UvFsEventT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_fs_poll()
		  -> fs_poll: uv.uv_fs_poll_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_fs_poll_t`. Returns the Lua userdata wrapping
		 it.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_fs_poll():nvim.helper.Multireturn<Null<nvim.type.uv.UvFsPollT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_idle()
		  -> idle: uv.uv_idle_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_idle_t`. Returns the Lua userdata wrapping
		 it.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_idle():nvim.helper.Multireturn<Null<nvim.type.uv.UvIdleT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_pipe(ipc?: boolean)
		  -> pipe: uv.uv_pipe_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_pipe_t`. Returns the Lua userdata wrapping
		 it. The `ipc` argument is a boolean to indicate if this pipe will be used for
		 handle passing between processes.
		
		
		```lua
		ipc:
		    | false
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_pipe(?ipc:Bool):nvim.helper.Multireturn<Null<nvim.type.uv.UvPipeT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_poll(fd: integer)
		  -> poll: uv.uv_poll_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Initialize the handle using a file descriptor.
		
		 The file descriptor is set to non-blocking mode.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_poll(fd:Int):nvim.helper.Multireturn<Null<nvim.type.uv.UvPollT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_prepare()
		  -> prepare: uv.uv_prepare_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_prepare_t`. Returns the Lua userdata wrapping
		 it.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_prepare():nvim.helper.Multireturn<Null<nvim.type.uv.UvPrepareT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_signal()
		  -> signal: uv.uv_signal_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_signal_t`. Returns the Lua userdata wrapping
		 it.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_signal():nvim.helper.Multireturn<Null<nvim.type.uv.UvSignalT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_socket_poll(fd: integer)
		  -> poll: uv.uv_poll_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Initialize the handle using a socket descriptor. On Unix this is identical to
		 `uv.new_poll()`. On windows it takes a SOCKET handle.
		
		 The socket is set to non-blocking mode.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_socket_poll(fd:Int):nvim.helper.Multireturn<Null<nvim.type.uv.UvPollT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_tcp(flags?: "appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25")
		  -> tcp: uv.uv_tcp_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_tcp_t`. Returns the Lua userdata wrapping it.
		 Flags may be a family string: `"unix"`, `"inet"`, `"inet6"`, `"ipx"`,
		 `"netlink"`, `"x25"`, `"ax25"`, `"atmpvc"`, `"appletalk"`, or `"packet"`.
		
		
		```lua
		flags:
		    | "unix"
		    | "inet"
		    | "inet6"
		    | "ipx"
		    | "netlink"
		    | "x25"
		    | "ax25"
		    | "atmpvc"
		    | "appletalk"
		    | "packet"
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_tcp(?flags:nvim.type.uv.socket.Family):nvim.helper.Multireturn<Null<nvim.type.uv.UvTcpT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_thread(options?: uv.new_thread.options, entry: function, ...any)
		  -> thread: uv.luv_thread_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a `luv_thread_t` (not `uv_thread_t`). Returns the Lua
		 userdata wrapping it and asynchronously executes `entry`, which can be either
		 a Lua function or a Lua function dumped to a string. Additional arguments `...`
		 are passed to the `entry` function and an optional `options` table may be
		 provided. Currently accepted `option` fields are `stack_size`.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_thread(?options:nvim.type.uv.new_thread.Options, entry:haxe.Constraints.Function, ___:haxe.Rest<nvim.type.uv.Threadargs>):nvim.helper.Multireturn<Null<nvim.type.uv.LuvThreadT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_timer()
		  -> timer: uv.uv_timer_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_timer_t`. Returns the Lua userdata wrapping
		 it.
		
		 ```lua
		 -- Creating a simple setTimeout wrapper
		 local function setTimeout(timeout, callback)
		   local timer = uv.new_timer()
		   timer:start(timeout, 0, function ()
		     timer:stop()
		     timer:close()
		     callback()
		   end)
		   return timer
		 end
		
		 -- Creating a simple setInterval wrapper
		 local function setInterval(interval, callback)
		   local timer = uv.new_timer()
		   timer:start(interval, interval, function ()
		     callback()
		   end)
		   return timer
		 end
		
		 -- And clearInterval
		 local function clearInterval(timer)
		   timer:stop()
		   timer:close()
		 end
		 ```
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_timer():nvim.helper.Multireturn<Null<nvim.type.uv.UvTimerT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_tty(fd: integer, readable: boolean)
		  -> tty: uv.uv_tty_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Initialize a new TTY stream with the given file descriptor. Usually the file
		 descriptor will be:
		
		  - 0 - stdin
		  - 1 - stdout
		  - 2 - stderr
		
		 On Unix this function will determine the path of the fd of the terminal using
		 ttyname_r(3), open it, and use it if the passed file descriptor refers to a TTY.
		 This lets libuv put the tty in non-blocking mode without affecting other
		 processes that share the tty.
		
		 This function is not thread safe on systems that don’t support ioctl TIOCGPTN or TIOCPTYGNAME, for instance OpenBSD and Solaris.
		
		 **Note:** If reopening the TTY fails, libuv falls back to blocking writes.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_tty(fd:Int, readable:Bool):nvim.helper.Multireturn<Null<nvim.type.uv.UvTtyT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_udp(flags?: integer|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"|uv.new_udp.flags)
		  -> udp: uv.uv_udp_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Creates and initializes a new `uv_udp_t`. Returns the Lua userdata wrapping
		 it. The actual socket is created lazily.
		
		 When specified, `family` must be one of `"unix"`, `"inet"`, `"inet6"`,
		 `"ipx"`, `"netlink"`, `"x25"`, `"ax25"`, `"atmpvc"`, `"appletalk"`, or
		 `"packet"`.
		
		 When specified, `mmsgs` determines the number of messages able to be received
		 at one time via `recvmmsg(2)` (the allocated buffer will be sized to be able
		 to fit the specified number of max size dgrams). Only has an effect on
		 platforms that support `recvmmsg(2)`.
		
		 **Note:** For backwards compatibility reasons, `flags` can also be a string or
		 integer. When it is a string, it will be treated like the `family` key above.
		 When it is an integer, it will be used directly as the `flags` parameter when
		 calling `uv_udp_init_ex`.
		
		 **Returns:** `uv_udp_t userdata` or `fail`
		
		
		```lua
		flags:
		    | "unix"
		    | "inet"
		    | "inet6"
		    | "ipx"
		    | "netlink"
		    | "x25"
		    | "ax25"
		    | "atmpvc"
		    | "appletalk"
		    | "packet"
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function new_udp(?flags:haxe.extern.EitherType<nvim.type.uv.new_udp.Flags, haxe.extern.EitherType<nvim.type.uv.new_udp.flags.Family, Int>>):nvim.helper.Multireturn<Null<nvim.type.uv.UvUdpT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.new_work(work_callback: fun(...any), after_work_callback: fun(...any))
		  -> uv.luv_work_ctx_t
		```
		
		---
		
		 Creates and initializes a new `luv_work_ctx_t` (not `uv_work_t`). Returns the
		 Lua userdata wrapping it.
		
		 **Parameters:**
		 - `work_callback`: `function`
		   - `...`: `threadargs` passed to/from `uv.queue_work(work_ctx, ...)`
		 - `after_work_callback`: `function`
		   - `...`: `threadargs` returned from `work_callback`
	**/
	@:luaDotMethod
	function new_work(work_callback:nvim.type.uv.new_work.WorkCallback, after_work_callback:nvim.type.uv.new_work.AfterWorkCallback):nvim.type.uv.LuvWorkCtxT;
	/**
		```lua
		function uv.now()
		  -> integer
		```
		
		---
		
		 Returns the current timestamp in milliseconds. The timestamp is cached at the
		 start of the event loop tick, see `uv.update_time()` for details and rationale.
		
		 The timestamp increases monotonically from some arbitrary point in time. Don't
		 make assumptions about the starting point, you will only get disappointed.
		
		 **Note**: Use `uv.hrtime()` if you need sub-millisecond granularity.
	**/
	@:luaDotMethod
	function now():Int;
	/**
		```lua
		function uv.os_environ()
		  -> table<string, string>
		```
		
		---
		
		 Returns all environmental variables as a dynamic table of names associated with
		 their corresponding values.
		
		 **Warning:** This function is not thread safe.
	**/
	@:luaDotMethod
	function os_environ():lua.Table<String, String>;
	/**
		```lua
		function uv.os_get_passwd()
		  -> uv.os_get_passwd.info
		```
		
		---
		
		 Returns password file information.
	**/
	@:luaDotMethod
	function os_get_passwd():nvim.type.uv.os_get_passwd.Info;
	/**
		```lua
		function uv.os_getenv(name: string, size?: integer)
		  -> value: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the environment variable specified by `name` as string. The internal
		 buffer size can be set by defining `size`. If omitted, `LUAL_BUFFERSIZE` is
		 used. If the environment variable exceeds the storage available in the internal
		 buffer, `ENOBUFS` is returned. If no matching environment variable exists,
		 `ENOENT` is returned.
		
		 **Warning:** This function is not thread safe.
		
		@*param* `size` — (default = `LUAL_BUFFERSIZE`)
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_getenv(name:String, ?size:Int):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.os_gethostname()
		  -> string
		```
		
		---
		
		 Returns the hostname.
	**/
	@:luaDotMethod
	function os_gethostname():String;
	/**
		```lua
		function uv.os_getpid()
		  -> number
		```
		
		---
		
		 Returns the current process ID.
	**/
	@:luaDotMethod
	function os_getpid():Float;
	/**
		```lua
		function uv.os_getppid()
		  -> number
		```
		
		---
		
		 Returns the parent process ID.
	**/
	@:luaDotMethod
	function os_getppid():Float;
	/**
		```lua
		function uv.os_getpriority(pid: integer)
		  -> priority: number|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the scheduling priority of the process specified by `pid`.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_getpriority(pid:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.os_homedir()
		  -> homedir: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 **Warning:** This function is not thread safe.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_homedir():nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.os_setenv(name: string, value: string)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Sets the environmental variable specified by `name` with the string `value`.
		
		 **Warning:** This function is not thread safe.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_setenv(name:String, value:String):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.os_setpriority(pid: integer, priority: integer)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Sets the scheduling priority of the process specified by `pid`. The `priority`
		 range is between -20 (high priority) and 19 (low priority).
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_setpriority(pid:Int, priority:Int):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.os_tmpdir()
		  -> tmpdir: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 **Warning:** This function is not thread safe.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_tmpdir():nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.os_uname()
		  -> uv.os_uname.info
		```
		
		---
		
		 Returns system information.
	**/
	@:luaDotMethod
	function os_uname():nvim.type.uv.os_uname.Info;
	/**
		```lua
		function uv.os_unsetenv()
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 **Warning:** This function is not thread safe.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function os_unsetenv():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe(read_flags: uv.pipe.read_flags, write_flags: uv.pipe.write_flags)
		  -> fds: uv.pipe.fds|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Create a pair of connected pipe handles. Data may be written to the `write` fd and read from the `read` fd. The resulting handles can be passed to `pipe_open`, used with `spawn`, or for any other purpose.
		
		 Flags:
		  - `nonblock`: Opens the specified socket handle for `OVERLAPPED` or `FIONBIO`/`O_NONBLOCK` I/O usage. This is recommended for handles that will be used by libuv, and not usually recommended otherwise.
		
		 Equivalent to `pipe(2)` with the `O_CLOEXEC` flag set.
		
		 **Returns:** `table` or `fail`
		 - `read` : `integer` (file descriptor)
		 - `write` : `integer` (file descriptor)
		
		 ```lua
		 -- Simple read/write with pipe_open
		 local fds = uv.pipe({nonblock=true}, {nonblock=true})
		
		 local read_pipe = uv.new_pipe()
		 read_pipe:open(fds.read)
		
		 local write_pipe = uv.new_pipe()
		 write_pipe:open(fds.write)
		
		 write_pipe:write("hello")
		 read_pipe:read_start(function(err, chunk)
		   assert(not err, err)
		   print(chunk)
		 end)
		 ```
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe(read_flags:nvim.type.uv.pipe.ReadFlags, write_flags:nvim.type.uv.pipe.WriteFlags):nvim.helper.Multireturn<Null<nvim.type.uv.pipe.Fds>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_bind(pipe: uv.uv_pipe_t, name: string)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Bind the pipe to a file path (Unix) or a name (Windows).
		
		 **Note**: Paths on Unix get truncated to sizeof(sockaddr_un.sun_path) bytes,
		 typically between 92 and 108 bytes.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe_bind(pipe:nvim.type.uv.UvPipeT, name:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_chmod(pipe: uv.uv_pipe_t, flags: "r"|"rw"|"w"|"wr")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Alters pipe permissions, allowing it to be accessed from processes run by different users.
		 Makes the pipe writable or readable by all users. `flags` are: `"r"`, `"w"`, `"rw"`, or `"wr"`
		 where `r` is `READABLE` and `w` is `WRITABLE`. This function is blocking.
		
		
		```lua
		flags:
		    | "r"
		    | "rw"
		    | "w"
		    | "wr"
		
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe_chmod(pipe:nvim.type.uv.UvPipeT, flags:nvim.type.uv.pipe_chmod.Flags):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_connect(pipe: uv.uv_pipe_t, name: string, callback?: fun(err: string|nil))
		  -> success: uv.uv_connect_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Connect to the Unix domain socket or the named pipe.
		
		 **Note**: Paths on Unix get truncated to sizeof(sockaddr_un.sun_path) bytes,
		 typically between 92 and 108 bytes.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe_connect(pipe:nvim.type.uv.UvPipeT, name:String, ?callback:nvim.type.uv.pipe_connect.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvConnectT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_getpeername(pipe: uv.uv_pipe_t)
		  -> peername: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the name of the Unix domain socket or the named pipe to which the handle is
		 connected.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe_getpeername(pipe:nvim.type.uv.UvPipeT):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_getsockname(pipe: uv.uv_pipe_t)
		  -> sockname: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the name of the Unix domain socket or the named pipe.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe_getsockname(pipe:nvim.type.uv.UvPipeT):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_open(pipe: uv.uv_pipe_t, fd: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Open an existing file descriptor or [`uv_handle_t`][] as a pipe.
		
		 **Note**: The file descriptor is set to non-blocking mode.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function pipe_open(pipe:nvim.type.uv.UvPipeT, fd:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.pipe_pending_count(pipe: uv.uv_pipe_t)
		  -> integer
		```
		
		---
		
		 Returns the pending pipe count for the named pipe.
	**/
	@:luaDotMethod
	function pipe_pending_count(pipe:nvim.type.uv.UvPipeT):Int;
	/**
		```lua
		function uv.pipe_pending_instances(pipe: uv.uv_pipe_t, count: integer)
		```
		
		---
		
		 Set the number of pending pipe instance handles when the pipe server is waiting
		 for connections.
		
		 **Note**: This setting applies to Windows only.
	**/
	@:luaDotMethod
	function pipe_pending_instances(pipe:nvim.type.uv.UvPipeT, count:Int):Dynamic;
	/**
		```lua
		function uv.pipe_pending_type(pipe: uv.uv_pipe_t)
		  -> string
		```
		
		---
		
		 Used to receive handles over IPC pipes.
		
		 First - call `uv.pipe_pending_count()`, if it's > 0 then initialize a handle of
		 the given type, returned by `uv.pipe_pending_type()` and call
		 `uv.accept(pipe, handle)`.
	**/
	@:luaDotMethod
	function pipe_pending_type(pipe:nvim.type.uv.UvPipeT):String;
	/**
		```lua
		function uv.poll_start(poll: uv.uv_poll_t, events: "d"|"dp"|"p"|"r"|"rd"|"rdp"|"rp"|"rw"|"rwd"|"rwdp"|"rwp"|"w"|"wd"|"wdp"|"wp", callback: fun(err: string|nil, events?: string))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Starts polling the file descriptor.
		
		 `events` are: `"r"`, `"w"`, `"rw"`, `"d"`,
		 `"rd"`, `"wd"`, `"rwd"`, `"p"`, `"rp"`, `"wp"`, `"rwp"`, `"dp"`, `"rdp"`,
		 `"wdp"`, or `"rwdp"` where `r` is `READABLE`, `w` is `WRITABLE`, `d` is
		 `DISCONNECT`, and `p` is `PRIORITIZED`. As soon as an event is detected
		 the callback will be called with status set to 0, and the detected events set on
		 the events field.
		
		 The user should not close the socket while the handle is active. If the user
		 does that anyway, the callback may be called reporting an error status, but this
		 is not guaranteed.
		
		 **Note** Calling `uv.poll_start()` on a handle that is already active is fine.
		 Doing so will update the events mask that is being watched for.
		
		
		```lua
		--  `r` is `READABLE`
		--  `w` is `WRITABLE`
		--  `d` is `DISCONNECT`
		--  `p` is `PRIORITIZED`
		-- 
		events:
		    | "r"
		    | "rd"
		    | "rw"
		    | "rp"
		    | "rdp"
		    | "rwd"
		    | "rwp"
		    | "rwdp"
		    | "d"
		    | "dp"
		    | "w"
		    | "wd"
		    | "wp"
		    | "wdp"
		    | "p"
		
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function poll_start(poll:nvim.type.uv.UvPollT, events:nvim.type.uv.poll.Eventspec, callback:nvim.type.uv.poll_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.poll_stop(poll: uv.uv_poll_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop polling the file descriptor, the callback will no longer be called.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function poll_stop(poll:nvim.type.uv.UvPollT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.prepare_start(prepare: uv.uv_prepare_t, callback: function)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start the handle with the given callback.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function prepare_start(prepare:nvim.type.uv.UvPrepareT, callback:haxe.Constraints.Function):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.prepare_stop(prepare: uv.uv_prepare_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the handle, the callback will no longer be called.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function prepare_stop(prepare:nvim.type.uv.UvPrepareT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.print_active_handles()
		```
		
		---
		
		 The same as `uv.print_all_handles()` except only active handles are printed.
		
		 **Note:** This is not available on Windows.
		
		 **Warning:** This function is meant for ad hoc debugging, there are no API/ABI
		 stability guarantees.
	**/
	@:luaDotMethod
	function print_active_handles():Dynamic;
	/**
		```lua
		function uv.print_all_handles()
		```
		
		---
		
		 Prints all handles associated with the main loop to stderr. The format is
		 `[flags] handle-type handle-address`. Flags are `R` for referenced, `A` for
		 active and `I` for internal.
		
		 **Note:** This is not available on Windows.
		
		 **Warning:** This function is meant for ad hoc debugging, there are no API/ABI
		 stability guarantees.
	**/
	@:luaDotMethod
	function print_all_handles():Dynamic;
	/**
		```lua
		function uv.process_get_pid(process: uv.uv_process_t)
		  -> pid: integer
		```
		
		---
		
		 Returns the handle's pid.
	**/
	@:luaDotMethod
	function process_get_pid(process:nvim.type.uv.UvProcessT):Int;
	/**
		```lua
		function uv.process_kill(process: uv.uv_process_t, signum: string|integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Sends the specified signal to the given process handle. Check the documentation
		 on `uv_signal_t` for signal support, specially on Windows.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function process_kill(process:nvim.type.uv.UvProcessT, signum:haxe.extern.EitherType<Int, String>):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.queue_work(work_ctx: uv.luv_work_ctx_t, ...any)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Queues a work request which will run `work_callback` in a new Lua state in a
		 thread from the threadpool with any additional arguments from `...`. Values
		 returned from `work_callback` are passed to `after_work_callback`, which is
		 called in the main loop thread.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function queue_work(work_ctx:nvim.type.uv.LuvWorkCtxT, ___:haxe.Rest<nvim.type.uv.Threadargs>):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.random(len: integer, flags?: table|0)
		  -> bytes: string|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Fills a string of length `len` with cryptographically strong random bytes
		 acquired from the system CSPRNG. `flags` is reserved for future extension
		 and must currently be `nil` or `0` or `{}`.
		
		 Short reads are not possible. When less than `len` random bytes are available,
		 a non-zero error value is returned or passed to the callback. If the callback
		 is omitted, this function is completed synchronously.
		
		 The synchronous version may block indefinitely when not enough entropy is
		 available. The asynchronous version may not ever finish when the system is
		 low on entropy.
		
		 **Returns (sync version):** `string` or `fail`
		
		 **Returns (async version):** `0` or `fail`
		
		
		
		---
		
		```lua
		flags:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.random(len: integer, flags?: nil, callback: fun(err: string|nil, bytes?: string))
		  -> 0|nil
		  2. string?
		  3. string?
		```
	**/
	@:luaDotMethod
	@:overload(function (len:Int, flags:Void, callback:nvim.type.uv.random.Callback) : nvim.helper.Multireturn<Null<Float>, Null<String>, Null<String>, Void, Void, Void> {})
	function random(len:Int, ?flags:Null<haxe.extern.EitherType<Float, lua.Table.AnyTable>>):nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.read_start(stream: uv.uv_stream_t, callback: fun(err: string|nil, data?: string))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Read data from an incoming stream. The callback will be made several times until
		 there is no more data to read or `uv.read_stop()` is called. When we've reached
		 EOF, `data` will be `nil`.
		
		 ```lua
		 stream:read_start(function (err, chunk)
		   if err then
		     -- handle read error
		   elseif chunk then
		     -- handle data
		   else
		     -- handle disconnect
		   end
		 end)
		 ```
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function read_start(stream:nvim.type.uv.UvStreamT, callback:nvim.type.uv.read_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.read_stop(stream: uv.uv_stream_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop reading data from the stream. The read callback will no longer be called.
		
		 This function is idempotent and may be safely called on a stopped stream.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function read_stop(stream:nvim.type.uv.UvStreamT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.recv_buffer_size(handle: uv.uv_handle_t, size?: integer)
		  -> size_or_ok: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Gets or sets the size of the receive buffer that the operating system uses for
		 the socket.
		
		 If `size` is omitted (or `0`), this will return the current send buffer size; otherwise, this will use `size` to set the new send buffer size.
		
		 This function works for TCP, pipe and UDP handles on Unix and for TCP and UDP
		 handles on Windows.
		
		 **Note**: Linux will set double the size and return double the size of the
		 original set value.
		
		@*param* `size` — default is `0`
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function recv_buffer_size(handle:nvim.type.uv.UvHandleT, ?size:Int):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.ref(handle: uv.uv_handle_t)
		```
		
		---
		
		 Reference the given handle. References are idempotent, that is, if a handle is
		 already referenced calling this function again will have no effect.
		
		 See [Reference counting][].
	**/
	@:luaDotMethod
	function ref(handle:nvim.type.uv.UvHandleT):Dynamic;
	/**
		```lua
		function uv.req_get_type(req: uv.uv_req_t)
		  -> type: "check"|"fs_event"|"fs_poll"|"handle"|"idle"|"pipe"|"poll"|"prepare"|"process"|"req"|"signal"|"stream"|"tcp"|"timer"|"tty"|"udp"
		  2. enum: integer
		```
		
		---
		
		 Returns the name of the struct for a given request (e.g. `"fs"` for `uv_fs_t`)
		 and the libuv enum integer for the request's type (`uv_req_type`).
		
		
		```lua
		--  The name of the struct for a given request (e.g. `"fs"` for `uv_fs_t`)
		--  and the libuv enum integer for the request's type (`uv_req_type`).
		-- 
		type:
		    | "check"
		    | "fs_event"
		    | "fs_poll"
		    | "handle"
		    | "idle"
		    | "pipe"
		    | "poll"
		    | "prepare"
		    | "process"
		    | "req"
		    | "signal"
		    | "stream"
		    | "tcp"
		    | "timer"
		    | "tty"
		    | "udp"
		```
	**/
	@:luaDotMethod
	function req_get_type(req:nvim.type.uv.UvReqT):nvim.helper.Multireturn<nvim.type.uv.req_type.Name, nvim.type.uv.req_type.Enum, Void, Void, Void, Void>;
	/**
		```lua
		function uv.resident_set_memory()
		  -> rss: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the resident set size (RSS) for the current process.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function resident_set_memory():nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.run(mode?: "default"|"nowait"|"once")
		  -> boolean
		```
		
		---
		
		 This function runs the event loop. It will act differently depending on the
		 specified mode:
		
		   - `"default"`: Runs the event loop until there are no more active and
		   referenced handles or requests. Returns `true` if `uv.stop()` was called and
		   there are still active handles or requests. Returns `false` in all other
		   cases.
		
		   - `"once"`: Poll for I/O once. Note that this function blocks if there are no
		   pending callbacks. Returns `false` when done (no active handles or requests
		   left), or `true` if more callbacks are expected (meaning you should run the
		   event loop again sometime in the future).
		
		   - `"nowait"`: Poll for I/O once but don't block if there are no pending
		   callbacks. Returns `false` if done (no active handles or requests left),
		   or `true` if more callbacks are expected (meaning you should run the event
		   loop again sometime in the future).
		
		 **Note:** Luvit will implicitly call `uv.run()` after loading user code, but if
		 you use the luv bindings directly, you need to call this after registering
		 your initial set of event callbacks to start the event loop.
		
		
		```lua
		--  uv.run() modes:
		-- 
		--    - `"default"`: Runs the event loop until there are no more active and
		--    referenced handles or requests. Returns `true` if `uv.stop()` was called and
		--    there are still active handles or requests. Returns `false` in all other
		--    cases.
		-- 
		--    - `"once"`: Poll for I/O once. Note that this function blocks if there are no
		--    pending callbacks. Returns `false` when done (no active handles or requests
		--    left), or `true` if more callbacks are expected (meaning you should run the
		--    event loop again sometime in the future).
		-- 
		--    - `"nowait"`: Poll for I/O once but don't block if there are no pending
		--    callbacks. Returns `false` if done (no active handles or requests left),
		--    or `true` if more callbacks are expected (meaning you should run the event
		--    loop again sometime in the future).
		-- 
		mode:
		    | "default" -- Runs the event loop until there are no more active and referenced handles or requests.
		    | "once" -- Poll for I/O once.
		    | "nowait" -- Poll for I/O once but don't block if there are no pending callbacks.
		```
	**/
	@:luaDotMethod
	function run(?mode:nvim.type.uv.run.Mode):Bool;
	/**
		```lua
		function uv.send_buffer_size(handle: uv.uv_handle_t, size?: integer|0)
		  -> success: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Gets or sets the size of the send buffer that the operating system uses for the
		 socket.
		
		 If `size` is omitted (or `0`), this will return the current send buffer size; otherwise, this will use `size` to set the new send buffer size.
		
		 This function works for TCP, pipe and UDP handles on Unix and for TCP and UDP
		 handles on Windows.
		
		 **Returns:**
		 - `integer` or `fail` (if `size` is `nil` or `0`)
		 - `0` or `fail` (if `size` is not `nil` and not `0`)
		
		 **Note**: Linux will set double the size and return double the size of the
		 original set value.
		
		
		
		---
		
		```lua
		size:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
		
		---
		
		```lua
		function uv.send_buffer_size(handle: uv.uv_handle_t)
		  -> size: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		```lua
		function uv.send_buffer_size(handle: uv.uv_handle_t, size: 0)
		  -> size: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
	**/
	@:luaDotMethod
	function send_buffer_size(handle:nvim.type.uv.UvHandleT, ?size:haxe.extern.EitherType<Int, Float>):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.set_process_title(title: string)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Sets the title of the current process with the string `title`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function set_process_title(title:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.setgid(id: integer)
		```
		
		---
		
		 Sets the group ID of the process with the integer `id`.
		
		 **Note:** This is not a libuv function and is not supported on Windows.
	**/
	@:luaDotMethod
	function setgid(id:Int):Dynamic;
	/**
		```lua
		function uv.setuid(id: integer)
		```
		
		---
		
		 Sets the user ID of the process with the integer `id`.
		
		 **Note:** This is not a libuv function and is not supported on Windows.
	**/
	@:luaDotMethod
	function setuid(id:Int):Dynamic;
	/**
		```lua
		function uv.shutdown(stream: uv.uv_stream_t, callback?: fun(err: string|nil))
		  -> shutdown: uv.uv_shutdown_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Shutdown the outgoing (write) side of a duplex stream. It waits for pending
		 write requests to complete. The callback is called after shutdown is complete.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function shutdown(stream:nvim.type.uv.UvStreamT, ?callback:nvim.type.uv.shutdown.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvShutdownT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.signal_start(signal: uv.uv_signal_t, signum: string|integer, callback: fun(signum: string))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start the handle with the given callback, watching for the given signal.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function signal_start(signal:nvim.type.uv.UvSignalT, signum:haxe.extern.EitherType<Int, String>, callback:nvim.type.uv.signal_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.signal_start_oneshot(signal: uv.uv_signal_t, signum: string|integer, callback: fun(signum: string))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Same functionality as `uv.signal_start()` but the signal handler is reset the moment the signal is received.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function signal_start_oneshot(signal:nvim.type.uv.UvSignalT, signum:haxe.extern.EitherType<Int, String>, callback:nvim.type.uv.signal_start_oneshot.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.signal_stop(signal: uv.uv_signal_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the handle, the callback will no longer be called.
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function signal_stop(signal:nvim.type.uv.UvSignalT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.sleep(msec: integer)
		```
		
		---
		
		 Pauses the thread in which this is called for a number of milliseconds.
	**/
	@:luaDotMethod
	function sleep(msec:Int):Dynamic;
	/**
		```lua
		function uv.socketpair(socktype?: integer|"dgram"|"raw"|"rdm"|"seqpacket"|"stream", protocol?: string|"icmp"|"ip"|"tcp"|"udp"|0, flags1?: uv.socketpair.flags, flags2?: uv.socketpair.flags)
		  -> fds: { [1]: integer, [2]: integer }|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Create a pair of connected sockets with the specified properties. The resulting handles can be passed to `uv.tcp_open`, used with `uv.spawn`, or for any other purpose.
		
		 When specified as a string, `socktype` must be one of `"stream"`, `"dgram"`, `"raw"`,
		 `"rdm"`, or `"seqpacket"`.
		
		 When `protocol` is set to 0 or nil, it will be automatically chosen based on the socket's domain and type. When `protocol` is specified as a string, it will be looked up using the `getprotobyname(3)` function (examples: `"ip"`, `"icmp"`, `"tcp"`, `"udp"`, etc).
		
		 Flags:
		  - `nonblock`: Opens the specified socket handle for `OVERLAPPED` or `FIONBIO`/`O_NONBLOCK` I/O usage. This is recommended for handles that will be used by libuv, and not usually recommended otherwise.
		
		 Equivalent to `socketpair(2)` with a domain of `AF_UNIX`.
		
		 **Returns:** `table` or `fail`
		 - `[1, 2]` : `integer` (file descriptor)
		
		 ```lua
		 -- Simple read/write with tcp
		 local fds = uv.socketpair(nil, nil, {nonblock=true}, {nonblock=true})
		
		 local sock1 = uv.new_tcp()
		 sock1:open(fds[1])
		
		 local sock2 = uv.new_tcp()
		 sock2:open(fds[2])
		
		 sock1:write("hello")
		 sock2:read_start(function(err, chunk)
		   assert(not err, err)
		   print(chunk)
		 end)
		 ```
		
		
		```lua
		socktype:
		    | "stream"
		    | "dgram"
		    | "raw"
		    | "rdm"
		    | "seqpacket"
		
		--  When `protocol` is set to 0 or nil, it will be automatically chosen based on the socket's domain and type.
		-- 
		--  When `protocol` is specified as a string, it will be looked up using the `getprotobyname(3)` function (examples: `"ip"`, `"icmp"`, `"tcp"`, `"udp"`, etc).
		-- 
		protocol:
		    | 0 -- automatically choose based on socket domain/type
		    | "ip"
		    | "icmp"
		    | "tcp"
		    | "udp"
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function socketpair(?socktype:nvim.type.uv.socketpair.Socktype, ?protocol:nvim.type.uv.socketpair.Protocol, ?flags1:nvim.type.uv.socketpair.Flags, ?flags2:nvim.type.uv.socketpair.Flags):nvim.helper.Multireturn<Null<nvim.type.uv.socketpair.Fds>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.spawn(path: string, options: uv.spawn.options, on_exit: fun(code: integer, signal: integer))
		  -> proc: uv.uv_process_t
		  2. pid: integer
		```
		
		---
		
		 Initializes the process handle and starts the process. If the process is
		 successfully spawned, this function will return the handle and pid of the child
		 process.
		
		 Possible reasons for failing to spawn would include (but not be limited to) the
		 file to execute not existing, not having permissions to use the setuid or setgid
		 specified, or not having enough memory to allocate for the new process.
		
		 ```lua
		 local stdin = uv.new_pipe()
		 local stdout = uv.new_pipe()
		 local stderr = uv.new_pipe()
		
		 print("stdin", stdin)
		 print("stdout", stdout)
		 print("stderr", stderr)
		
		 local handle, pid = uv.spawn("cat", {
		   stdio = {stdin, stdout, stderr}
		 }, function(code, signal) -- on exit
		   print("exit code", code)
		   print("exit signal", signal)
		 end)
		
		 print("process opened", handle, pid)
		
		 uv.read_start(stdout, function(err, data)
		   assert(not err, err)
		   if data then
		     print("stdout chunk", stdout, data)
		   else
		     print("stdout end", stdout)
		   end
		 end)
		
		 uv.read_start(stderr, function(err, data)
		   assert(not err, err)
		   if data then
		     print("stderr chunk", stderr, data)
		   else
		     print("stderr end", stderr)
		   end
		 end)
		
		 uv.write(stdin, "Hello World")
		
		 uv.shutdown(stdin, function()
		   print("stdin shutdown", stdin)
		   uv.close(handle, function()
		     print("process closed", handle, pid)
		   end)
		 end)
		 ```
		
		 The `options` table accepts the following fields:
		
		   - `options.args` - Command line arguments as a list of string. The first
		   string should be the path to the program. On Windows, this uses CreateProcess
		   which concatenates the arguments into a string. This can cause some strange
		   errors. (See `options.verbatim` below for Windows.)
		   - `options.stdio` - Set the file descriptors that will be made available to
		   the child process. The convention is that the first entries are stdin, stdout,
		   and stderr. (**Note**: On Windows, file descriptors after the third are
		   available to the child process only if the child processes uses the MSVCRT
		   runtime.)
		   - `options.env` - Set environment variables for the new process.
		   - `options.cwd` - Set the current working directory for the sub-process.
		   - `options.uid` - Set the child process' user id.
		   - `options.gid` - Set the child process' group id.
		   - `options.verbatim` - If true, do not wrap any arguments in quotes, or
		   perform any other escaping, when converting the argument list into a command
		   line string. This option is only meaningful on Windows systems. On Unix it is
		   silently ignored.
		   - `options.detached` - If true, spawn the child process in a detached state -
		   this will make it a process group leader, and will effectively enable the
		   child to keep running after the parent exits. Note that the child process
		   will still keep the parent's event loop alive unless the parent process calls
		   `uv.unref()` on the child's process handle.
		   - `options.hide` - If true, hide the subprocess console window that would
		   normally be created. This option is only meaningful on Windows systems. On
		   Unix it is silently ignored.
		
		 The `options.stdio` entries can take many shapes.
		
		   - If they are numbers, then the child process inherits that same zero-indexed
		   fd from the parent process.
		   - If `uv_stream_t` handles are passed in, those are used as a read-write pipe
		   or inherited stream depending if the stream has a valid fd.
		   - Including `nil` placeholders means to ignore that fd in the child process.
		
		 When the child process exits, `on_exit` is called with an exit code and signal.
	**/
	@:luaDotMethod
	function spawn(path:String, options:nvim.type.uv.spawn.Options, on_exit:nvim.type.uv.spawn.OnExit):nvim.helper.Multireturn<nvim.type.uv.UvProcessT, Int, Void, Void, Void, Void>;
	/**
		```lua
		function uv.stop()
		```
		
		---
		
		 Stop the event loop, causing `uv.run()` to end as soon as possible. This
		 will happen not sooner than the next loop iteration. If this function was called
		 before blocking for I/O, the loop won't block for I/O on this iteration.
	**/
	@:luaDotMethod
	function stop():Dynamic;
	/**
		```lua
		function uv.stream_get_write_queue_size(stream: uv.uv_stream_t)
		  -> integer
		```
		
		---
		
		 Returns the stream's write queue size.
	**/
	@:luaDotMethod
	function stream_get_write_queue_size(stream:nvim.type.uv.UvStreamT):Int;
	/**
		```lua
		function uv.stream_set_blocking(stream: uv.uv_stream_t, blocking: boolean)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Enable or disable blocking mode for a stream.
		
		 When blocking mode is enabled all writes complete synchronously. The interface
		 remains unchanged otherwise, e.g. completion or failure of the operation will
		 still be reported through a callback which is made asynchronously.
		
		 **Warning**: Relying too much on this API is not recommended. It is likely to
		 change significantly in the future. Currently this only works on Windows and
		 only for `uv_pipe_t` handles. Also libuv currently makes no ordering guarantee
		 when the blocking mode is changed after write requests have already been
		 submitted. Therefore it is recommended to set the blocking mode immediately
		 after opening or creating the stream.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function stream_set_blocking(stream:nvim.type.uv.UvStreamT, blocking:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_bind(tcp: uv.uv_tcp_t, host: string, port: integer, flags?: uv.tcp_bind.flags)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Bind the handle to an host and port. `host` should be an IP address and
		 not a domain name. Any `flags` are set with a table with field `ipv6only`
		 equal to `true` or `false`.
		
		 When the port is already taken, you can expect to see an `EADDRINUSE` error
		 from either `uv.tcp_bind()`, `uv.listen()` or `uv.tcp_connect()`. That is, a
		 successful call to this function does not guarantee that the call to `uv.listen()`
		 or `uv.tcp_connect()` will succeed as well.
		
		 Use a port of `0` to let the OS assign an ephemeral port.  You can look it up
		 later using `uv.tcp_getsockname()`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_bind(tcp:nvim.type.uv.UvTcpT, host:String, port:Int, ?flags:nvim.type.uv.tcp_bind.Flags):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_close_reset(tcp: uv.uv_tcp_t, callback?: function)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Resets a TCP connection by sending a RST packet. This is accomplished by setting
		 the SO_LINGER socket option with a linger interval of zero and then calling
		 `uv.close()`. Due to some platform inconsistencies, mixing of `uv.shutdown()`
		 and `uv.tcp_close_reset()` calls is not allowed.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_close_reset(tcp:nvim.type.uv.UvTcpT, ?callback:haxe.Constraints.Function):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_connect(tcp: uv.uv_tcp_t, host: string, port: integer, callback: fun(err: string|nil))
		  -> conn: uv.uv_connect_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Establish an IPv4 or IPv6 TCP connection.
		
		 ```lua
		 local client = uv.new_tcp()
		 client:connect("127.0.0.1", 8080, function (err)
		   -- check error and carry on.
		 end)
		 ```
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_connect(tcp:nvim.type.uv.UvTcpT, host:String, port:Int, callback:nvim.type.uv.tcp_connect.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvConnectT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_getpeername(tcp: uv.uv_tcp_t)
		  -> sockname: uv.socketinfo|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the address of the peer connected to the handle.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_getpeername(tcp:nvim.type.uv.UvTcpT):nvim.helper.Multireturn<Null<nvim.type.uv.Socketinfo>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_getsockname(tcp: uv.uv_tcp_t)
		  -> sockname: uv.socketinfo|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the current address to which the handle is bound.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_getsockname(tcp:nvim.type.uv.UvTcpT):nvim.helper.Multireturn<Null<nvim.type.uv.Socketinfo>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_keepalive(tcp: uv.uv_tcp_t, enable: boolean, delay?: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Enable / disable TCP keep-alive. `delay` is the initial delay in seconds,
		 ignored when enable is `false`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_keepalive(tcp:nvim.type.uv.UvTcpT, enable:Bool, ?delay:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_nodelay(tcp: uv.uv_tcp_t, enable: boolean)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Enable / disable Nagle's algorithm.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_nodelay(tcp:nvim.type.uv.UvTcpT, enable:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_open(tcp: uv.uv_tcp_t, sock: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Open an existing file descriptor or SOCKET as a TCP handle.
		
		 **Note:** The passed file descriptor or SOCKET is not checked for its type, but it's required that it represents a valid stream socket.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_open(tcp:nvim.type.uv.UvTcpT, sock:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_simultaneous_accepts(tcp: uv.uv_tcp_t, enable: boolean)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Enable / disable simultaneous asynchronous accept requests that are queued by
		 the operating system when listening for new TCP connections.
		
		 This setting is used to tune a TCP server for the desired performance. Having
		 simultaneous accepts can significantly improve the rate of accepting connections
		 (which is why it is enabled by default) but may lead to uneven load distribution
		 in multi-process setups.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tcp_simultaneous_accepts(tcp:nvim.type.uv.UvTcpT, enable:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tcp_write_queue_size(tcp: uv.uv_tcp_t)
		```
		
		---
		
		 **Deprecated:** Please use `uv.stream_get_write_queue_size()` instead.
	**/
	@:luaDotMethod
	function tcp_write_queue_size(tcp:nvim.type.uv.UvTcpT):Dynamic;
	/**
		```lua
		function uv.thread_equal(thread: uv.luv_thread_t, other_thread: uv.luv_thread_t)
		  -> equal: boolean
		```
		
		---
		
		 Returns a boolean indicating whether two threads are the same. This function is
		 equivalent to the `__eq` metamethod.
	**/
	@:luaDotMethod
	function thread_equal(thread:nvim.type.uv.LuvThreadT, other_thread:nvim.type.uv.LuvThreadT):Bool;
	/**
		```lua
		function uv.thread_join(thread: uv.luv_thread_t)
		  -> success: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Waits for the `thread` to finish executing its entry function.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function thread_join(thread:nvim.type.uv.LuvThreadT):nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.thread_self()
		  -> uv.luv_thread_t
		```
		
		---
		
		 Returns the handle for the thread in which this is called.
	**/
	@:luaDotMethod
	function thread_self():nvim.type.uv.LuvThreadT;
	/**
		```lua
		function uv.timer_again(timer: uv.uv_timer_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the timer, and if it is repeating restart it using the repeat value as the
		 timeout. If the timer has never been started before it raises `EINVAL`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function timer_again(timer:nvim.type.uv.UvTimerT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.timer_get_due_in(timer: uv.uv_timer_t)
		  -> integer
		```
		
		---
		
		 Get the timer due value or 0 if it has expired. The time is relative to `uv.now()`.
		
		 **Note**: New in libuv version 1.40.0.
	**/
	@:luaDotMethod
	function timer_get_due_in(timer:nvim.type.uv.UvTimerT):Int;
	/**
		```lua
		function uv.timer_get_repeat(timer: uv.uv_timer_t)
		  -> integer
		```
		
		---
		
		 Get the timer repeat value.
	**/
	@:luaDotMethod
	function timer_get_repeat(timer:nvim.type.uv.UvTimerT):Int;
	/**
		```lua
		function uv.timer_set_repeat(timer: uv.uv_timer_t, repeat_: integer)
		```
		
		---
		
		 Set the repeat interval value in milliseconds. The timer will be scheduled to
		 run on the given interval, regardless of the callback execution duration, and
		 will follow normal timer semantics in the case of a time-slice overrun.
		
		 For example, if a 50 ms repeating timer first runs for 17 ms, it will be
		 scheduled to run again 33 ms later. If other tasks consume more than the 33 ms
		 following the first timer callback, then the callback will run as soon as
		 possible.
	**/
	@:luaDotMethod
	function timer_set_repeat(timer:nvim.type.uv.UvTimerT, repeat_:Int):Dynamic;
	/**
		```lua
		function uv.timer_start(timer: uv.uv_timer_t, timeout: integer, repeat_: integer, callback: function)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start the timer. `timeout` and `repeat` are in milliseconds.
		
		 If `timeout` is zero, the callback fires on the next event loop iteration. If
		 `repeat` is non-zero, the callback fires first after `timeout` milliseconds and
		 then repeatedly after `repeat` milliseconds.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function timer_start(timer:nvim.type.uv.UvTimerT, timeout:Int, repeat_:Int, callback:haxe.Constraints.Function):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.timer_stop(timer: uv.uv_timer_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop the timer, the callback will not be called anymore.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function timer_stop(timer:nvim.type.uv.UvTimerT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.translate_sys_error(errcode: integer)
		  -> err: string|nil
		  2. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the libuv error message and error name (both in string form, see [`err` and `name` in Error Handling](file:///root/external/lua-language-server/meta/3rd/luv/library/%23error-handling)) equivalent to the given platform dependent error code: POSIX error codes on Unix (the ones stored in errno), and Win32 error codes on Windows (those returned by GetLastError() or WSAGetLastError()).
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function translate_sys_error(errcode:Int):nvim.helper.Multireturn<Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void, Void>;
	/**
		```lua
		function uv.try_write(stream: uv.uv_stream_t, data: string|string[])
		  -> bytes: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Same as `uv.write()`, but won't queue a write request if it can't be completed
		 immediately.
		
		 Will return number of bytes written (can be less than the supplied buffer size).
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function try_write(stream:nvim.type.uv.UvStreamT, data:nvim.type.uv.Buffer):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.try_write2(stream: uv.uv_stream_t, data: string|string[], send_handle: uv.uv_stream_t)
		  -> bytes: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Like `uv.write2()`, but with the properties of `uv.try_write()`. Not supported on Windows, where it returns `UV_EAGAIN`.
		
		 Will return number of bytes written (can be less than the supplied buffer size).
		
		 **Returns:** `integer` or `fail`
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function try_write2(stream:nvim.type.uv.UvStreamT, data:nvim.type.uv.Buffer, send_handle:nvim.type.uv.UvStreamT):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tty_get_vterm_state()
		  -> state: "supported"|"unsupported"|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the current state of whether console virtual terminal sequences are handled
		 by libuv or the console. The return value is `"supported"` or `"unsupported"`.
		
		 This function is not implemented on Unix, where it returns `ENOTSUP`.
		
		
		```lua
		state:
		    | "supported"
		    | "unsupported"
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tty_get_vterm_state():nvim.helper.Multireturn<Null<String>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tty_get_winsize(tty: uv.uv_tty_t)
		  -> width: integer|nil
		  2. height_or_errmsg: string|integer
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Gets the current Window width and height.
		
		 **Returns:** `integer, integer` or `fail`
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tty_get_winsize(tty:nvim.type.uv.UvTtyT):nvim.helper.Multireturn<Null<Int>, haxe.extern.EitherType<Int, String>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tty_reset_mode()
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 To be called when the program exits. Resets TTY settings to default values for
		 the next process to take over.
		
		 This function is async signal-safe on Unix platforms but can fail with error
		 code `EBUSY` if you call it when execution is inside `uv.tty_set_mode()`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tty_reset_mode():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tty_set_mode(tty: uv.uv_tty_t, mode: 0|1|2)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the TTY using the specified terminal mode.
		
		 Parameter `mode` is a C enum with the following values:
		
		   - 0 - UV_TTY_MODE_NORMAL: Initial/normal terminal mode
		   - 1 - UV_TTY_MODE_RAW: Raw input mode (On Windows, ENABLE_WINDOW_INPUT is
		   also enabled)
		   - 2 - UV_TTY_MODE_IO: Binary-safe I/O mode for IPC (Unix-only)
		
		
		```lua
		--  TTY mode is a C enum with the following values:
		-- 
		mode:
		    | 0 -- UV_TTY_MODE_NORMAL: Initial/normal terminal mode
		    | 1 -- UV_TTY_MODE_RAW: Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled)
		    | 2 -- UV_TTY_MODE_IO: Binary-safe I/O mode for IPC (Unix-only)
		
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function tty_set_mode(tty:nvim.type.uv.UvTtyT, mode:nvim.type.uv.tty.Mode):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.tty_set_vterm_state(state: "supported"|"unsupported")
		```
		
		---
		
		 Controls whether console virtual terminal sequences are processed by libuv or
		 console. Useful in particular for enabling ConEmu support of ANSI X3.64 and
		 Xterm 256 colors. Otherwise Windows10 consoles are usually detected
		 automatically. State should be one of: `"supported"` or `"unsupported"`.
		
		 This function is only meaningful on Windows systems. On Unix it is silently
		 ignored.
		
		
		```lua
		state:
		    | "supported"
		    | "unsupported"
		```
	**/
	@:luaDotMethod
	function tty_set_vterm_state(state:String):Dynamic;
	/**
		```lua
		function uv.udp_bind(udp: uv.uv_udp_t, host: string, port: integer, flags?: uv.udp_bind.flags)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Bind the UDP handle to an IP address and port. Any `flags` are set with a table
		 with fields `reuseaddr` or `ipv6only` equal to `true` or `false`.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_bind(udp:nvim.type.uv.UvUdpT, host:String, port:Int, ?flags:nvim.type.uv.udp_bind.Flags):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_connect(udp: uv.uv_udp_t, host: string, port: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Associate the UDP handle to a remote address and port, so every message sent by
		 this handle is automatically sent to that destination. Calling this function
		 with a NULL addr disconnects the handle. Trying to call `uv.udp_connect()` on an
		 already connected handle will result in an `EISCONN` error. Trying to disconnect
		 a handle that is not connected will return an `ENOTCONN` error.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_connect(udp:nvim.type.uv.UvUdpT, host:String, port:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_get_send_queue_count(udp: uv.uv_udp_t)
		  -> count: integer
		```
		
		---
		
		 Returns the handle's send queue count.
	**/
	@:luaDotMethod
	function udp_get_send_queue_count(udp:nvim.type.uv.UvUdpT):Int;
	/**
		```lua
		function uv.udp_get_send_queue_size(udp: uv.uv_udp_t)
		  -> size: integer
		```
		
		---
		
		 Returns the handle's send queue size.
	**/
	@:luaDotMethod
	function udp_get_send_queue_size(udp:nvim.type.uv.UvUdpT):Int;
	/**
		```lua
		function uv.udp_getpeername(udp: uv.uv_udp_t)
		  -> peername: uv.socketinfo|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the remote IP and port of the UDP handle on connected UDP handles.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_getpeername(udp:nvim.type.uv.UvUdpT):nvim.helper.Multireturn<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_getsockname(udp: uv.uv_udp_t)
		  -> sockname: uv.socketinfo|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Get the local IP and port of the UDP handle.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_getsockname(udp:nvim.type.uv.UvUdpT):nvim.helper.Multireturn<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_open(udp: uv.uv_udp_t, fd: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Opens an existing file descriptor or Windows SOCKET as a UDP handle.
		
		 Unix only: The only requirement of the sock argument is that it follows the
		 datagram contract (works in unconnected mode, supports sendmsg()/recvmsg(),
		 etc). In other words, other datagram-type sockets like raw sockets or netlink
		 sockets can also be passed to this function.
		
		 The file descriptor is set to non-blocking mode.
		
		 Note: The passed file descriptor or SOCKET is not checked for its type, but
		 it's required that it represents a valid datagram socket.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_open(udp:nvim.type.uv.UvUdpT, fd:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_recv_start(udp: uv.uv_udp_t, callback: fun(err: string|nil, data: string|nil, addr: uv.udp_recv_start.callback.addr|nil, flags: uv.udp_recv_start.callback.flags))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Prepare for receiving data. If the socket has not previously been bound with
		 `uv.udp_bind()` it is bound to `0.0.0.0` (the "all interfaces" IPv4 address)
		 and a random port number.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_recv_start(udp:nvim.type.uv.UvUdpT, callback:nvim.type.uv.udp_recv_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_recv_stop(udp: uv.uv_udp_t)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop listening for incoming datagrams.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_recv_stop(udp:nvim.type.uv.UvUdpT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_send(udp: uv.uv_udp_t, data: string|string[], host: string, port: integer, callback: fun(err: string|nil))
		  -> success: uv.uv_udp_send_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Send data over the UDP socket. If the socket has not previously been bound
		 with `uv.udp_bind()` it will be bound to `0.0.0.0` (the "all interfaces" IPv4
		 address) and a random port number.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_send(udp:nvim.type.uv.UvUdpT, data:nvim.type.uv.Buffer, host:String, port:Int, callback:nvim.type.uv.udp_send.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvUdpSendT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_broadcast(udp: uv.uv_udp_t, on: boolean)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set broadcast on or off.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_broadcast(udp:nvim.type.uv.UvUdpT, on:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_membership(udp: uv.uv_udp_t, multicast_addr: string, interface_addr: string, membership: "join"|"leave")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set membership for a multicast address. `multicast_addr` is multicast address to
		 set membership for. `interface_addr` is interface address. `membership` can be
		 the string `"leave"` or `"join"`.
		
		
		```lua
		membership:
		    | "leave"
		    | "join"
		
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_membership(udp:nvim.type.uv.UvUdpT, multicast_addr:String, interface_addr:String, membership:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_multicast_interface(udp: uv.uv_udp_t, interface_addr: string)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the multicast interface to send or receive data on.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_multicast_interface(udp:nvim.type.uv.UvUdpT, interface_addr:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_multicast_loop(udp: uv.uv_udp_t, on: boolean)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set IP multicast loop flag. Makes multicast packets loop back to local
		 sockets.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_multicast_loop(udp:nvim.type.uv.UvUdpT, on:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_multicast_ttl(udp: uv.uv_udp_t, ttl: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the multicast ttl.
		
		 `ttl` is an integer 1 through 255.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_multicast_ttl(udp:nvim.type.uv.UvUdpT, ttl:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_source_membership(udp: uv.uv_udp_t, multicast_addr: string, interface_addr: string|nil, source_addr: string, membership: "join"|"leave")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set membership for a source-specific multicast group. `multicast_addr` is multicast
		 address to set membership for. `interface_addr` is interface address. `source_addr`
		 is source address. `membership` can be the string `"leave"` or `"join"`.
		
		
		```lua
		membership:
		    | "leave"
		    | "join"
		
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_source_membership(udp:nvim.type.uv.UvUdpT, multicast_addr:String, interface_addr:Null<String>, source_addr:String, membership:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_set_ttl(udp: uv.uv_udp_t, ttl: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the time to live.
		
		 `ttl` is an integer 1 through 255.
		
		
		```lua
		success:
		    | 0
		
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_set_ttl(udp:nvim.type.uv.UvUdpT, ttl:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.udp_try_send(udp: uv.uv_udp_t, data: string|string[], host: string, port: integer)
		  -> success: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Same as `uv.udp_send()`, but won't queue a send request if it can't be
		 completed immediately.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function udp_try_send(udp:nvim.type.uv.UvUdpT, data:nvim.type.uv.Buffer, host:String, port:Int):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.unref(handle: uv.uv_handle_t)
		```
		
		---
		
		 Un-reference the given handle. References are idempotent, that is, if a handle
		 is not referenced calling this function again will have no effect.
		
		 See [Reference counting][].
	**/
	@:luaDotMethod
	function unref(handle:nvim.type.uv.UvHandleT):Dynamic;
	/**
		```lua
		function uv.update_time()
		```
		
		---
		
		 Update the event loop's concept of "now". Libuv caches the current time at the
		 start of the event loop tick in order to reduce the number of time-related
		 system calls.
		
		 You won't normally need to call this function unless you have callbacks that
		 block the event loop for longer periods of time, where "longer" is somewhat
		 subjective but probably on the order of a millisecond or more.
	**/
	@:luaDotMethod
	function update_time():Dynamic;
	/**
		```lua
		function uv.uptime()
		  -> success: number|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns the current system uptime in seconds.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function uptime():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.version()
		  -> integer
		```
		
		---
		
		 Returns the libuv version packed into a single integer. 8 bits are used for each
		 component, with the patch number stored in the 8 least significant bits. For
		 example, this would be 0x010203 in libuv 1.2.3.
	**/
	@:luaDotMethod
	function version():Int;
	/**
		```lua
		function uv.version_string()
		  -> string
		```
		
		---
		
		 Returns the libuv version number as a string. For example, this would be "1.2.3"
		 in libuv 1.2.3. For non-release versions, the version suffix is included.
	**/
	@:luaDotMethod
	function version_string():String;
	/**
		```lua
		function uv.walk(callback: fun(handle: uv.uv_handle_t))
		```
		
		---
		
		 Walk the list of handles: `callback` will be executed with each handle.
		
		 ```lua
		 -- Example usage of uv.walk to close all handles that aren't already closing.
		 uv.walk(function (handle)
		   if not handle:is_closing() then
		     handle:close()
		   end
		 end)
		 ```
	**/
	@:luaDotMethod
	function walk(callback:nvim.type.uv.walk.Callback):Dynamic;
	/**
		```lua
		function uv.write(stream: uv.uv_stream_t, data: string|string[], callback?: fun(err: string|nil))
		  -> success: uv.uv_write_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Write data to stream.
		
		 `data` can either be a Lua string or a table of strings. If a table is passed
		 in, the C backend will use writev to send all strings in a single system call.
		
		 The optional `callback` is for knowing when the write is complete.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function write(stream:nvim.type.uv.UvStreamT, data:nvim.type.uv.Buffer, ?callback:nvim.type.uv.write.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvWriteT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		function uv.write2(stream: uv.uv_stream_t, data: string|string[], send_handle: uv.uv_stream_t, callback?: fun(err: string|nil))
		  -> success: uv.uv_write_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Extended write function for sending handles over a pipe. The pipe must be
		 initialized with `ipc` option `true`.
		
		 **Note:** `send_handle` must be a TCP socket or pipe, which is a server or a
		 connection (listening or connected state). Bound sockets or pipes will be
		 assumed to be servers.
		
		
		```lua
		--  An error name string
		-- 
		err_name:
		    | "E2BIG" -- argument list too long
		    | "EACCES" -- permission denied
		    | "EADDRINUSE" -- address already in use
		    | "EADDRNOTAVAIL" -- address not available
		    | "EAFNOSUPPORT" -- address family not supported
		    | "EAGAIN" -- resource temporarily unavailable
		    | "EAI_ADDRFAMILY" -- address family not supported
		    | "EAI_AGAIN" -- temporary failure
		    | "EAI_BADFLAGS" -- bad ai_flags value
		    | "EAI_BADHINTS" -- invalid value for hints
		    | "EAI_CANCELED" -- request canceled
		    | "EAI_FAIL" -- permanent failure
		    | "EAI_FAMILY" -- ai_family not supported
		    | "EAI_MEMORY" -- out of memory
		    | "EAI_NODATA" -- no address
		    | "EAI_NONAME" -- unknown node or service
		    | "EAI_OVERFLOW" -- argument buffer overflow
		    | "EAI_PROTOCOL" -- resolved protocol is unknown
		    | "EAI_SERVICE" -- service not available for socket type
		    | "EAI_SOCKTYPE" -- socket type not supported
		    | "EALREADY" -- connection already in progress
		    | "EBADF" -- bad file descriptor
		    | "EBUSY" -- resource busy or locked
		    | "ECANCELED" -- operation canceled
		    | "ECHARSET" -- invalid Unicode character
		    | "ECONNABORTED" -- software caused connection abort
		    | "ECONNREFUSED" -- connection refused
		    | "ECONNRESET" -- connection reset by peer
		    | "EDESTADDRREQ" -- destination address required
		    | "EEXIST" -- file already exists
		    | "EFAULT" -- bad address in system call argument
		    | "EFBIG" -- file too large
		    | "EFTYPE" -- inappropriate file type or format
		    | "EHOSTUNREACH" -- host is unreachable
		    | "EILSEQ" -- illegal byte sequence
		    | "EINTR" -- interrupted system call
		    | "EINVAL" -- invalid argument
		    | "EIO" -- i/o error
		    | "EISCONN" -- socket is already connected
		    | "EISDIR" -- illegal operation on a directory
		    | "ELOOP" -- too many symbolic links encountered
		    | "EMFILE" -- too many open files
		    | "EMLINK" -- too many links
		    | "EMSGSIZE" -- message too long
		    | "ENAMETOOLONG" -- name too long
		    | "ENETDOWN" -- network is down
		    | "ENETUNREACH" -- network is unreachable
		    | "ENFILE" -- file table overflow
		    | "ENOBUFS" -- no buffer space available
		    | "ENODEV" -- no such device
		    | "ENOENT" -- no such file or directory
		    | "ENOMEM" -- not enough memory
		    | "ENONET" -- machine is not on the network
		    | "ENOPROTOOPT" -- protocol not available
		    | "ENOSPC" -- no space left on device
		    | "ENOSYS" -- function not implemented
		    | "ENOTCONN" -- socket is not connected
		    | "ENOTDIR" -- not a directory
		    | "ENOTEMPTY" -- directory not empty
		    | "ENOTSOCK" -- socket operation on non-socket
		    | "ENOTSUP" -- operation not supported on socket
		    | "ENOTTY" -- inappropriate ioctl for device
		    | "ENXIO" -- no such device or address
		    | "EOF" -- end of file
		    | "EOVERFLOW" -- value too large for defined data type
		    | "EPERM" -- operation not permitted
		    | "EPIPE" -- broken pipe
		    | "EPROTO" -- protocol error
		    | "EPROTONOSUPPORT" -- protocol not supported
		    | "EPROTOTYPE" -- protocol wrong type for socket
		    | "ERANGE" -- result too large
		    | "EROFS" -- read-only file system
		    | "ESHUTDOWN" -- cannot send after transport endpoint shutdown
		    | "ESOCKTNOSUPPORT" -- socket type not supported
		    | "ESPIPE" -- invalid seek
		    | "ESRCH" -- no such process
		    | "ETIMEDOUT" -- connection timed out
		    | "ETXTBSY" -- text file is busy
		    | "EXDEV" -- cross-device link not permitted
		    | "UNKNOWN" -- unknown error
		```
	**/
	@:luaDotMethod
	function write2(stream:nvim.type.uv.UvStreamT, data:nvim.type.uv.Buffer, send_handle:nvim.type.uv.UvStreamT, ?callback:nvim.type.uv.write2.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvWriteT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
}