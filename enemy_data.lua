
-- 数据阵列

enemy_waves = {
	{enter_id = 1, info_id = 1},
	{enter_id = 2, info_id = 1},
	{enter_id = 2, info_id = 2},
	{enter_id = 2, info_id = 2},
	{enter_id = 1, info_id = 2},
	{enter_id = 1, info_id = 1}
}

enemy_datas = {
	{max_hp = 100, damage = 100, is_have_special_effect = true},
	{max_hp = 100, damage = 100, is_have_special_effect = true},
	{max_hp = 100, damage = 100, is_have_special_effect = true},
	{max_hp = 100, damage = 100, is_have_special_effect = true}

}

for k,v in pairs(enemy_datas) do
	print(k,v)
	if type(v) == "table" then
		for ik,iv in pairs(v) do
		print(ik,iv)
		end
	print("=======")
	end
end

