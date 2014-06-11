
-- 字符串由一对双引号或单引号来表示

string1 = "this is string1"
string2 = 'this is string2'

-- 也可以用 2 个方括号 "[[]]" 来表示“一块”字符串

html = [[
<html>
<head></head>
<body>
    <a href="http://dhq.me/">just a link</a>
</body>
</html>
]]
print(html)

-- 在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字

print("2" + 6)
print("2" + "6")
print("2 + 6")
print("-2e2" * "6")
-- print("error" + 1)

-- 使用 .. 连接字符串

print("a" .. 'b')
print(157 .. 428)

-- 使用#作为长度操作符, 放在字符串前面可以获取该字符串的长度

len = "length"
print(#len)
print(#"length")


