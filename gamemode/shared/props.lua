local prop = FindMetaTable("Entity")

function prop:SetRPOwner( ply )

	self:SetNWEntity("RPOwner", ply)

end

function prop:GetRPOwner()

	return self:GetNWEntity( "RPOwner" )

end


function prop:BuyDoor( ply )

	if self:IsDoor() then

		self:SetNWEntity( "RPOwner", ply )

	end
	
	ply:SendLua("notification.AddLegacy(\"You buy this door.\", NOTIFY_GENERIC, 5)")
	
	print( ply:GetRPName().." has bought "..tostring(self))
	
end

function prop:IsOwned()

	return IsValid(self:GetRPOwner())
	
end


function prop:IsDoor()

	return (table.HasValue(RPDoors, self:GetClass():lower() ))

end

function prop:LockDoor( ply )

	if !(self:IsDoor()) then return end
	
	if !(self:GetRPOwner() == ply) then return end
	
	self.IsLocked = true
	
	ply:SendLua("notification.AddLegacy(\"You lock your door.\", NOTIFY_GENERIC, 5)") 
	
	print( tostring(self).." is locked." )

end

function prop:UnLockDoor( ply )

	if !(self:IsDoor()) then return end
	
	if !(self:GetRPOwner() == ply) then return end
	
	self.IsLocked = false
	
	ply:SendLua("notification.AddLegacy(\"You unlock your door.\", NOTIFY_GENERIC, 5)") 
	
	print( tostring(self).." is UNlocked." )	

end