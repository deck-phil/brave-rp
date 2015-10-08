local meta = FindMetaTable("Player")

//Set role players
function meta:SetRPRole( role )

	if !(HasRole( role )) then

	
		print(role..", that is not a valid role.")	
	return end
	
	self:SetNWString( "rprole", role )	
	
	//self:SetModel( self:GetOGModel() )
	//self:StripRoleWeapons()	
	self:GetRoleWeapons( role )
	
		if role == "dhc" then
			self:Register()
		end
	
	self:GetRoleOutfits( role )
	
	print(self:Name().." has been promoted to "..role)
	
	local roleName = ""
	
	for k, v in pairs(RPRoles) do
	
		if v["role"] == role then roleName = v.name end
	
	end
	
	self:SendLua("notification.AddLegacy(\"You have been promoted to "..roleName.."\", NOTIFY_GENERIC, 5)")	
	
end

//Get Role
function meta:GetRPRole()
	
	return self:GetNWString("rprole", "")
	
end

//Save for later sessions
function meta:SaveRPRole()

	self:SetPData("SQLrole", self:GetNWString("rprole") )

end

//Load from earlier sessions
function meta:LoadRPRole()

	self:SetNWInt("rprole", self:GetPData("SQLrole") )
	
end

//Checks to make sure, role is valid
function HasRole( role )
	
	for k, v in pairs( RPRoles ) do
		if ( v["role"] == role ) then
			return true
		end
	end	
		return false
end

//Get weapons specific to that role
function meta:GetRoleWeapons( role )
	
	//also give hands
	self:Give("rp_hands")
	
	//nothing more for nulls
	if role == "null" then return end
	
	//Also give basic tools
	self:Give("weapon_physgun")
	self:Give("weapon_physcannon")
	
	//Check the weapon list
	for k, v in pairs(RPRoles[role]["weps"]) do
		self:Give(v)
	end

end

//Weapon Strip
//Obsolete???
function meta:StripRoleWeapons()
	
	self:StripWeapons()
	
end

//Perma deaths the player
function meta:demoteRP()

	self:SetRPName("")
	
	DeleteRPSalary( self )
	
	self:UnRegister()
	
	self:CreateOutfitList()
	
	self:SetRPRole("null")
	self:StripRoleWeapons()
	
	self:KillSilent()
	
end