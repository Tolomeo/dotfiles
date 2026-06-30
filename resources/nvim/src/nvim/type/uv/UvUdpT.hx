package nvim.type.uv;

/**
	```lua
	(class) uv.uv_udp_t
	```
	
	---
	
	 UDP handles encapsulate UDP communication for both clients and servers.
	
**/
@:structInit class UvUdpT {
	/**
		```lua
		(method) uv.uv_udp_t:bind(host: string, port: integer, flags?: uv.udp_bind.flags)
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
	@:native("bind")
	private extern function __bind(host:String, port:Float, ?flags:nvim.type.uv.udp_bind.Flags):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:bind(host: string, port: integer, flags?: uv.udp_bind.flags)
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
	inline public function bind(host:String, port:Float, ?flags:nvim.type.uv.udp_bind.Flags):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		flags = nvim.helper.Arg.pure(flags);
		final result = __bind(host, port, flags);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
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
	/**
		```lua
		(method) uv.uv_udp_t:connect(host: string, port: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Associate the UDP handle to a remote address and port, so every message sent by
		 this handle is automatically sent to that destination.
		
		 Calling this function with a NULL addr disconnects the handle. Trying to call `udp:connect()` on an already connected handle will result in an `EISCONN` error. Trying to disconnect a handle that is not connected will return an `ENOTCONN` error.
		
		
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
	@:native("connect")
	private extern function __connect(host:String, port:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:connect(host: string, port: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Associate the UDP handle to a remote address and port, so every message sent by
		 this handle is automatically sent to that destination.
		
		 Calling this function with a NULL addr disconnects the handle. Trying to call `udp:connect()` on an already connected handle will result in an `EISCONN` error. Trying to disconnect a handle that is not connected will return an `ENOTCONN` error.
		
		
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
	inline public function connect(host:String, port:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __connect(host, port);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
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
	/**
		```lua
		(method) uv.uv_udp_t:get_send_queue_count()
		  -> count: integer
		```
		
		---
		
		 Returns the handle's send queue count.
	**/
	extern public function get_send_queue_count():Float;
	/**
		```lua
		(method) uv.uv_udp_t:get_send_queue_size()
		  -> size: integer
		```
		
		---
		
		 Returns the handle's send queue size.
	**/
	extern public function get_send_queue_size():Float;
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
	/**
		```lua
		(method) uv.uv_udp_t:getpeername()
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
	@:native("getpeername")
	private extern function __getpeername():nvim.helper.Multireturn<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:getpeername()
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
	inline public function getpeername():nvim.helper.Multireturn.Return3<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __getpeername();
		return new nvim.helper.Multireturn.Return3<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:getsockname()
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
	@:native("getsockname")
	private extern function __getsockname():nvim.helper.Multireturn<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:getsockname()
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
	inline public function getsockname():nvim.helper.Multireturn.Return3<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __getsockname();
		return new nvim.helper.Multireturn.Return3<Null<nvim.type.uv.udp.Sockname>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
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
	/**
		```lua
		(method) uv.uv_udp_t:open(fd: integer)
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
	@:native("open")
	private extern function __open(fd:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:open(fd: integer)
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
	inline public function open(fd:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __open(fd);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
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
		(method) uv.uv_udp_t:recv_start(callback: fun(err: string|nil, data: string|nil, addr: uv.udp_recv_start.callback.addr|nil, flags: uv.udp_recv_start.callback.flags))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Prepare for receiving data.
		
		 If the socket has not previously been bound with `udp:bind()` it is bound to `0.0.0.0` (the "all interfaces" IPv4 address) and a random port number.
		
		
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
	@:native("recv_start")
	private extern function __recv_start(callback:nvim.type.uv.udp_recv_start.Callback):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:recv_start(callback: fun(err: string|nil, data: string|nil, addr: uv.udp_recv_start.callback.addr|nil, flags: uv.udp_recv_start.callback.flags))
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Prepare for receiving data.
		
		 If the socket has not previously been bound with `udp:bind()` it is bound to `0.0.0.0` (the "all interfaces" IPv4 address) and a random port number.
		
		
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
	inline public function recv_start(callback:nvim.type.uv.udp_recv_start.Callback):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		callback = nvim.helper.Arg.pure(callback);
		final result = __recv_start(callback);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:recv_stop()
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
	@:native("recv_stop")
	private extern function __recv_stop():nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:recv_stop()
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
	inline public function recv_stop():nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __recv_stop();
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
	/**
		```lua
		(method) uv.uv_udp_t:send(data: string|string[], host: string, port: integer, callback: fun(err: string|nil))
		  -> bytes: uv.uv_udp_send_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Send data over the UDP socket.
		
		 If the socket has not previously been bound with `udp:bind()` it will be bound to `0.0.0.0` (the "all interfaces" IPv4 address) and a random port number.
		
		
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
	@:native("send")
	private extern function __send(data:nvim.type.uv.Buffer, host:String, port:Float, callback:nvim.type.uv.udp_send.Callback):nvim.helper.Multireturn<Null<nvim.type.uv.UvUdpSendT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:send(data: string|string[], host: string, port: integer, callback: fun(err: string|nil))
		  -> bytes: uv.uv_udp_send_t|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Send data over the UDP socket.
		
		 If the socket has not previously been bound with `udp:bind()` it will be bound to `0.0.0.0` (the "all interfaces" IPv4 address) and a random port number.
		
		
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
	inline public function send(data:nvim.type.uv.Buffer, host:String, port:Float, callback:nvim.type.uv.udp_send.Callback):nvim.helper.Multireturn.Return3<Null<nvim.type.uv.UvUdpSendT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		data = nvim.helper.Arg.pure(data);
		callback = nvim.helper.Arg.pure(callback);
		final result = __send(data, host, port, callback);
		return new nvim.helper.Multireturn.Return3<Null<nvim.type.uv.UvUdpSendT>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
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
	/**
		```lua
		(method) uv.uv_udp_t:set_broadcast(on: boolean)
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
	@:native("set_broadcast")
	private extern function __set_broadcast(on:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_broadcast(on: boolean)
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
	inline public function set_broadcast(on:Bool):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_broadcast(on);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:set_membership(multicast_addr: string, interface_addr: string, membership: "join"|"leave")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set membership for a multicast address.
		
		@*param* `multicast_addr` — multicast address to set membership for
		
		@*param* `interface_addr` — interface address
		
		@*param* `membership` — membership intent
		
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
	@:native("set_membership")
	private extern function __set_membership(multicast_addr:String, interface_addr:String, membership:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_membership(multicast_addr: string, interface_addr: string, membership: "join"|"leave")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set membership for a multicast address.
		
		@*param* `multicast_addr` — multicast address to set membership for
		
		@*param* `interface_addr` — interface address
		
		@*param* `membership` — membership intent
		
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
	inline public function set_membership(multicast_addr:String, interface_addr:String, membership:String):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_membership(multicast_addr, interface_addr, membership);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:set_multicast_interface(interface_addr: string)
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
	@:native("set_multicast_interface")
	private extern function __set_multicast_interface(interface_addr:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_multicast_interface(interface_addr: string)
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
	inline public function set_multicast_interface(interface_addr:String):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_multicast_interface(interface_addr);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:set_multicast_loop(on: boolean)
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
	@:native("set_multicast_loop")
	private extern function __set_multicast_loop(on:Bool):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_multicast_loop(on: boolean)
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
	inline public function set_multicast_loop(on:Bool):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_multicast_loop(on);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:set_multicast_ttl(ttl: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the multicast ttl.
		
		@*param* `ttl` — an integer 1 through 255
		
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
	@:native("set_multicast_ttl")
	private extern function __set_multicast_ttl(ttl:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_multicast_ttl(ttl: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the multicast ttl.
		
		@*param* `ttl` — an integer 1 through 255
		
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
	inline public function set_multicast_ttl(ttl:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_multicast_ttl(ttl);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:set_source_membership(multicast_addr: string, interface_addr?: string, source_addr: string, membership: "join"|"leave")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set membership for a source-specific multicast group.
		
		@*param* `multicast_addr` — multicast address to set membership for
		
		@*param* `interface_addr` — interface address
		
		@*param* `source_addr` — source address
		
		@*param* `membership` — membership intent
		
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
	@:native("set_source_membership")
	private extern function __set_source_membership(multicast_addr:String, ?interface_addr:String, source_addr:String, membership:String):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_source_membership(multicast_addr: string, interface_addr?: string, source_addr: string, membership: "join"|"leave")
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set membership for a source-specific multicast group.
		
		@*param* `multicast_addr` — multicast address to set membership for
		
		@*param* `interface_addr` — interface address
		
		@*param* `source_addr` — source address
		
		@*param* `membership` — membership intent
		
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
	inline public function set_source_membership(multicast_addr:String, ?interface_addr:String, source_addr:String, membership:String):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_source_membership(multicast_addr, interface_addr, source_addr, membership);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:set_ttl(ttl: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the time to live.
		
		@*param* `ttl` — integer 1 through 255
		
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
	@:native("set_ttl")
	private extern function __set_ttl(ttl:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:set_ttl(ttl: integer)
		  -> success: 0|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Set the time to live.
		
		@*param* `ttl` — integer 1 through 255
		
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
	inline public function set_ttl(ttl:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		final result = __set_ttl(ttl);
		return new nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>>(result._0, result._1, result._2);
	}
	/**
		```lua
		(method) uv.uv_udp_t:try_send(data: string|string[], host: string, port: integer)
		  -> success: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Same as `udp:send()`, but won't queue a send request if it can't be
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
	@:native("try_send")
	private extern function __try_send(data:nvim.type.uv.Buffer, host:String, port:Float):nvim.helper.Multireturn<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(method) uv.uv_udp_t:try_send(data: string|string[], host: string, port: integer)
		  -> success: integer|nil
		  2. err: string|nil
		  3. err_name: "E2BIG"|"EACCES"|"EADDRINUSE"|"EADDRNOTAVAIL"|"EAFNOSUPPORT"|"EAGAIN"|"EAI_ADDRFAMILY"|"EAI_AGAIN"|"EAI_BADFLAGS"|"EAI_BADHINTS"|"EAI_CANCELED"|"EAI_FAIL"|"EAI_FAMILY"|"EAI_MEMORY"...(too long)...KNOWN"|nil
		```
		
		---
		
		 Same as `udp:send()`, but won't queue a send request if it can't be
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
	inline public function try_send(data:nvim.type.uv.Buffer, host:String, port:Float):nvim.helper.Multireturn.Return3<Null<Float>, Null<nvim.type.uv.error.Message>, Null<nvim.type.uv.error.Name>> {
		data = nvim.helper.Arg.pure(data);
		final result = __try_send(data, host, port);
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