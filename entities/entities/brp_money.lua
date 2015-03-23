AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false


function ENT:Initialize()
	self:SetModel("models/props/cs_assault/money.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	phys:Wake()
end

function ENT:Use(ply)
	local amount = self:GetMMoney()

	ply:GiveMoney(	self:GetNWInt( "moneymoney") )
	self:Remove()
end

function ENT:SetMMoney( amount )

	self:SetNWInt( "moneymoney", amount )

end

function ENT:GetMMoney()

	self:GetNWInt( "moneymoney")

end