local meta = FindMetaTable("Player")

function meta:Register()

	if self:isRegistered() then return end

	local num = math.Round(math.Rand( 1, 10000 ))

	for k, v in pairs( player.GetAll() ) do
		if num == v:GetRegister() then
			num = math.Round(math.Rand( 1, 10000 ))
		end
	end
	
	self:RegisterCPID()
	
	self:SetNWString( "CITID", num )
	
	self:SendLua("notification.AddLegacy(\"You have been registered to #"..self:GetRegister()..".\", NOTIFY_GENERIC, 5)")
	
	print( self:GetRPName() .." has been registered to "..self:GetNWString( "CITID", "" ).."." )

end

function meta:RegisterCPID()

	if self:isCPIDRegistered() then return end

	local num = math.Round(math.Rand( 1, 1000 ))

	for k, v in pairs( player.GetAll() ) do
		if num == v:GetRegister() then
			num = math.Round(math.Rand( 1, 1000 ))
		end
	end
	
	self:SetNWString( "CPID", num )
	
	print( self:GetRPName() .." has been registered to CP."..self:GetNWString( "CPID", "" ).."." )

end

function meta:UnRegister()

	self:SetNWString( "CITID", "" )
	self:SetNWString( "CPID", "" )
	
	self:MakeUnwanted()

end

function meta:isRegistered()

	if self:GetNWString( "CITID", "" ) == "" then 
		return false
	end
	
	return true

end

function meta:isCPIDRegistered()

	if self:GetNWString( "CPID", "" ) == "" then 
		return false
	end
	
	return true

end


function meta:GetRegister()

	local num = self:GetNWString( "CITID", "" )
	
	if num == "" then return "" end
	
	if tonumber(num, 10) < 1000 then num = "0"..num end
	if tonumber(num, 10) < 100 then num = "00"..num end
	if tonumber(num, 10) < 10 then num = "000"..num end
	
	return num

end

function meta:GetCPRegister()

	local num = self:GetNWString( "CPID", "" )

	if num == "" then return "" end
	
	if tonumber(num, 10 ) < 100 then num = "0"..num end

	if tonumber(num, 10 ) < 10 then num = "00"..num end	
	
	return num

end

function meta:MakeWanted()

	self:SetNWBool("wanted", true )
	
	self:RemoveReqWanted()
	
	print( self:Name().." is now wanted." )

end


function GetPlayerNameID( id )

	for k, v in pairs( player.GetAll() ) do
	
		if v:GetRegister() == id then return v end
	
	end

end

function GetPlayerNameRPName( name )

	for k, v in pairs( player.GetAll() ) do
	
		if v:GetRPName() == name then return v end
	
	end

end

function meta:isWanted()

	return self:GetNWBool("wanted", false)

end

//CarCAr watned this badly
function meta:isWantedCaps()

	if (self:isWanted() == true) then
		return "True"
	else
		return "False"
	end

end


function meta:MakeUnwanted()

	self:SetNWBool("wanted", false )
	
	self:RemoveReqWanted()
	
	print( self:Name().." is now UNwanted." )

end


//POLICE FUNCTIONS

function UpdateAgenda( text )

	SetGlobalString("PAgenda", text) 
	
	for k, v in pairs( player.GetAll() ) do
	
		if !(table.HasValue( RPCops, v:GetRPRole())) then return end
	
		v:SendLua("notification.AddLegacy(\"The police agenda has been updated.\", NOTIFY_GENERIC, 5)")
	
	end

end

function GetAgenda()

	return GetGlobalString("PAgenda")

end

function meta:CreateWaypoint( name )

	local ent = ents.Create('brp_waypoint')
		ent:NewWaypoint( name )
		ent:SetPos( self:GetPos() )
		ent:Spawn()

end

function meta:TelePlayer(loc)

	self:MakeUnwanted()
	
	self:SetPos( GetGlobalVector(loc) )

	print(self:GetName().." has been teleported and is now unwanted")
end

function meta:CreateLocation(name)

	print(name.." has been set to "..tostring(self:GetPos()))

	SetGlobalVector( name, self:GetPos() )

end

function meta:ReqWanted( reason)
	
	print(self:GetName().." is wanted for "..reason)
	
	self:SetNWString( "WantReason", reason )
	self:SetNWBool("WantReq", true)
	

end

function meta:RemoveReqWanted()

	self:SetNWString( "WantReason", "" )
	self:SetNWBool("WantReq", false)

end