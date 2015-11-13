include("shared.lua")
include("add.lua")

include("client/hovername.lua")	
include("client/hud.lua")
include("client/scoreboard.lua")
include("client/chat.lua")
include("client/icons.lua")

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