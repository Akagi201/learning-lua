
-- io.open 一种面向对象的用法, io为一个table, open为table中的一个方法.
-- r表示读取的权限, 如果你写入a表示追加(append), w表示写入(write), b表示打开二进制(binary)

local f = assert(io.open("namelist.txt", 'r'))

local string = f:read("*all")

f:close();

print(string)

local function read_files(file_name)
	local f = assert(io.open(file_name, 'r'))
	-- 表示读取所有的文件内容, 你也可以选择*line表示读取一行, 
	-- 或者*number读取一个数字, 或者<num>读取一个不超过<num>的长度的字符
	local content = f:read("*all")
	f:close()

	return content
end

local rlt = read_files("namelist.txt")

print(rlt)

