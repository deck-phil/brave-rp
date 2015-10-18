AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function SpawnSoma()
	
		local ply = Entity(1) 
		local tr = ply:GetEyeTrace() 
		local ent = ents.Create("brp_soma") 
		ent:SetPos(tr.HitPos) 
		if(ent:IsValid()) then
			ent:Spawn(ply, tr)
			print("Soma Spawned!")
			else
	end
	
end

function ENT:PhysicsCollide(tbl, col)

	local tar = tbl.HitEntity
	
	if !(tar:GetClass() == "brp_entshipment_base") then return end
	if !(string.lower(tar:GetNWString( "shipmententity")) == self:GetClass()) then return end

	if timer.Exists(self:GetCreationID().."restoreSoma") then return end
	
	timer.Create( self:GetCreationID().."restoreSoma", 1, 1, function()
	
	if table.HasValue(ents.FindInSphere(self:GetPos(), 3 ), tar) then
	
		tar:SetNWInt( "remaining", tar:GetNWString( "remaining") + 1)	
		self:Remove()
	end
	
	end)
	
end

local function UnDrugPlayer(ply)
	if not IsValid(ply) then return end
	ply.isDrugged = false
	local IDSteam = ply:UniqueID()

	timer.Remove(IDSteam.."Drugged")
	
	if ply:Health() > 100 then ply:SetHealth(100) end
	SendUserMessage("DrugEffects", ply, false)

	hook.Remove("PlayerDeath", ply)
end

hook.Add("PlayerDeath", "UndrugPlayers", function(ply) if ply.isDrugged then UnDrugPlayer(ply) end end)

local function DrugPlayer(ply)

	if not IsValid(ply) then return end

	SendUserMessage("DrugEffects", ply, true)

	ply.isDrugged = true

	local IDSteam = ply:UniqueID()
	
	if !(timer.Exists(IDSteam.."Drugged")) then
		ply:SetHealth(ply:Health() + 45 + 45)
		local i = 0
		timer.Create(IDSteam.."Drugged", 3, 45, function()
			if !(IsValid(ply)) then return end
			ply:SetHealth(ply:Health() - 3)
			i = i + 3
			if i ==  45 then
				UnDrugPlayer(ply)
				print("Soma is done")
			end
		end)
	end
end

function ENT:Initialize()
	self:SetModel("models/healthvial.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()

	phys:Wake()
end

function ENT:Use(activator,caller)
	if caller.isDrugged then return end
	DrugPlayer(caller)
	self:Remove()
end

function ENT:OnRemove()
end
