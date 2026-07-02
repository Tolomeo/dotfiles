package nvim.type.uv;

/**
	```lua
	(class) uv.uv_poll_t
	```
	
	---
	
	 Poll handles are used to watch file descriptors for readability and writability,
	 similar to the purpose of [poll(2)](http://linux.die.net/man/2/poll).
	
	 The purpose of poll handles is to enable integrating external libraries that
	 rely on the event loop to signal it about the socket status changes, like c-ares
	 or libssh2. Using `uv_poll_t` for any other purpose is not recommended;
	 `uv_tcp_t`, `uv_udp_t`, etc. provide an implementation that is faster and more
	 scalable than what can be achieved with `uv_poll_t`, especially on Windows.
	
	 It is possible that poll handles occasionally signal that a file descriptor is
	 readable or writable even when it isn't. The user should therefore always be
	 prepared to handle EAGAIN or equivalent when it attempts to read from or write
	 to the fd.
	
	 It is not okay to have multiple active poll handles for the same socket, this
	 can cause libuv to busyloop or otherwise malfunction.
	
	 The user should not close a file descriptor while it is being polled by an
	 active poll handle. This can cause the handle to report an error, but it might
	 also start polling another socket. However the fd can be safely closed
	 immediately after a call to `poll:stop()` or `uv.close()`.
	
	 **Note**: On windows only sockets can be polled with poll handles. On Unix any
	 file descriptor that would be accepted by poll(2) can be used.
	
**/
@:structInit class UvPollT {
	/**
		```lua
		(method) uv.uv_handle_t:close(callback?: function)
		```
		
		---
		
		 Request handle to be closed.
		
		 The `callback` will be called asynchronously after this call.
		
		 This MUST be called on each handle before memory is released.
		
		 Handles that wrap file descriptors are closed immediately but `callback` will
		 still be deferred to the next iteration of the event loop. It gives you a chance
		 to free up any resources associated with the handle.
		
		 In-progress requests, like `uv_connect_t` or `uv_write_t`, are cancelled and
		 have their callbacks called asynchronously with `ECANCELED`.
	**/
	extern public function close(?callback:haxe.Constraints.Function):Dynamic;
	@:native("fileno")
	private extern function __fileno():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:fileno()
		  -> fileno: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Gets the platform dependent file descriptor equivalent.
		
		 The following handles are supported: TCP, pipes, TTY, UDP and poll. Calling
		 this method on other handle type will fail with `EINVAL`.
		
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
	inline public function fileno():nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __fileno();
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	@:native("get_type")
	private extern function __get_type():nvim.helper.Multireturn<String, Float, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:get_type()
		  -> type: string
		  2. enum: integer
		```
		
		---
		
		 Returns the name of the struct for a given handle (e.g. `"pipe"` for `uv_pipe_t`)
		 and the libuv enum integer for the handle's type (`uv_handle_type`).
	**/
	inline public function get_type():nvim.helper.Multireturn.Return2<String, Float> {
		final result = __get_type();
		return new nvim.helper.Multireturn.Return2<String, Float>(result._0, result._1);
	}
	@:native("has_ref")
	private extern function __has_ref():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:has_ref()
		  -> has_ref: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns `true` if the handle referenced, `false` if not.
		
		
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
	inline public function has_ref():nvim.helper.Multireturn.Return3<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __has_ref();
		return new nvim.helper.Multireturn.Return3<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	@:native("is_active")
	private extern function __is_active():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:is_active()
		  -> active: boolean|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Returns `true` if the handle is active, `false` if it's inactive.
		
		 What "active” means depends on the type of handle:
		
		 - A `uv_async_t` handle is always active and cannot be deactivated, except by closing it with `uv.close()`.
		
		 - A `uv_pipe_t`, `uv_tcp_t`, `uv_udp_t`, etc. handle - basically any handle that deals with I/O - is active when it is doing something that involves I/O, like reading, writing, connecting, accepting new connections, etc.
		
		 - A `uv_check_t`, `uv_idle_t`, `uv_timer_t`, etc. handle is active when it has been started with a call to `uv.check_start()`, `uv.idle_start()`, `uv.timer_start()` etc. until it has been stopped with a call to its respective stop function.
		
		
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
	inline public function is_active():nvim.helper.Multireturn.Return3<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __is_active();
		return new nvim.helper.Multireturn.Return3<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	@:native("is_closing")
	private extern function __is_closing():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:is_closing()
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
	inline public function is_closing():nvim.helper.Multireturn.Return3<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __is_closing();
		return new nvim.helper.Multireturn.Return3<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	@:native("recv_buffer_size")
	private extern function __recv_buffer_size(size:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:recv_buffer_size(size: integer)
		  -> success: 0|nil
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
		
		
		
		---
		
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
		
		---
		
		```lua
		(method) uv.uv_handle_t:recv_buffer_size()
		  -> current_size: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		```lua
		(method) uv.uv_handle_t:recv_buffer_size(size: 0)
		  -> current_size: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
	**/
	inline public function recv_buffer_size(size:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __recv_buffer_size(size);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_handle_t:ref()
		```
		
		---
		
		 Reference the given handle.
		
		 References are idempotent, that is, if a handle is already referenced calling this function again will have no effect.
	**/
	extern public function ref():Dynamic;
	@:native("send_buffer_size")
	private extern function __send_buffer_size(size:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_handle_t:send_buffer_size(size: integer)
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
		
		 **Note**: Linux will set double the size and return double the size of the
		 original set value.
		
		
		
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
		(method) uv.uv_handle_t:send_buffer_size()
		  -> current_size: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		```lua
		(method) uv.uv_handle_t:send_buffer_size(size: 0)
		  -> current_size: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
	**/
	inline public function send_buffer_size(size:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __send_buffer_size(size);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	@:native("start")
	private extern function __start(events:nvim.type.uv.poll.Eventspec, callback:nvim.type.uv.poll_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_poll_t:start(events: "d"|"dp"|"p"|"r"|"rd"|"rdp"|"rp"|"rw"|"rwd"|"rwdp"|"rwp"|"w"|"wd"|"wdp"|"wp", callback: fun(err: string|nil, events?: string))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Starts polling the file descriptor.
		
		 `events` are: `"r"`, `"w"`, `"rw"`, `"d"`, `"rd"`, `"wd"`, `"rwd"`, `"p"`, `"rp"`, `"wp"`, `"rwp"`, `"dp"`, `"rdp"`, `"wdp"`, or `"rwdp"` where `r` is `READABLE`, `w` is `WRITABLE`, `d` is `DISCONNECT`, and `p` is `PRIORITIZED`.
		
		 As soon as an event is detected the callback will be called with status set to 0, and the detected events set on the events field.
		
		 The user should not close the socket while the handle is active. If the user
		 does that anyway, the callback may be called reporting an error status, but this
		 is not guaranteed.
		
		 **Note** Calling `poll:start()` on a handle that is already active is fine.
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
	inline public function start(events:nvim.type.uv.poll.Eventspec, callback:nvim.type.uv.poll_start.Callback):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		events = nvim.helper.Arg.pure(events);
		callback = nvim.helper.Arg.pure(callback);
		final result = __start(events, callback);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	@:native("stop")
	private extern function __stop():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_poll_t:stop()
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
	inline public function stop():nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __stop();
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_handle_t:unref()
		```
		
		---
		
		 Un-reference the given handle. References are idempotent, that is, if a handle
		 is not referenced calling this function again will have no effect.
	**/
	extern public function unref():Dynamic;
}