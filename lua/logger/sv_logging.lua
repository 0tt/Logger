if LOGGER.config.enabled and LOGGER.config.writetofile then
	LOGGER.logfile = "logger/" .. os.date("%Y-%m-%d %H.%M.%S")
	if not file.IsDir("logger", "DATA") then
		file.CreateDir("logger")
	end
	file.Write(LOGGER.logfile .. ".txt", os.date() .. "\tBegan logging.")
end

function LOGGER.log(str, ...)
	if not (LOGGER.config.enabled and LOGGER.config.writetofile) or not str then
		return
	end
	local args = {...}
	if #args ~= 0 then
		for i = 1, #args do
			local sub = args[i]
			if not LOGGER.logfiles[sub] then
				file.Write(LOGGER.logfile .. "-" .. sub .. ".txt", os.date() .. "\tBegan logging.")
				LOGGER.logfiles[sub] = true
			end
			file.Append(LOGGER.logfile .. "-" .. sub .. ".txt", "\r\n" .. os.date() .. "\t" .. str)
		end
	end
	file.Append(LOGGER.logfile .. ".txt", "\r\n" .. os.date() .. "\t" .. str)
end