-- init
event_init()
init_netpacket_pool(10)

-- create server
server = NetServer:new()
server.on_accept = function(conn)
	local pack = NetPacket:new()
	pack:pushString("msg ...")
	conn:sendPacket(1, pack)
end

server.on_close = function(conn)
	print("close")
end

server.on_msg = function(conn, pack)
	local str = pack:getString()
	print(str)
	conn:sendPacket(1, pack)
end

server:listen("127.0.0.1", 3001, 0)

event_run()