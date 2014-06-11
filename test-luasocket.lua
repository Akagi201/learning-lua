-- 安装
-- mac: luarocks install luasocket
-- openwrt: opkg install luasocket
-- ref: http://w3.impa.br/~diego/software/luasocket/introduction.html

local socket = require("socket")
print(socket._VERSION)

-- 以 socket 的方式访问获取度娘首页数据

local socket = require("socket")
 
local host = "www.baidu.com"
local file = "/"
 
-- 创建一个 TCP 连接，连接到 HTTP 连接的标准端口 -- 80 端口上
local sock = assert(socket.connect(host, 80))
sock:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
repeat
    -- 以 1K 的字节块来接收数据，并把接收到字节块输出来
    local chunk, status, partial = sock:receive(1024)
    print(chunk or partial)
until status ~= "closed"
-- 关闭 TCP 连接
sock:close()

-- 或者使用模块里内置的 http 方法来访问

local http = require("socket.http")
local response = http.request("http://www.baidu.com/")
print(response)