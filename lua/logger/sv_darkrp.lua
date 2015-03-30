if engine.ActiveGamemode() == "darkrp" then
	hook.Add("addLaw", "logger", function(i, s)
		local mayors = {}
		for _, ply in pairs(player.GetAll()) do
			if RPExtraTeams[ply:Team()] and RPExtraTeams[ply:Team()].mayor then
				mayors[#mayors + 1] = LOGGER.ply(ply)
			end
		end
		LOGGER.log("The Mayor (" .. table.concat(mayors, " or ") .. ") added law " .. i .. ": " .. s, "darkrp")
	end)
	hook.Add("removeLaw", "logger", function(i, s)
		local mayors = {}
		for _, ply in pairs(player.GetAll()) do
			if RPExtraTeams[ply:Team()] and RPExtraTeams[ply:Team()].mayor then
				mayors[#mayors + 1] = LOGGER.ply(ply)
			end
		end
		LOGGER.log("The Mayor (" .. table.concat(mayors, " or ") .. ") removed law " .. i .. ": " .. s, "darkrp")
	end)
	hook.Add("resetLaws", "logger", function(ply)
		LOGGER.log(LOGGER.ply(ply) .. " has reset the laws", "darkrp")
	end)
	
	hook.Add("agendaUpdated", "logger", function(ply, tab, txt)
		LOGGER.log(LOGGER.ply(ply) .. " updated agenda \"" .. tab.Title .. "\" with the text \"" .. txt .. "\"", "darkrp")
	end)
	
	hook.Add("lotteryStarted", "logger", function(ply, price)
		LOGGER.log(LOGGER.ply(ply) .. " started a lottery for $" .. price, "darkrp")
	end)
	hook.Add("lotteryEnded", "logger", function(tab, winner, amnt)
		LOGGER.log(LOGGER.ply(winner) .. " won $" .. amnt .. " in the lottery (" .. #tab .. " participants)", "darkrp")
	end)
	hook.Add("playerEnteredLottery", "logger", function(ply)
		LOGGER.log(LOGGER.ply(ply) .. " entered the lottery", "darkrp")
	end)
	
	--moneyPrinterCatchFire
	--moneyPrinterPrinted
	
	--onAllowedToOwnAdded
	--onAllowedToOwnRemoved
	
	hook.Add("onDarkRPWeaponDropped", "logger", function(ply, newwep, origwep)
		LOGGER.log(LOGGER.ply(ply) .. " dropped weapon" .. tostring(origwep), "darkrp")
	end)
	
	hook.Add("onDoorRamUsed", "logger", function(success, ply, trace)
		if success then
			LOGGER.log(LOGGER.ply(ply) .. " rammed the door " .. trace.Entity, "darkrp")
		end
	end)
	
	hook.Add("onHitAccepted", "logger", function(hitman, target, customer)
		LOGGER.log(LOGGER.ply(hitman) .. " accepted a hit on " .. LOGGER.ply(target) .. " from " .. LOGGER.ply(customer), "darkrp")
	end)
	hook.Add("onHitCompleted", "logger", function(hitman, target, customer)
		LOGGER.log(LOGGER.ply(hitman) .. " completed a hit on " .. LOGGER.ply(target) .. " from " .. LOGGER.ply(customer), "darkrp")
	end)
	hook.Add("onHitFailed", "logger", function(hitman, target, reason)
		LOGGER.log(LOGGER.ply(hitman) .. " failed a hit on " .. LOGGER.ply(target) .. "(" .. reason .. ")", "darkrp")
	end)
	
	--onKeysLocked
	--onKeysUnlocked
	
	hook.Add("onLockpickCompleted", "logger", function(ply, succ, ent)
		if succ then
			LOGGER.log(LOGGER.ply(ply) .. " lockpicked the door " .. tostring(ent), "darkrp")
		end
	end)
	
	--onPaidTax
	
	hook.Add("onPlayerChangedName", "logger", function(ply, old, new)
		LOGGER.log(LOGGER.ply(ply) .. " changed their name from (" .. old .. ") to (" .. new .. ")", "dakrp")
	end)
	hook.Add("OnPlayerChangedTeam", "logger", function(ply, before, after)
		LOGGER.log(LOGGER.ply(ply) .. " changed team from " .. LOGGER.team(before) .. " to " .. LOGGER.team(after), "darkrp")
	end)
	hook.Add("onPlayerDemoted", "logger", function(source, target, reason)
		LOGGER.log(LOGGER.ply(target) .. " was demoted by " .. LOGGER.ply(source) .. " for \"" .. reason .. "\"", "darkrp")
	end)
	
	hook.Add("onPocketItemAdded", "logger", function(ply, ent, ser)
		LOGGER.log(LOGGER.ply(ply) .. " pockeed the item " .. tostring(ent), "darkrp")
	end)
	hook.Add("onPocketItemRemoved", "logger", function(ply, item)
		LOGGER.log(LOGGER.ply(ply) .. " unpocketed the item " .. item, "darkrp")
	end)
	
	hook.Add("playerArrested", "logger", function(crim, time, actor)
		LOGGER.log(LOGGER.ply(crim) .. " was arrested by " .. LOGGER.ply(actor) .. " for " .. time .. " seconds", "dakrp")
	end)
	
	hook.Add("playerBoughtCustomEntity", "logger", function(ply, tab, ent, price)
		LOGGER.log(LOGGER.ply(ply) .. " bought custom entity " .. tab.name .. ": " .. tostring(ent) .. "($" .. price .. ")", "darkrp")
	end)
	hook.Add("playerBoughtCustomVehicle", "logger", function(ply, tab, ent, price)
		LOGGER.log(LOGGER.ply(ply) .. " bought custom vehicle " .. tab.name .. ": " .. tostring(ent) .. "($" .. price .. ")", "darkrp")
	end)
	hook.Add("playerBoughtDoor", "logger", function(ply, ent, cost)
		LOGGER.log(LOGGER.ply(ply) .. " bought door " .. tostring(ent) .. " ($" .. cost ..")", "darkrp")
	end)
	hook.Add("playerBoughtPistol", "logger", function(ply, tab, ent, price)
		LOGGER.log(LOGGER.ply(ply) .. " bought pistol " .. tab.name .. ": " .. tostring(ent) .. "($" .. price .. ")", "darkrp")
	end)
	hook.Add("playerBoughtShipment", "logger", function(ply, tab, ent, price)
		LOGGER.log(LOGGER.ply(ply) .. " bought shipment " .. tab.name .. ": " .. tostring(ent) .. "($" .. price .. ")", "darkrp")
	end)
	hook.Add("playerBoughtVehicle", "logger", function(ply, ent, price)
		LOGGER.log(LOGGER.ply(ply) .. " bought vehicle " .. tostring(ent) .. " ($" .. price .. ")", "darkrp")
	end)
	
	hook.Add("playerKeysSold", "logger", function(ply, ent, refund)
		LOGGER.log(LOGGER.ply(ply) .. " sold " .. tostring(ent) .. ", was refuned $" .. refund, "darkrp")
	end)
	
	hook.Add("PlayerPickupDarkRPWeapon", "logger", function(ply, prop, wep)
		LOGGER.log(LOGGER.ply(ply) .. " picked up weapon " .. tostring(wep), "darkrp")
	end)
	
	hook.Add("playerSellDoor", "logger", function(ply, ent)
		LOGGER.log(LOGGER.ply(ply) .. " sold door " .. tostring(ent), "darkrp")
	end)
	hook.Add("playerSellVehicle", "logger", function(ply, ent)
		LOGGER.log(LOGGER.ply(ply) .. " sold vehicle " .. tostring(ent), "darkrp")
	end)
	
	hook.Add("playerSetAFK", "logger", function(ply, afk)
		LOGGER.log(LOGGER.ply(ply) .. (afk and " is now AFK" or " is no longer AFK"), "dakrp")
	end)
	
	hook.Add("playerUnArrested", "logger", function(crim, act)
		LOGGER.log(LOGGER.ply(crim) .. " was unarrested by " .. LOGGER.ply(act), "darkrp")
	end)
	hook.Add("playerUnWanted", "logger", function(crim, act)
		LOGGER.log(LOGGER.ply(crim) .. " was un-wanted by " .. LOGGER.ply(act), "darkrp")
	end)
	hook.Add("playerUnWarranted", "logger", function(crim, act)
		LOGGER.log(LOGGER.ply(crim) .. " was un-warranted by " .. LOGGER.ply(act), "darkrp")
	end)
	hook.Add("playerWanted", "logger", function(crim, act, reason)
		LOGGER.log(LOGGER.ply(crim) .. " was wanted by " .. LOGGER.ply(act) .. " for " .. (reason and ("\"" .. reason .. "\"") or "no reason"), "darkrp")
	end)
	hook.Add("playerWarranted", "logger", function(crim, act, reason)
		LOGGER.log(LOGGER.ply(crim) .. " was warranted by " .. LOGGER.ply(act) .. " for " .. (reason and ("\"" .. reason .. "\"") or "no reason"), "darkrp")
	end)
end