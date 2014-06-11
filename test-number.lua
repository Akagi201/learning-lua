
-- Lua 默认只有一种 number 类型
-- double（双精度）类型（默认类型可以修改 luaconf.h 里的定义），
-- 以下几种写法都被看作是 number 类型

print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))
