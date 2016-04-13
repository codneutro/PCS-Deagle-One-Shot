for index, file in pairs({"variables", "hooks", "setup"}) do
	dofile('sys/lua/deagle_one_shot/'..file..".lua");
end