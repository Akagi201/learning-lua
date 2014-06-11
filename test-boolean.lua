-- boolean 类型只有两个可选值：true（真） 和 false（假），
-- Lua 把 false 和 nil 看作是“假”，其他的都为“真”

print(type(true))
print(type(false))
print(type(nil))

if type(false) or type(nil) then
	print("false and nil are false!")
else
	print("other is true!")
end