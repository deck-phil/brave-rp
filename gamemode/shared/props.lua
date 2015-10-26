local prop = FindMetaTable("Entity")

function prop:SetRPOwner( ply )

	self:SetNWEntity("RPOwner", ply)

end

function prop:GetRPOwner()

	return self:GetNWEntity( "RPOwner" )

end

function prop:GetDoorName()

	if self:GetNWString("DoorName") == "" then return self:GetRPOwner():GetRPName() end
	
	return self:GetNWString("DoorName")

end

function prop:BuyDoor( ply )

	if !(self:IsDoor()) then return end

	self:SetNWEntity( "RPOwner", ply )
	
	ply:SendLua("notification.AddLegacy(\"You buy this door.\", NOTIFY_GENERIC, 5)")
	
	ply:TakeMoney(defaultBuyDoorPrice)
	
	print( ply:GetRPName().." has bought "..tostring(self))
	
end


function prop:SellDoor( ply )

	if !(self:IsDoor()) then return end

	self:SetNWEntity( "RPOwner", NULL )
	
	self:SetNWString("DoorName", "" ) 
	
	self:ServerUnlock()

	ply:SendLua("notification.AddLegacy(\"You sell this door.\", NOTIFY_GENERIC, 5)")
	
	ply:GiveMoney(defaultSellDoorPrice)
	
	print( ply:GetRPName().." has sold "..tostring(self))
	
end


function prop:IsOwned()

	return IsValid(self:GetRPOwner())
	
end


function prop:IsDoor()

	return (table.HasValue(RPDoors, self:GetClass():lower() ))

end

function prop:LockDoor( ply )

	if !(self:IsDoor()) then return end
	
	if !((self:GetRPOwner() == ply) or (table.HasValue(self.Groups, ply)) )then return end
	
	self.IsLocked = true
	
	self:Fire("lock", "", 0)
	
	ply:SendLua("notification.AddLegacy(\"You lock your door.\", NOTIFY_GENERIC, 5)") 
	
	print( tostring(self).." is locked." )

end

function prop:UnLockDoor( ply )

	if !(self:IsDoor()) then return end
	
	if !((self:GetRPOwner() == ply) or (table.HasValue(self.Groups, ply)) )then return end
	
	self.IsLocked = false
	
	self:Fire("unlock", "", 0)
	
	ply:SendLua("notification.AddLegacy(\"You unlock your door.\", NOTIFY_GENERIC, 5)") 
	
	print( tostring(self).." is UNlocked." )	

end

function prop:ServerUnlock()

	if !(self:IsDoor()) then return end

	self.IsLocked = false
	
	self:Fire("unlock", "", 0)
	
	print( tostring(self).." is UNlocked." )		
end

