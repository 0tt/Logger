if LOGGER.config.enabled then
	if engine.ActiveGamemode() == "darkrp" then
		hook.Add("DarkRPFinishedLoading", "logger_bypass", function()
			local DarkRPlog = DarkRP.log
			function DarkRP.log(text, colour)
				LOGGER.log(text)
				DarkRPlog(text, colour)
			end
		end)
	else
		local sl = ServerLog
		function ServerLog(text)
			LOGGER.log(text)
			sl(text)
		end
	end
end