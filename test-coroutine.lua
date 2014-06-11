--[[
协同程序（coroutine，这里简称协程）是一种类似于线程（thread）的东西，
它拥有自己独立的栈、局部变量和指令指针，可以跟其他协程共享全局变量和其他一些数据，
并且具有一种挂起（yield）中断协程主函数运行，
下一次激活恢复协程会在上一次中断的地方继续执行（resume）协程主函数的控制机制。
]]

--[[
Lua 把关于协程的所有函数放在一个名为 “coroutine” 的 table 里，coroutine 里具有以下几个内置函数
coroutine.create
coroutine.resume
coroutine.running
coroutine.status
coroutine.wrap
coroutine.yield
]]

-- coroutine.create - 创建协程

-- 函数 coroutine.create 用于创建一个新的协程，
-- 它只有一个以函数形式传入的参数，该函数是协程的主函数，它的代码是协程所需执行的内容
-- 当创建完一个协程后，会返回一个类型为 thread 的对象，
-- 但并不会马上启动运行协程主函数，协程的初始状态是处于挂起状态
co = coroutine.create(function()
    io.write("coroutine create!\n")
end)
print(co)
print(type(co))

--coroutine.status - 查看协程状态

--[[
协程有 4 种状态，分别是：挂起（suspended）、运行（running）、死亡（dead）
和正常（normal），可以通过 coroutine.status 来输出查看协程当前的状态。
]]

print(coroutine.status(co))

-- coroutine.resume - 执行协程

-- 用于启动或再次启动一个协程的执行
-- 协程被调用执行后，其状态会由挂起（suspended）改为运行（running）。
-- 不过当协程主函数全部运行完之后，它就变为死亡（dead）状态。
coroutine.resume(co)
print(coroutine.status(co))

-- 传递给 resume 的额外参数都被看作是协程主函数的参数

co = coroutine.create(function(a, b, c)
    print("co", a, b, c)
end)
coroutine.resume(co, 1, 2, 3)

-- 协程主函数执行完时，它的主函数所返回的值都将作为对应 resume 的返回值

co = coroutine.create(function()
    return 3, 4
end)
print(coroutine.resume(co))

-- coroutine.yield - 中断协程运行
-- coroutine.yield 函数可以让一个运行中的协程中断挂起

co = coroutine.create(function()
    for i = 1, 3 do
        print("before coroutine yield", i)
        coroutine.yield()
        print("after coroutine yield", i)
    end
end)
coroutine.resume(co)
 
coroutine.resume(co)

-- 上面第一个 resume 唤醒执行协程主函数代码，直到第一个 yield。
-- 第二个 resume 激活被挂起的协程，
-- 并从上一次协程被中断 yield 的位置继续执行协程主函数代码，
-- 直到再次遇到 yield 或程序结束。

-- resume 执行完协程主函数或者中途被挂起（yield）时，会有返回值返回，
-- 第一个值是 true，表示执行没有错误。如果是被 yield 挂起暂停，
-- yield 函数有参数传入的话，这些参数会接着第一个值后面一并返回

co = coroutine.create(function(a, b, c)
    coroutine.yield(a, b, c)
end)
print(coroutine.resume(co, 1, 2, 3))

-- 以coroutine.wrap的方式创建协程

--[[
跟 coroutine.create 一样，函数 coroutine.wrap 也是创建一个协程，
但是它并不返回一个类型为 thread 的对象，而是返回一个函数。每当调用这个返回函数，
都会执行协程主函数运行。所有传入这个函数的参数等同于传入 coroutine.resume 的参数。
coroutine.wrap 会返回所有应该由除第一个（错误代码的那个布尔量） 之外的由 
coroutine.resume 返回的值。 和 coroutine.resume 不同之处在于， 
coroutine.wrap 不会返回错误代码，无法检测出运行时的错误，也无法检查 wrap 
所创建的协程的状态
]]

function wrap(param)
    print("Before yield", param)
    obtain = coroutine.yield()
    print("After yield", obtain)
    return 3
end
resumer = coroutine.wrap(wrap)
 
print(resumer(1))
 
print(resumer(2))

-- coroutine.running - 返回正在运行中的协程
-- 函数coroutine.running用于返回正在运行中的协程，如果没有协程运行，则返回nil

print("========")

print(coroutine.running())
 
co = coroutine.create(function()
    print(coroutine.running())
    print(coroutine.running() == co)
end)
coroutine.resume(co)
 
print(coroutine.running())

-- resume-yield 交互

-- 下面代码放在一个 lua 文件里运行，随便输入一些字符后按回车，则会返回输出刚才输入的内容

function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end
 
function send(x)
    coroutine.yield(x)
end
 
function producer()
    return coroutine.create(function()
        while true do
            local x = io.read()
            send(x)
        end
    end)
end
 
function filter(prod)
    return coroutine.create(function()
--      for line = 1, math.huge do
        for line = 1, 5 do
            local x = receive(prod)
            x = string.format("%5d Enter is %s", line, x)
            send(x)
        end
    end)
end
 
function consumer(prod)
--  repeat
--      local x = receive(prod)
--      print(type(x))
--      if x then
--          io.write(x, "\n")
--      end
--  until x == nil
    while true do
        local obtain = receive(prod)
        if obtain then
            io.write(obtain, "\n\n")
        else
            break
        end
    end
end
 
p = producer()
f = filter(p)
consumer(f)