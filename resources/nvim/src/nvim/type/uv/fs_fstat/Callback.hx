package nvim.type.uv.fs_fstat;

extern typedef Callback = (err:nvim.type.uv.callback.Err, ?stat:Null<nvim.type.uv.fs_stat.Result>) -> Dynamic;