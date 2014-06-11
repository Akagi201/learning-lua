
s = "ok" -- 变量

mytable = {
	1,
	2,
	k = 12, -- 键值对
	4,
	config = {},
	ok = 1213,
	5
}

mytable[s] = 10

print(mytable[k])

print(mytable["k"])

print(mytable[s])

print(mytable["ok"])

-- 在lua中mytable.k等价于mytable["k"], 类似面向对象的用法, 是一个语法糖

print(mytable.k)

-- a.x a[x]经常被新手弄混
--[[
a.x <==> a["x"]
a[x] 以变量x的值来索引table
]]

-- 第一种遍历方式

for i=1,#mytable do
	print("valueis==>" ..mytable[i])
end

-- 第二种遍历方式for ipairs, ipairs迭代器使用的方式跟我们第一种
-- 普通for的方式获取的值是一样的,
-- 都是按照当前的隐式的索引来取迭代并显示值的.

for i,v in ipairs(mytable) do
	print(i,v)
end

print("===========")

-- 第三种遍历方式, pairs迭代器是完全将所有的值显示出来, 
-- 并且要注意table中索引并不完全是按照书写顺序来的, 先打印自然索引, 然后打印其它.

for k,v in pairs(mytable) do
	print(k,v)
end
