package nvim.type.uv.getnameinfo;

extern typedef Callback = (err:nvim.type.uv.callback.Err, host:String, service:String) -> Dynamic;