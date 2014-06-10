
-- 单行注释, lua语句结尾可以有也可以没有分号
print("hello lua")
print("hello lua");

--[[

多
行
注
释

]]

-- 多行文本

a = [[

<html>

<body>
	<a>http://akagi201.org</a>
</body>

</html>

]]

print(a)

-- 变量

a = "I'm a"

print("a is ==>"..a)

a = 12

print("a is ==>"..a)

--[[
1. 数字类型
2. 字符串类型
3. thread类型
4. function类型
5. table类型
6. 其他类型
]]

a = function ( var )
	print("user input is ".. var)
end

a("I'm A")

-- lua中唯一使用中括号的地方
my_table = {
	12,
	13
}

print(my_table)

for k,v in pairs(my_table) do
	print(k,v)
end

-- 如果在一个function函数中创建的变量也是global(即没有使用local关键字),
-- 那么意味着它也是全局的global变量.

b = "123" -- 全局变量, 默认是global, 即global b = "123"

local c = 12 -- 局部变量, 类似static, 作用域只在本文件
