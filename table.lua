
-- 建立一个空的table

mytable = {}

-- 建立一个有数据的table

mytable2 = {
	2,
	3,
	4,
	5,
	"ok",
	config = {1, 2, 3},
	8
}

-- 大家从下面的for循环中应该能发现出几个特点

--[[
1. Lua中的table的索引不是0, 而是1!!!!
2. table的访问方式跟我们在其他语言中数组使用的方式很像.
]]

for i=1,#mytable2 do
	print(mytable2[i])
end
