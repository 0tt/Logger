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
	if #args ~= 0 then --Category, put in master file + category files
		for i = 1, #args do
			local sub = args[i]
			sub = string.gsub(sub, "[\\/:*?\"<>|]", "_")
			if not LOGGER.logfiles[sub] then
				file.Write(LOGGER.logfile .. "-" .. sub .. ".txt", os.date() .. "\tBegan logging.")
				LOGGER.logfiles[sub] = true
			end
			file.Append(LOGGER.logfile .. "-" .. sub .. ".txt", "\r\n" .. os.date() .. "\t" .. str)
		end
	else --No category, put in all logfiles
		for sub in pairs(LOGGER.logfiles) do
			file.Append(LOGGER.logfile .. "-" .. sub .. ".txt", "\r\n" .. os.date() .. "\t" .. str)
		end
	end
	file.Append(LOGGER.logfile .. ".txt", "\r\n" .. os.date() .. "\t" .. str)
end