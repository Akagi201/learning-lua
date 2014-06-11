
-- 在 Lua 里，table 的创建是通过“构造表达式”来完成，
-- 最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:

-- 创建一个空的 table
local tbl1 = {}
 
-- 直接初始表
local tbl2 = {"apple", "pear", "orange", "grape"}

-- Lua 中的表（table）其实是一个“关联数组”（associative arrays），
-- 数组的索引可以是数字或者是字符串

a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end

-- 不同于其他语言的数组把 0 作为数组的初始索引，
-- 在 Lua 里表的默认初始索引一般以 1 开始

local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
end

-- table的变量只是一个地址引用，
-- 对table的操作不会产生table的副本或创建新的table

a1 = {}
a1["key"] = "val1"
a2 = a1
print(a2["key"])
a2["key"] = "val2"
print(a1["key"])
print(a1.key)

-- table 不会固定长度大小，
-- 有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil

a3 = {}
for i = 1, 10 do
    a3[i] = i
end
a3["key"] = "val"
print(a3["key"])
print(a3["none"])










