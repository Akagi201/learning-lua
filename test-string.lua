
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

-- Lua 里的字符索引是从 1 开始，索引值也可以是负数，
-- 这种情况将被解释成向后索引，从字符串末尾开始算起

-- byte
-- 函数 string.byte 把字符串里的第 i 个字符转为 ASCII 编码，
-- 默认是输出第一个字符的编码（只有一个参数的话），用法：
-- string.byte (s [, i [, j]])

print(string.byte("abc"))
print(string.byte("abc", 2))

-- char
-- 函数 string.char 是把一个 ASCII 编码转换为对应的字符，用法：
-- string.char (asc1, ...)
print(string.char(97))
print(string.char(99, 100, 101))

-- dump
-- 函数 string.dump 返回一个函数二进制形式的字符串，用法：
-- string.dump (function)
function test()
    print("just a test")
end
print(string.dump(test))

-- 函数 string.dump 实现了函数的序列化，函数可以很轻松的传递，
-- 并在其他作用域调用。函数 string.dump 出来的二进制字符串，
-- 可以用 load 函数反序列回来直接调用。

function test()
    print("just a test")
end
local sd = string.dump(test)
print(sd)
-- 5.2
--local ls = load(sd)
--print(ls)
--ls()

-- find

-- 函数 string.find 查找字符串 s 里第一个符合查找字符 pattern 的位置，用法：
-- string.find (s, pattern [, init [, plain]])
-- 如果找到了目标字符pattern，则返回它的开始和结束位置
-- 5.2
-- start, end = string.find("just a test", "st")
-- print(start, end)
-- 5.1
s= string.find("just a test", "st")
print(s)

-- 如果没有找到，则返回 nil：
print(string.find("just a test", "dhq.me"))

-- format
-- 函数 string.format 用于把字符串格式化输出，用法：
-- string.format (formatstring, ···)
-- string.format 函数的第一个参数是用来指定字符串的格式
print(string.format("%s is %d", "ten", 10))

-- string.format 函数的用法跟 C 语言里的 printf 函数类似，
-- 例如它可以像 printf 那样输出指定位数的数字

Pi = 3.1415926
print(string.format("Pi is %.2f", Pi))

-- Lua 的字符格式化输出符号列表

--[[
.           所有字符
%a          字母
%c          控制符
%d          数字
%D          非数字
%l          小写字母
%p          标点符号
%s          字符串
%u          大写字母
%w          字母数字
%x          十六进制数
%z          用 0 表示的字符
]]

-- gmatch
-- 函数 string.gmatch 会返回一个迭代函数，
-- 可通过该函数遍历到一个字符串s中所有出现指定匹配模式pattern的地方
-- string.gmatch(s, pattern)

-- 下面是找出字符串 s 里的所有单词

s = "just a test"
for w in string.gmatch(s, "%a+") do
    print(w)
end

-- gsub
-- 函数 string.gsub 用于全局字符串替换，
-- 字符串 s 里满足匹配模式 pattern 格式的字符都会被替换成 repl 参数的值
-- string.gsub (s, pattern, repl [, n])
print(string.gsub("just a test", "st", "*"))

-- 匹配模式 pattern 可以是一个正则

s = "num is 1234567890"
print(string.gsub(s, "%d", "*"))

-- 可在函数的最后加上一个可选参数 n，表示指定要替换的次数

s = "sethook, setlocal, setmetatable, setupvalue, setuservalue"
print(string.gsub(s, "s%a+", "S", 2))

-- len
-- 函数 string.len 用于返回字符串 s 的长度
-- string.len (s)
print(string.len("abcdefg"))

-- lower
-- 函数string.lower用于把字符串s里的字母转为小写
-- string.lower(s)
print(string.lower("AbCdEfG"))

-- match
-- 函数string.match用于查找字符串s里第一个匹配对模式pattern的值，并返回匹配值
-- string.match (s, pattern [, init])
-- 上面参数 init 是可选, 表示查找过程的起点, 默认从 1 开始：
print(string.match("just a test", "test"))

-- 参数 pattern可以是一个正则模式
t = "today is 2003-5-31"
print(string.match(t, "%d+-%d+-%d+"))

-- 如果 pattern 为空，则返回整个字符串；如果没匹配成功，则返回 nil.
print(string.match("abcdabcd", "a"))

-- rep
-- 函数string.rep返回一个由分隔符sep隔开的重复（repeat）n 次字符 s 的字符串
-- string.rep (s, n [, sep])
-- 默认的分隔符 sep 是空字符
print(string.rep("repeat", 3))

-- reverse
-- 函数 string.reverse 用于倒转一个字符串 s 的排序
-- string.reverse (s)
print(string.reverse("reverse"))

-- sub
-- 函数string.sub用于从字符串s里截取一个从第i个字符到第j个字符间的子字符串
-- string.sub (s, i [, j])
print(string.sub("abcdefg", 2, 5))

-- 参数 i 可以是负数，这种情况下，子串的位置从字符串 s 的最后开始算起
print(string.sub("abcdefg", -4, -2))

-- 参数 end 省略的话，则会返回从 i 到字符串末尾的子字符串
print(string.sub("abcdefg", 3))

-- upper
-- 函数 string.upper 用于把字符串 s 里的字母转为大写
-- string.upper (s)
print(string.upper("AbCdEfG"))





