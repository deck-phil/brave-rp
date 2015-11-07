//Base files
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("add.lua")

include("config.lua")
include("shared.lua")
include("add.lua")

		----SERVER FILES----
AddCSLuaFile("server/chatcommands.lua")
AddCSLuaFile("server/props.lua")
AddCSLuaFile("server/concommands.lua")

include("server/chatcommands.lua")
include("server/props.lua")
include("server/concommands.lua")


		----SHARED FILES----
AddCSLuaFile("shared/screeneffects.lua")
AddCSLuaFile("shared/sendinfo.lua")
AddCSLuaFile("shared/props.lua")

include("shared/sendinfo.lua")
include("shared/screeneffects.lua")
include("shared/props.lua")

//FUNCTIONS
AddCSLuaFile("shared/functions/money.lua")
AddCSLuaFile("shared/functions/dhc.lua")
AddCSLuaFile("shared/functions/name.lua")
AddCSLuaFile("shared/functions/model.lua")
AddCSLuaFile("shared/functions/caste.lua")
AddCSLuaFile("shared/functions/outfits.lua")
AddCSLuaFile("shared/functions/admins.lua")
AddCSLuaFile("shared/functions/roles.lua")
AddCSLuaFile("shared/functions/health.lua")
AddCSLuaFile("shared/functions/buddy.lua")
AddCSLuaFile("shared/functions/doors.lua")

include("shared/functions/money.lua")
include("shared/functions/dhc.lua")
include("shared/functions/name.lua")
include("shared/functions/model.lua")
include("shared/functions/caste.lua")
include("shared/functions/outfits.lua")
include("shared/functions/admins.lua")
include("shared/functions/roles.lua")
include("shared/functions/health.lua")
include("shared/functions/buddy.lua")
include("shared/functions/doors.lua")


//DERMA
AddCSLuaFile("shared/derma/charmenu.lua")
AddCSLuaFile("shared/derma/paymenu.lua")
AddCSLuaFile("shared/derma/charcreation.lua")
AddCSLuaFile("shared/derma/commandmenu.lua")
AddCSLuaFile("shared/derma/rulesmenu.lua")
AddCSLuaFile("shared/derma/doormenu.lua")

include("shared/derma/charcreation.lua")
include("shared/derma/charmenu.lua")
include("shared/derma/paymenu.lua")
include("shared/derma/commandmenu.lua")
include("shared/derma/rulesmenu.lua")
include("shared/derma/doormenu.lua")

//ADD
AddCSLuaFile("shared/add/addmodel.lua")
AddCSLuaFile("shared/add/addweapon.lua")
AddCSLuaFile("shared/add/addammo.lua")

include("shared/add/addmodel.lua")
include("shared/add/addweapon.lua")
include("shared/add/addammo.lua")

		----CLIENT FILES----
AddCSLuaFile("client/hovername.lua")
AddCSLuaFile("client/hud.lua")
AddCSLuaFile("client/scoreboard.lua")
AddCSLuaFile("client/chat.lua")


----Library files -----

AddCSLuaFile("libraries/chat.lua")
include("libraries/chat.lua")


function GM:PlayerConnect( name, ip )

	//Cool message when spawning
	PrintMessage(  HUD_PRINTTALK, "" .. name .. " is being conditioned.")
	
end

function GM:PlayerSpawn( ply )
	
	//To avoid spawn clusters
	ply:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	//Jimmy watned flash
	ply:AllowFlashlight( true )
	
	//If they have not authed, and permad
	if ply:GetRPName() == "" then
		ply:Freeze( true )
	end
	if ply:Deaths() > 0 then
		CharMenu( ply )	
	end
	
	//Classic hands code
	ply:SetupHands()
	

	
	//To avoid spawn clusters	
	ply:SetPos(ply:LocalToWorld(Vector(math.Rand(50,400),0,0)))
	
	//If they werent permad, keep their role
	if not ply:GetRPRole() then return end
	ply:SetRPRole( ply:GetRPRole() )
	ply:Give("gmod_camera")	
end

//Classic hands
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
	
	//default model, to prevent no model error
	ply:SetModel(defaultModel)
	
	//Load values
	/*
	ply:LoadMoney()
	ply:LoadRPName()
	ply:LoadRPModel()
	ply:LoadCaste()
	*/
	
	CharMenu( ply )
end

function GM:PlayerDisconnected( ply )

	//Save values
	/*
	ply:SaveMoney()
	ply:SaveRPName()
	ply:SaveRPModel()
	ply:SaveCaste()
	*/
	
	timer.Start(ply:SteamID()..":Timeout",timeoutTime,1, function()
	
	if ply:IsValid() then timer.Destroy(ply:SteamID()) return end
	
	for k,v in pairs(ents.GetAll())do
	
		if v:GetRPOwner() == ply then
		
			if v:IsDoor() then v:SellDoor( ply ) continue end
		
			v:Remove()
		
		end
	
	end
	
	end)
	
end

function GM:PlayerDeath( victim, inflictor, attacker )

	//Death indicators
	
    if ( victim == attacker ) then
        //PrintMessage( HUD_PRINTTALK, victim:GetRPName() .. " committed suicide." )
    else
		if (attacker:IsPlayer()) then
			print( victim:GetRPName() .. " was killed by " .. attacker:GetRPName() .. "." )
		end
	end
end

function GM:DoPlayerDeath( ply, attacker, dmginfo )

	ply:CreateRagdoll()

	ply:AddDeaths( 1 )
	
	if ( attacker == ply ) then return end
	
	if ( attacker:IsValid() && attacker:IsPlayer() ) then
	
		if ( attacker == ply ) then
			attacker:AddFrags( -1 )
		else
			attacker:AddFrags( 1 )
		end
	
	end

end


//Distant voices
hook.Add("PlayerCanHearPlayersVoice", "Wat" , function( p1, p2 )  
    return (p1:GetPos():Distance(p2:GetPos()) <= 500), true 
end ) 

//Can hear chat?
hook.Add("PlayerCanSeePlayersChat", "DoubleWat", function(text, teamBool, p1, p2)
	
	if string.sub(text, 1, 2) == "//" then
		//all can hear ooc
		return true
	end
	
	if string.sub(text, 1, 2) == "/r" then
		
		//Only cops can hear radio
		if !table.HasValue( RPCops, OutfitsGetValue( "model", p1:GetRPModel(), "id")) then return false end
	
		if table.HasValue( RPCops, OutfitsGetValue( "model", p2:GetRPModel(), "id")) then
			return true
		end
		
	end	

	//else, only in a radius
	return (p1:GetPos():Distance(p2:GetPos()) <= 500) 
	
end)