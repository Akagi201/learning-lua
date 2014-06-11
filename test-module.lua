
-- 创建模块
-- 其实 Lua 的模块是由变量、函数等已知元素组成的 table，因此创建一个模块很简单，
-- 就是创建一个 table，然后把需要导出的常量、函数放入其中，最后返回这个 table 就行

-- 定义一个名为 module 的模块(table)
module = {}
 
-- 定义一个常量
module.constant = "this is a constant"
 
-- 定义一个函数
function module.func1()
    io.write("this is a public function!\n")
end
 
local function func2()
    print("this is a private function!")
end
 
function module.func3()
    func2()
end
 
return module

--[[

由上可知，模块的结构就是一个 table 的结构，
因此可以像操作调用 table 里的元素那样来操作调用模块里的常量或函数。
不过上面的 func2 声明为程序块的局部变量，即表示一个私有函数，
因此是不能从外部访问模块里的这个私有函数，必须通过模块里的共有函数来调用。

最后，把上面的模块代码保存为跟模块名一样的 lua 文件里（例如上面是 module.lua），
那么一个自定义的模块就创建成功。
]]

-- 加载模块

-- Lua 提供一个名为 require 的函数来加载模块，
-- 使用也很简单，它只有一个参数，这个参数就是要指定加载的模块名

-- require("<模块名>")
-- 或者是
-- require "<模块名>"

-- 然后会返回一个由模块常量或函数组成的 table，并且还会定义一个包含该 table 的全局变量。
-- 或者给加载的模块定义一个别名变量，方便调用：

local m = require("module")
print(m.constant)
m.func3()

-- 加载机制

--[[
对于自定义的模块，模块文件不是放在哪个文件目录都行，函数 require 有它自己的文件路径加载策略，
它会尝试从 Lua 文件或 C 程序库中加载模块。

require 用于搜索 Lua 文件的路径是存放在全局变量 package.path 中，当 Lua 启动后，
会以环境变量 LUA_PATH 的值来初始这个环境变量。如果没有找到该环境变量，
则使用一个编译时定义的默认路径来初始化。

当然，如果没有 LUA_PATH 这个环境变量，也可以自定义设置，在当前用户根目录下打开 .profile 文件
（没有则创建，打开 .bashrc 文件也可以），例如把 "~/lua/" 路径加入 LUA_PATH 环境变量里：

]]

#LUA_PATH
export LUA_PATH="~/lua/?.lua;;"

-- 文件路径以 ";" 号分隔，最后的 2 个 ";;" 表示新加的路径后面加上原来的默认路径。

--[[
如果找过目标文件，则会调用 package.loadfile 来加载模块。否则，就会去找 C 程序库。
搜索的文件路径是从全局变量 package.cpath 获取，而这个变量则是通过环境变量 LUA_CPATH 
来初始。搜索的策略跟上面的一样，只不过现在换成搜索的是 so 或 dll 类型的文件。如果找得到，
那么 require 就会通过 package.loadlib 来加载它。
]]

-- luarocks - 包管理器