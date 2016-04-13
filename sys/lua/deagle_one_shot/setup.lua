--> SETTINGS
parse('sv_gamemode 2');
parse('mp_infammo 1');
parse('mp_wpndmg Deagle 100');
parse('mp_wpndmg HE 200');
parse('mp_roundtime 100');
parse('mp_hud 73');
parse('mp_radar 0');

--> HOOKS
local hooks = {"join", "spawn", "buy", "drop", "startround", "kill"};

for _, hook in pairs(hooks) do
	addhook(hook, "dos.hook."..hook);
end

