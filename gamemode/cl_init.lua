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
//Needs further investigation
function DisallowSpawnMenu()
	return true	
end
hook.Add( "SpawnMenuOpen", "DisallowSpawnMenu", DisallowSpawnMenu)

//No context menu
function GM:ContextMenuOpen()
	return false
end

//Players cant spawn SWEPs that arent in game
function GM:PlayerSpawnSWEP( ply, class, info )
 return false
end


//no targetID
function GM:HUDDrawTargetID() 
     return false
end

//CHat system + police radio
function GM:OnPlayerChat( ply, strText, bTeamOnly, bPlayerIsDead )
 
	local tab = {}
 
	//Cant talk if dead
	if ( bPlayerIsDead ) then
		strText = ""
	end
 
	//No team only
	if ( bTeamOnly ) then
		strText = ""
	end
	
	local name = ply:GetRPName()
	
	//Name replacer to Cop id
	if table.HasValue( ModelTech, OutfitsGetValue( "model", ply:GetRPModel(), "id")) then
		name = "CP."..ply:GetCPRegister()
	end
	
 
	if ( IsValid( ply ) ) then
	
		//table.insert( tab, team.GetColor(ply:Team() ))
		//print(strText)
		
		//OOC Chat
		if (string.sub( strText, 1, 2 ) == "//") then
		
			strText = string.sub(strText, 3)
		
			table.insert( tab, team.GetColor(ply:Team() ))
			table.insert( tab, "[OOC]"..ply:GetRPName() )
		
		// /r radio chat, only for cops oufits
		elseif (string.sub( strText, 1, 2 ) == "/r") and table.HasValue( RPCops, OutfitsGetValue( "model", ply:GetRPModel(), "id")) then
		
			strText = string.sub(strText, 3)
		
			table.insert( tab, team.GetColor(ply:Team() ))
			table.insert( tab, "[Radio]"..name )	 		
		else
		
		//else regular ol' chat
			table.insert( tab, team.GetColor(ply:Team() ))
			table.insert( tab, name )
			
		end
		
		//Change the colored text
		table.insert( tab, Color( 255, 255, 255 ) )		//White
		table.insert( tab, ": "..strText )
		table.insert( tab, Color( 255, 255, 255 ) )		//White
	else
		table.insert( tab, "Console" )
	end
 
	//Unpack the chat table and display
	table.insert( tab, Color( 255, 255, 255 ) )
 
	chat.AddText( unpack(tab) )
 
	return true
 
end

//functions to get a table of players
//Not sure why this exists
function getPlayers()

	local plylist = {}
	local x = 0

	for k,v in pairs(player.GetAll()) do	
		x = x + 1
		plylist[x] = v
	end
	
	return plylist

end