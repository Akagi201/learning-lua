
-- lua 中只有false和nil才表示为假

-- and 如果第一个我们需要去计算的操作数是假的话, 那么, 我们就返回第一个操作数, 反之, 我们就返回第二个操作数.

print(1 and 5)

print(0 and 5)

print(false and 5)

print(nil and 5)


-- or 如果第一个我们需要去计算的操作数是真的话, 那么, 我们就返回第一个操作数, 反之, 我们就返回第二个操作数.

print(1 or 5)

print(0 or 5)

print(false or 5)

print(nil or 5)

-- not 永远返回的只是true和false

print(not nil)

print(not 1)

print(not 0)

print(not false)

-- while 练习
m_table = {1, 2, 3}

local i = 1

while m_table[i] do
	print(m_table[i])
	i = i + 1
end

-- repeat 相当于do-while

repeat
	line = io.read()
until line ~= ""

print(line)

local snum = 1

repeat
	print("snum value is " .. snum)
	snum = snum + 1
until snum == 3

-- for

for i=1,10 do
	print(i)
end

for i=1, #m_table do
	print(m_table[i])
end
