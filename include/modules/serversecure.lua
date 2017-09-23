require("serversecure.core")

local format, match, band, rshift = string.format, string.match, bit.band, bit.rshift

function serversecure.IPToString(uint)
	if not uint then
		return
	end

	local a, b, c, d =
		band(rshift(uint, 24), 0xFF),
		band(rshift(uint, 16), 0xFF),
		band(rshift(uint, 8), 0xFF),
		band(uint, 0xFF)
	return format("%d.%d.%d.%d", a, b, c, d)
end

function serversecure.StringToIP(str)
	if not str then
		return
	end

	local a, b, c, d = match(str, "^(%d+)%.(%d+)%.(%d+)%.(%d+)")
	if not d then
		return
	end

	return ((a * 256 + b) * 256 + c) * 256 + d
end

function serversecure.PostInitialize()
	print("[ServerSecure] serversecure.PostInitialize is deprecated since it's not needed anymore!")
	return true
end
