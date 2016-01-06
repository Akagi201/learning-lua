local function format_table(t)
  local str = ''
  for k, v in pairs(t) do
    str = str .. k .. '==' .. v .. '\r\n'
  end
  return str
end

local tb = {
  ["a"] = 1,
  ["b"] = 2,
  ["c"] = "hello"
}

print(format_table(tb))
