AddCSLuaFile()


function ENT:Initialize()
	//self:SetModel(self:GetNWString( "outfitmodel" ))
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	phys:Wake()
end

function ENT:Use(activator)

	//if activator:HasWeapon( self:GetNWString("outfitmodel") ) then return end

	if activator:AmountOfOutfits() +1 > maxOutfits then return end
	
	activator:UseOutfit( self:GetNWString( "outfitmodel") )
	self:Remove()
end

function ENT:NewOutfit( model )

	print(model)

	self:SetNWString( "outfitmodel", model )	
	self:SetModel("models/props_c17/BriefCase001a.mdl")

end

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false