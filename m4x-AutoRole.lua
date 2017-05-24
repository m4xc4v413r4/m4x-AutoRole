local frame = CreateFrame("Frame", "m4xRoleFrame", UIParent)

frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function GetValues()
	frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

	local spec = GetSpecialization()
	local role = GetSpecializationRole(spec)

	if role == "TANK" then
		SetLFGRoles(false,true,false,false)
	elseif role == "HEALER" then
		SetLFGRoles(false,false,true,false)
	else
		SetLFGRoles(false,false,false,true)
	end
end

frame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		C_Timer.After(10, GetValues)
	else
		GetValues()
	end
end)