
-- 算术操作符

print(1 + 2)
print(2 - 1)
print(1 * 2)
print(1 / 2)
print(27^(-1/3))
print(5 % 3)

-- 关系操作符
-- < > <= >= == ~=
-- 以上操作符返回的运算结果都是 true 或 false。字符串跟数字不可以进行比较

print("============")

-- 逻辑操作符: and, or, not
-- 逻辑操作符将 false 和 nil 视为假，其它的为真
-- 短路运算, print打印的是表达式执行到的位置

print(1 and 2)
print(nil and 1)
print(false and 2)
print(1 or 2)
print(false or 5)

-- 局部变量与作用域
-- Lua 通过 local 语句来创建局部变量，局部变量的作用域仅限于声明它们的那个块。

local a, b = 1, 10
if a < b then
    print(a)
    local a
    print(a)
end
print(a, b)

-- 用局部变量 local 保存全局变量，可以加速在当前作用域中对全局变量的访问.
-- 对于加速的效果，对比下面计算斐波那契数列（Fibonacci）的执行时间便知

function fibonacci(n)
    if n < 2 then
        return n
    end
    return fibonacci(n - 2) + fibonacci(n - 1)
end
io.write(fibonacci(50), "\n")

-- 使用局部变量 local

local function fibonacci(n)
    if n < 2 then
        return n
    end
    return fibonacci(n - 2) + fibonacci(n - 1)
end
io.write(fibonacci(50), "\n")

-- 控制结构

-- if then elseif else end
-- Lua 不支持 switch 语句
if num == 1 then
    print(1)
elseif num == 2 then
    print(2)
else
    print("other")
end

-- while
local i = 1
while a[i] do
    print(a[i])
    i = i + 1
end

-- repeat-until -- do-while

local a = 1
repeat
    a = a + 1
    b = a
    print(b)
until b < 10

-- for
-- for 循环语句有两种形式：数字型for（numeric for）、泛型for（generic for）

-- 数字型 for 语法

--[[
for start, end, step do
    doing something
end
]]

-- start 是开始值，end 是结束值，step是步长（可选，默认为1）

for a = 10, 0, -2 do
    print(a)
end

-- 泛型 for 循环通过一个迭代器（iterator）函数来遍历所有值

tab = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab) do
    if k == "key2" then
        break   
    end
    print(k .. " - " .. v)
end

-- break 和 return 语句用于跳出当前执行的块。




