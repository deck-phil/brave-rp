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
	self:SetNWInt( "remaining", 5 )
end

/*
if CLIENT then

	function ENT:Draw()

	self:DrawModel()
	
	cam.Start3D2D( self:LocalToWorld(Vector(0,5,25)), self:LocalToWorldAngles( Angle(0,0,0)), 1 )
		draw.DrawText( self:GetNWString( "shipmentweapon" ), "Trebuchet18", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
	cam.End3D2D()
	
	end

end*/

function Cooldown()

	CooldownBool = true
	print("Cd Started")
	timer.Simple( 1, function() CooldownBool = false print("CD Done") end)
end
	
function ENT:Use(activator,caller)
	if CooldownBool == true then return end
	if activator:HasWeapon(self:GetNWString( "shipmentweapon")) then return end
		
		Cooldown()
		
				if(activator:IsValid()) then
					activator:Give(self:GetNWString( "shipmentweapon"))
					self:SetNWInt( "remaining", self:GetNWInt( "remaining") - 1 )
				end
			if self:GetNWInt( "remaining") > 0 then
			
			else
				self:Remove()
		end
		
	end

function ENT:NewShipment( weapon )

	print(weapon)

	self:SetNWString( "shipmentweapon", weapon )	
	self:SetNWInt( "remaining", 5 )
	
end