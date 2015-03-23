AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Shipment"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false


function ENT:Initialize()
	self:SetModel("models/items/item_item_crate.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	phys:Wake()
	
	CooldownBool = false
	i = 5
end

function Cooldown()

	CooldownBool = true
	print("Cd Started")
	timer.Simple( 1, function() CooldownBool = false print("CD Done") end)
end
	
function ENT:Use(activator,caller)
	if CooldownBool == true then return end
		
		Cooldown()
	
			local ent = ents.Create(self:GetNWString( "shipmententity")) 
			local epos = self:GetPos()
		
				if(ent:IsValid()) then
					ent:SetPos(self:LocalToWorld(Vector(0, 0,20)))
					ent:Spawn()
					self:SetNWInt( "remaining", self:GetNWInt("remaining") - 1 )
				end
			if self:GetNWInt("remaining") > 0 then
			
			else
				self:Remove()
	end
		
end

function ENT:NewShipment( ent )

	self:SetNWString( "shipmententity", ent )
	self:SetNWInt( "remaining", 5 )	

end