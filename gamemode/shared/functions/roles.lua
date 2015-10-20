local meta = FindMetaTable("Player")


function meta:SetRPRole( role )

	if !(HasRole( role )) then
		print(role..", that is not a valid role.")	
	return end
	
	self:GetRoleWeapons( role )
	if self:GetRPRole() == role then return end

	self:SetNWString( "rprole", role )	
	
	//self:SetModel( self:GetOGModel() )
	//self:StripRoleWeapons()	

	
	if role == "dhc" then
		self:Register()
	end
	
	self:GetRoleOutfits( role )
	
	print(self:Name().." has been promoted to "..role)
	
	local roleName = ""
	
	for k, v in pairs(RPRoles) do
	
		if v["role"] == role then roleName = v.name end
	
	end
	
	if role == "null" then
		self:SendLua("notification.AddLegacy(\"You have been demoted.\", NOTIFY_GENERIC, 5)")	
	else
		self:SendLua("notification.AddLegacy(\"You have been promoted to "..roleName..".\", NOTIFY_GENERIC, 5)")	
	end
	
end

function meta:GetRPRole()
	
	return self:GetNWString("rprole", "")
	
end

function meta:SaveRPRole()

	self:SetPData("SQLrole", self:GetNWString("rprole") )

end

function meta:LoadRPRole()

	self:SetNWInt("rprole", self:GetPData("SQLrole") )
	
end

function HasRole( role )
	
	for k, v in pairs( RPRoles ) do
		if ( v["role"] == role ) then
			return true
		end
	end	
		return false
end

function meta:GetRoleWeapons( role )
	
	self:Give("rp_hands")
	
	if role == "null" then return end
	
	self:Give("weapon_physgun")
	self:Give("weapon_physcannon")
	self:Give("gmod_tool")
	
	for k, v in pairs(RPRoles[role]["weps"]) do
		self:Give(v)
	end

end

function meta:StripRoleWeapons()
	
	self:StripWeapons()
	
end

function meta:demoteRP()

	self:SetRPName("")
	
	self:UnRegister()
	
	self:CreateOutfitList()
	
	self:SetRPRole("null")
	self:StripRoleWeapons()
	
	self:Kill()
	self:KillSilent()
	
end