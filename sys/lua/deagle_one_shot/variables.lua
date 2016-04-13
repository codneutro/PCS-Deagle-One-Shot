dos = {
	math  = {},
	table = {},
	hook  = {},
	players = {},
	firstKill = false,
}

--[[-------------------------------------------------
	add                                               
-------------------------------------------------]]--
function dos.table.add(table, key, value)
	table[key] = table[key] + value;
end

--[[-------------------------------------------------
	resetplayersvars                                               
-------------------------------------------------]]--
function dos.resetplayervars(id)
	dos.players[id] = {
		kills = 0,
	};
end