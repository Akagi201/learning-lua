
function serialize(o)
	if type(o) == "number" then
		io.write(o)
	elseif type(o) == "string" then
		--todo
		--io.write("'", o, "'")
		io.write("[[", o, "]]")
	else -- 其他情况

	end
end

a = 'a "programing lua" \\'

print(string.format("%q", a))


-- [=[...]=] -- ...为字符串, lua5.1提供

-- 保存无环的table

function n_serialize(o)

	if type(o) == "number" then
		io.write(o)

	elseif type(o) == "string" then
		--todo
		io.write(string.format("%q", o))

	elseif type(o) == "table" then
		io.write("{\n")

		for k,v in pairs(o) do
			io.write(" ", k, " = ")
			n_serialize(v)
			io.write(",\n")
		end
		io.write("}\n")

	else

	end
end

serialize("ok")
serialize(12)
n_serialize{a = 12, b = 'lua'}
