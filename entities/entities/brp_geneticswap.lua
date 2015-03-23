AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Genetic Swap"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false


function ENT:Initialize()
	self:SetModel("models/Items/battery.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	phys:Wake()
end

function ENT:Use(ply)

	GeneticCreation(ply)
	
	self:Remove()
end