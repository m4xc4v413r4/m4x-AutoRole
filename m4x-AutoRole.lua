local frame = CreateFrame("Frame", "m4xRoleFrame", UIParent)

frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function GetValues()
	local spec = GetSpecialization()
	local role = GetSpecializationRole(spec)

	if role == "TANK" then
		SetLFGRoles(false,true,false,false)
	elseif role == "HEALER" then
		SetLFGRoles(false,false,true,false)
	elseif role == "DAMAGER" then
		SetLFGRoles(false,false,false,true)
	end
end

frame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		C_Timer.After(10, GetValues)
		frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
		frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
	else
		GetValues()
	end
end)