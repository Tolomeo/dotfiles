package nvim.type.uv;

/**
	```lua
	(class) uv.uv_tcp_t
	```
	
	---
	
	 TCP handles are used to represent both TCP streams and servers.
	
**/
@:structInit extern class UvTcpT {
	/**
		```lua
		(method) uv.uv_stream_t:accept(client_stream: uv.uv_stream_t)
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
	function accept(client_stream:nvim.type.uv.UvStreamT):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:bind(addr: string, port: integer, flags?: uv.tcp_bind.flags)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Bind the handle to an host and port.
		
		 Any `flags` are set with a table with field `ipv6only` equal to `true` or `false`.
		
		 When the port is already taken, you can expect to see an `EADDRINUSE` error
		 from either `tcp:bind()`, `uv.listen()` or `tcp:connect()`. That is, a
		 successful call to this function does not guarantee that the call to `uv.listen()`
		 or `tcp:connect()` will succeed as well.
		
		 Use a port of `0` to let the OS assign an ephemeral port.  You can look it up
		 later using `tcp:getsockname()`.
		
		@*param* `addr` — must be an IP address and not a hostname
		
		@*param* `port` — set to `0` to allow the OS to assign an ephemeral port
		
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
	function bind(addr:String, port:Int, ?flags:nvim.type.uv.tcp_bind.Flags):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function close(?callback:haxe.Constraints.Function):Dynamic;
	/**
		```lua
		(method) uv.uv_tcp_t:close_reset(callback?: function)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Resets a TCP connection by sending a RST packet. This is accomplished by setting
		 the SO_LINGER socket option with a linger interval of zero and then calling
		 `uv.close()`. Due to some platform inconsistencies, mixing of `uv.shutdown()`
		 and `tcp:close_reset()` calls is not allowed.
		
		
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
	function close_reset(?callback:haxe.Constraints.Function):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:connect(host: string, port: integer, callback: fun(err: string|nil))
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
	function connect(host:String, port:Int, callback:nvim.type.uv.tcp_connect.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvConnectT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function fileno():nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function get_type():nvim.helper.Multireturn<String, Int, Void, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:get_write_queue_size()
		  -> size: integer
		```
		
		---
		
		 Returns the stream's write queue size.
	**/
	function get_write_queue_size():Int;
	/**
		```lua
		(method) uv.uv_tcp_t:getpeername()
		  -> peername: uv.socketinfo|nil
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
	function getpeername():nvim.helper.Multireturn<Null<nvim.type.uv.Socketinfo>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:getsockname()
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
	function getsockname():nvim.helper.Multireturn<Null<nvim.type.uv.Socketinfo>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function has_ref():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function is_active():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function is_closing():nvim.helper.Multireturn<Null<Bool>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:is_readable()
		  -> readable: boolean
		```
		
		---
		
		 Returns `true` if the stream is readable, `false` otherwise.
	**/
	function is_readable():Bool;
	/**
		```lua
		(method) uv.uv_stream_t:is_writable()
		  -> writable: boolean
		```
		
		---
		
		 Returns `true` if the stream is writable, `false` otherwise.
	**/
	function is_writable():Bool;
	/**
		```lua
		(method) uv.uv_tcp_t:keepalive(enable: boolean, delay?: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Enable / disable TCP keep-alive.
		
		@*param* `delay` — initial delay, in seconds
		
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
	function keepalive(enable:Bool, ?delay:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:listen(backlog: integer, callback: fun(err: string|nil))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Start listening for incoming connections.
		
		 `backlog` indicates the number of connections the kernel might queue, same as `listen(2)`.
		
		 When a new incoming connection is received the callback is called.
		
		
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
	function listen(backlog:Int, callback:nvim.type.uv.listen.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:nodelay(enable: boolean)
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
	function nodelay(enable:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:open(sock: integer)
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
	function open(sock:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:read_start(callback: fun(err: string|nil, data?: string))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Read data from an incoming stream.
		
		 The callback will be made several times until there is no more data to read or `stream:read_stop()` is called.
		
		 When we've reached EOF, `data` will be `nil`.
		
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
	function read_start(callback:nvim.type.uv.read_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:read_stop()
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Stop reading data from the stream.
		
		 The read callback will no longer be called.
		
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
	function read_stop():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
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
	function recv_buffer_size(size:Int):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_handle_t:ref()
		```
		
		---
		
		 Reference the given handle.
		
		 References are idempotent, that is, if a handle is already referenced calling this function again will have no effect.
	**/
	function ref():Dynamic;
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
	function send_buffer_size(size:Int):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:set_blocking(blocking: boolean)
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
	function set_blocking(blocking:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:shutdown(callback?: fun(err: string|nil))
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
	function shutdown(?callback:nvim.type.uv.shutdown.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvShutdownT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:simultaneous_accepts(enable: boolean)
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
	function simultaneous_accepts(enable:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:try_write(data: string|string[])
		  -> bytes: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Same as `stream:write()`, but won't queue a write request if it can't be completed
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
	function try_write(data:nvim.type.uv.Buffer):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:try_write2(data: string|string[], send_handle: uv.uv_stream_t)
		  -> bytes: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Like `stream:write2()`, but with the properties of `stream:try_write()`. Not supported on Windows, where it returns `UV_EAGAIN`.
		
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
	function try_write2(data:nvim.type.uv.Buffer, send_handle:nvim.type.uv.UvStreamT):nvim.helper.Multireturn<Null<Int>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_handle_t:unref()
		```
		
		---
		
		 Un-reference the given handle. References are idempotent, that is, if a handle
		 is not referenced calling this function again will have no effect.
	**/
	function unref():Dynamic;
	/**
		```lua
		(method) uv.uv_stream_t:write(data: string|string[], callback?: fun(err: string|nil))
		  -> bytes: uv.uv_write_t|nil
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
	function write(data:nvim.type.uv.Buffer, ?callback:nvim.type.uv.write.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvWriteT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_stream_t:write2(data: string|string[], send_handle: uv.uv_stream_t, callback?: fun(err: string|nil))
		  -> write: uv.uv_write_t|nil
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
	function write2(data:nvim.type.uv.Buffer, send_handle:nvim.type.uv.UvStreamT, ?callback:nvim.type.uv.write2.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvWriteT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, Void, Void, Void>;
	/**
		```lua
		(method) uv.uv_tcp_t:write_queue_size()
		```
		
		---
		
		 **Deprecated:** Please use `uv.stream_get_write_queue_size()` instead.
	**/
	function write_queue_size():Dynamic;
}