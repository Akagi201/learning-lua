
local a = 12

if a == 12 then
	print("a's value is 12")
end

if a == 11 then
	print("value is 11")
elseif a ~=11 then
	print("value is not 11")
end

-- 完整的if else 语句块

if a == 2 then
	print("value is 2")
elseif a == 11 then
	print("value is 11")
else
	print("value is " ..a)
end


-- lua中条件判断的特殊符号组合: == > < >= <= ~=(不等于

local function myfunc01( ... )
	print("Im myfunc01")
end

myfunc01()

local function myfunc02( a )
	print(a)
end

myfunc02("string")

local function myfunc03( a )
	return a
end

print(myfunc03(123))

local function myfunc04( ... )
	return 1, 2
end

local a, b = myfunc04()

print(a)
print(b)

-- 数组遍历的第一个值为1, 美国人一周的开始是周日,
-- 作者是巴西人一周的开始是周一

function myfunc05( ... )
	local mtable = {...}

	for k,v in pairs(mtable) do
		print(k,v)
	end

	print("get value is " ..mtable[1])
end

myfunc05("12", "123", "ok")

