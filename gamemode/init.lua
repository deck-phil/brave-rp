//Base files
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")

include("config.lua")
include("shared.lua")

//Add Other Files
AddCSLuaFile("shared/money.lua")

AddCSLuaFile("shared/dhc.lua")

AddCSLuaFile("shared/name.lua")
AddCSLuaFile("shared/model.lua")
AddCSLuaFile("shared/caste.lua")
AddCSLuaFile("shared/charcreation.lua")
AddCSLuaFile("shared/charmenu.lua")
AddCSLuaFile("shared/paymenu.lua")
AddCSLuaFile("shared/commandmenu.lua")
AddCSLuaFile("shared/addmodel.lua")

AddCSLuaFile("shared/screeneffects.lua")

AddCSLuaFile("shared/sendinfo.lua")
AddCSLuaFile("shared/stamina.lua")
AddCSLuaFile("shared/addweapon.lua")
AddCSLuaFile("shared/addammo.lua")

AddCSLuaFile("server/admins.lua")
AddCSLuaFile("server/chatcommands.lua")
AddCSLuaFile("server/roles.lua")
AddCSLuaFile("server/props.lua")

AddCSLuaFile("server/concommands.lua")

AddCSLuaFile("shared/outfits.lua")

AddCSLuaFile("shared/props.lua")

AddCSLuaFile("shared/doormenu.lua")

AddCSLuaFile("client/hovername.lua")
AddCSLuaFile("client/hud.lua")

AddCSLuaFile("client/scoreboard.lua")
AddCSLuaFile("add.lua")

//Include Other Files
include("shared/money.lua")

include("shared/dhc.lua")

include("shared/name.lua")
include("shared/model.lua")
include("shared/caste.lua")
include("shared/charcreation.lua")
include("shared/charmenu.lua")
include("shared/paymenu.lua")
include("shared/addmodel.lua")
include("shared/commandmenu.lua")
include("shared/sendinfo.lua")
include("shared/stamina.lua")
include("shared/addweapon.lua")
include("shared/addammo.lua")

include("shared/screeneffects.lua")

include("server/admins.lua")
include("server/chatcommands.lua")
include("server/roles.lua")
include("server/props.lua")

include("shared/outfits.lua")

include("shared/props.lua")

include("shared/doormenu.lua")

include("server/concommands.lua")

include("add.lua")



function GM:PlayerConnect( name, ip )

	PrintMessage(  HUD_PRINTTALK, "" .. name .. " is being conditioned.")
	
end

function GM:PlayerSpawn( ply )
	
	ply:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	ply:Freeze( true )
	
	ply:SetRunSpeed( defaultRunSpeed )
	ply:SetWalkSpeed( defaultWalkSpeed )	
	
	ply:AllowFlashlight( true )
	
	if ply:Deaths() > 0 then
		CharMenu( ply )
	end
	
	ply:SetupHands()
	
	ply:SetPos(ply:LocalToWorld(Vector(math.Rand(50,400),0,0)))
	
	ply:SetRPRole( ply:GetRPRole() )
	
end

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end

function GM:PlayerAuthed( ply, steamID, uniqueID )
	
	print("Player: " .. ply:Nick() .. ", has gotten authed.")	
	ply:SetModel(defaultModel)
	/*
	ply:LoadMoney()
	ply:LoadRPName()
	ply:LoadRPModel()
	ply:LoadCaste()
	*/
	CharMenu( ply )
end

function GM:PlayerDisconnected( ply )
	/*
	ply:SaveMoney()
	ply:SaveRPName()
	ply:SaveRPModel()
	ply:SaveCaste()
	*/
end

function GM:PlayerDeath( victim, inflictor, attacker )

    if ( victim == attacker ) then
        //PrintMessage( HUD_PRINTTALK, victim:GetRPName() .. " committed suicide." )
    elseif (attacker:IsPlayer()) then
        print( victim:GetRPName() .. " was killed by " .. attacker:GetRPName() .. "." )
    end
	
end


hook.Add("PlayerCanHearPlayersVoice", "Wat" , function( p1, p2 )  
    return (p1:GetPos():Distance(p2:GetPos()) <= 500) 
end ) 

hook.Add("PlayerCanSeePlayersChat", "DoubleWat", function(text, teamBool, p1, p2)
	
	if string.sub(text, 1, 2) == "//" then
		return true
	end
	
	if string.sub(text, 1, 2) == "/r" then
	
		if !table.HasValue( RPCops, OutfitsGetValue( "model", p1:GetRPModel(), "id")) then return false end
	
		if table.HasValue( RPCops, OutfitsGetValue( "model", p2:GetRPModel(), "id")) then
			return true
		end
		
	end	

	return (p1:GetPos():Distance(p2:GetPos()) <= 500) 
	
end)