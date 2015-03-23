AddCSLuaFile()


function ENT:Initialize()
	self:SetModel(self:GetNWString( "weaponpath" ))
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	phys:Wake()
end

function ENT:Use(activator)

	if activator:HasWeapon( self:GetNWString("weaponname") ) then return end

	activator:Give( self:GetNWString( "weaponname") )
	self:Remove()
end

function ENT:NewWeapon( weapon, path )

	self:SetNWString( "weaponname", weapon )
	self:SetNWString( "weaponmodel", path )	
	self:SetModel(path)

end

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false