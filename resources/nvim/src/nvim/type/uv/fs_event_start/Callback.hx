package nvim.type.uv.fs_event_start;

extern typedef Callback = (err:nvim.type.uv.callback.Err, filename:String, events:nvim.type.uv.fs_event_start.callback.Events) -> Dynamic;