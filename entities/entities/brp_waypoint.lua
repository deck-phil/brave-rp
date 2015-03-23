AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Waypoint"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false


function ENT:Initialize()
	self:SetModel("models/props_c17/doll01.mdl")
	self:PhysicsInit(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	
	self:SetColor( Color(0,0,0,0))
	self:SetRenderMode( RENDERMODE_TRANSALPHA ) 
end

function ENT:NewWaypoint( name )

	self:SetNWString( "name", name )

end

function ENT:GetWaypointName()

	return self:GetNWString( "name")

end