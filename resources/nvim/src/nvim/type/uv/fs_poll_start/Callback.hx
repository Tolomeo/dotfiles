package nvim.type.uv.fs_poll_start;

extern typedef Callback = (err:nvim.type.uv.callback.Err, prev:Null<nvim.type.uv.fs_stat.Result>, curr:Null<nvim.type.uv.fs_stat.Result>) -> Dynamic;