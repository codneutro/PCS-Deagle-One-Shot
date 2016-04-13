--[[-------------------------------------------------
	join                                               
-------------------------------------------------]]--
function dos.hook.join(id)
	dos.resetplayervars(id);
	msg2(id, string.char(169).."255255255Welcome to PCS | Deagle One Shot Server !");
	msg2(id, string.char(169).."255255255Visit us at cs2d.net !");
end

--[[-------------------------------------------------
	spawn                                               
-------------------------------------------------]]--
function dos.hook.spawn(id)
	parse('speedmod '.. id ..' 10');
	return "3,51";
end

--[[-------------------------------------------------
	buy                                               
-------------------------------------------------]]--
function dos.hook.buy(id, weapon)
	return 1;
end

--[[-------------------------------------------------
	drop                                               
-------------------------------------------------]]--
function dos.hook.drop(id, iid, type, ain, a, mode, x, y)
	return 1;
end

--[[-------------------------------------------------
	startround                                               
-------------------------------------------------]]--
function dos.hook.startround(mode)
	--> Commencing / Restart
	if (mode == 4 or mode == 5) then
		for _, id in pairs(player(0, "table")) do
			dos.resetplayervars(id);
		end

		dos.firstKill = false;
	end
end

--[[-------------------------------------------------
	kill                                               
-------------------------------------------------]]--
function dos.hook.kill(killer, victim, weapon, x, y)
	dos.table.add(dos.players[killer], "kills", 1);
	dos.players[victim].kills = 0;

	if (not dos.firstKill) then
		dos.firstKill = true;
		parse('sv_sound fun/firstblood.wav');
		msg(string.char(169).."255000000"..player(killer, "name")..
			' Made The Firstblood !@C');
	end

	if (weapon == 50) then
		msg(string.char(169).."255000000"..player(killer, "name")..
			' Made An Humiliation !@C');
		parse('sv_sound fun/humiliation.wav');
	end 

	if (dos.players[killer].kills == 2) then
		parse('sv_sound deagle_one_shot/ut/doublekill.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Made A Doublekill !@C');
	elseif (dos.players[killer].kills == 3) then
		parse('sv_sound deagle_one_shot/ut/triplekill.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Made A Triplekill !@C');
	elseif (dos.players[killer].kills == 4) then
		parse('sv_sound deagle_one_shot/ut/multikill.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Made A Multikill !@C');
	elseif (dos.players[killer].kills == 5) then
		parse('sv_sound deagle_one_shot/ut/ultrakill.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Made An ULTRAKILL !@C');
	elseif (dos.players[killer].kills == 6) then
		parse('sv_sound deagle_one_shot/ut/monsterkill.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Made A MO-O-O-O-O-ONSTERKILL-ILL-ILL !@C');
	elseif (dos.players[killer].kills == 7) then
		parse('sv_sound deagle_one_shot/ut/killingspree.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Is On A KILLINGSPREE !@C');
	elseif (dos.players[killer].kills == 8) then
		parse('sv_sound deagle_one_shot/ut/rampage.ogg');
		msg(string.char(169).."000000255"..player(killer, "name")..
			' Is On A RAMPAGE !@C');
	elseif (dos.players[killer].kills == 9) then
		parse('sv_sound deagle_one_shot/ut/godlike.ogg');
		msg(string.char(169).."255000000"..player(killer, "name")..
			' Is GODLIKE !@C');
	elseif (dos.players[killer].kills == 10) then
		parse('sv_sound deagle_one_shot/ut/dominating.ogg');
		msg(string.char(169).."255000000"..player(killer, "name")..
			' Is DOMINATING !@C');
	elseif (dos.players[killer].kills >= 11) then
		if (dos.players[killer].kills == 20) then
			parse('sv_sound deagle_one_shot/ut/xfile.ogg');
		else
			parse('sv_sound deagle_one_shot/ut/unstoppable.ogg');
		end
		
		msg(string.char(169).."255000000"..player(killer, "name")..
			' Is UNSTOPPABLE ! >> '.. dos.players[killer].kills..
			' KILLS <<@C');
	end
end