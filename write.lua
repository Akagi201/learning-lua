
local f = assert(io.open("ok.txt", 'w'))

f:write("welcome to lua")

f:close()

local function write_content(file_name, content)
	-- 根据需要读写的文件目录去写入文件
	local f = assert(io.open(file_name, 'w'))
	f:write(content)
	f:close()
end

write_content("ok.txt", "hello lua")

local long_string = [[
sdafasfafd
dsafsdafa
fdafsafasf

]]


write_content("ok.txt", long_string)
