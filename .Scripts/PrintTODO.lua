#!/bin/lua5.4

path  = "/home/mario/.local/share/todo/todo.txt"

file = io.open(path)
tasks  = {}
number = 1
for line in file:lines() do
    tasks[#tasks + 1] = "    \27[1m"..number.."\27[0m "..line
    number = number + 1
end
file:close()
for i,line in ipairs(tasks) do
    print(line)
end 
