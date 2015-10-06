include("shared.lua")
include("add.lua")

include("client/hovername.lua")	
include("client/hud.lua")
include("client/scoreboard.lua")

local credits = [[
//*BraveRP*\\

A gamemode designed to
simulate the world of
Brave New World. A book
by Aldous Huxley.

-Lead Programmer-
BolONYz

-Lead Designer-
Cruisin' to Uranus
CHOPSWEE

-Special Thanks-
Haski]]

print(credits)

function DisallowSpawnMenu()
		return true	
end
hook.Add( "SpawnMenuOpen", "DisallowSpawnMenu", DisallowSpawnMenu)

function GM:ContextMenuOpen()
	return false
end

function GM:PlayerSpawnSWEP( ply, class, info )
 return false
end


//no targetID
function GM:HUDDrawTargetID() 
     return false
end

function GM:OnPlayerChat( ply, strText, bTeamOnly, bPlayerIsDead )
 
	local tab = {}
 
	if ( bPlayerIsDead ) then
		strText = ""
	end
 
	if ( bTeamOnly ) then
		strText = ""
	end
	
	local name = ply:GetRPName()
	
	if table.HasValue( ModelTech, OutfitsGetValue( "model", ply:GetRPModel(), "id")) then
		name = "CP."..ply:GetCPRegister()
	end
	
 
	if ( IsValid( ply ) ) then
	
		//table.insert( tab, team.GetColor(ply:Team() ))
		print(strText)
		if (string.sub( strText, 1, 2 ) == "//") then
		
			strText = string.sub(strText, 3)
		
			table.insert( tab, team.GetColor(ply:Team() ))
			table.insert( tab, "[OOC]"..ply:GetRPName() )
			
		elseif (string.sub( strText, 1, 2 ) == "/r") and table.HasValue( RPCops, OutfitsGetValue( "model", ply:GetRPModel(), "id")) then
		
			strText = string.sub(strText, 3)
		
			table.insert( tab, team.GetColor(ply:Team() ))
			table.insert( tab, "[Radio]"..name )	 		
		else
		
			table.insert( tab, team.GetColor(ply:Team() ))
			table.insert( tab, name )
			
		end
		
		table.insert( tab, Color( 255, 255, 255 ) )		
		table.insert( tab, ": "..strText )
		table.insert( tab, Color( 255, 255, 255 ) )		
	else
		table.insert( tab, "Console" )
	end
 
	table.insert( tab, Color( 255, 255, 255 ) )
 
	chat.AddText( unpack(tab) )
 
	return true
 
end

function getPlayers()

	local plylist = {}
	local x = 0

	for k,v in pairs(player.GetAll()) do	
		x = x + 1
		plylist[x] = v
	end
	
	return plylist

end