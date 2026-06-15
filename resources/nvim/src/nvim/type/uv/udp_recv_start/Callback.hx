package nvim.type.uv.udp_recv_start;

extern typedef Callback = (err:Null<String>, data:Null<String>, addr:Null<nvim.type.uv.udp_recv_start.callback.Addr>, flags:nvim.type.uv.udp_recv_start.callback.Flags) -> Dynamic;