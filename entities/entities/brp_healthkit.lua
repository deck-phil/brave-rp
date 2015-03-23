AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Health Kit"
ENT.Author = "BolONYz"
ENT.Spawnable = true

function ENT:Initialize()
	self:SetModel("models/items/healthkit.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()

	phys:Wake()
end

function ENT:Use(activator,caller)
	if activator:Health() == 100 then return end
	
	activator:SetHealth( activator:Health() + 75 )
	if activator:Health() > 100 then activator:SetHealth(100) end
	
	sound.Play( "npc/vort/health_charge.wav", self:GetPos() )	
	
	self:Remove()
end