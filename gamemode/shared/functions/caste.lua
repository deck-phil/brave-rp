local meta = FindMetaTable("Player")

function meta:GetCaste()

	return team.GetName( self:Team() )

end

function meta:SaveCaste()

	self:SetPData("SQLcaste", self:Team() )

end

function meta:LoadCaste()

	if not self:GetPData("SQLcaste") then return end

	self:SetTeam( self:GetPData("SQLcaste") )
	
end

function meta:GenerateCaste()

local casteChance = math.random(1,100)
local subChance = math.random(1,2)
local teamChance = math.random(1,10)
	
	
	self:SetWalkSpeed(defaultWalkSpeed)
	self:SetRunSpeed(defaultRunSpeed)	
	self:SetRPRole("null")
	
	if self:isRPAdmin() then self:SetUpCaste( 11 ) else self:SetUpCaste( teamChance ) end
	
	PlayerCol( self )

	CreateRPSalary(self)
	
	self:Give("rp_hands")		
	self:SetMoney( defaultMoney )	

end

function PlayerCol( ply )

	ply:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	timer.Create( ply:SteamID().."Col", 20, 1, function()

	UnPlayerCol( ply )
	
	end)

end

function UnPlayerCol( ply )
	
	if !(ply:IsValid()) then return end

	ply:SetCollisionGroup( COLLISION_GROUP_NONE )
	timer.Destroy( ply:SteamID().."Col" )

end
hook.Add( "PlayerDeath", "playerDeathCol", UnPlayerCol )
hook.Add( "PlayerDisconnected", "playerDisconnectCol", UnPlayerCol )

function meta:GetCasteColor()

	local t = self:Team()

	if t == 1 or t == 2 then
		return Vector(200/255, 200/255, 200/255)
	elseif t == 3 or t == 4 then
		return Vector(200/255, 0, 0)
	elseif t == 5 or t == 6 then
		return Vector(84/255, 1, 84/255)	
	elseif t == 7 or t == 8 then
		return Vector(1, 222/255, 166/255)
	elseif t == 9 or t == 10 then
		return  Vector(0, 0, 0)
	elseif t == 11 then
		return  Vector(0/255, 200/255, 255/255)		
	end
	
end 

function meta:GetPlayerCasteColor()

	local t = self:Team()

	if t == 1 or t == 2 then
		return Color(200, 200, 200, 255)
	elseif t == 3 or t == 4 then
		return Color(200, 0, 0, 255)
	elseif t == 5 or t == 6 then
		return Color(84, 255, 84, 255)	
	elseif t == 7 or t == 8 then
		return Color(255, 222, 166, 255)
	elseif t == 9 or t == 10 then
		return Color(0, 0, 0, 255)
	elseif t == 11 then
		return Color(0, 200, 255, 255)		
	end
	
end 

function meta:SetUpCaste( caste )

	self:SetTeam( caste )

	self:SetPlayerColor( self:GetCasteColor() )		

end