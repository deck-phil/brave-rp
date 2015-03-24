GM.Name = "BraveRP"
GM.Author = "BolONYz"
GM.Email = "N/A"
GM.Website = "N/A"
DeriveGamemode( "sandbox" )

//Include Other Files
include("shared/money.lua")
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
include("server/admins.lua")
include("shared/addammo.lua")

include("shared/dhc.lua")

include("shared/outfits.lua")

include("shared/screeneffects.lua")

include("shared/props.lua")

include("shared/doormenu.lua")

include("add.lua")


include("server/roles.lua")

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

//Caste System
team.SetUp( 1, "Alpha Plus", Color(200, 200, 200) )
team.SetUp( 2, "Alpha Minus", Color(200, 200, 200) )

team.SetUp( 3, "Beta Plus", Color(200, 0, 0) )
team.SetUp( 4, "Beta Minus", Color(200, 0, 0) )

team.SetUp( 5, "Gamma Plus", Color(84, 255, 84) )
team.SetUp( 6, "Gamma Minus", Color(84, 255, 84) )

team.SetUp( 7, "Delta Plus", Color(255, 222, 166) )
team.SetUp( 8, "Delta Minus", Color(255, 222, 166) )

team.SetUp( 9, "Epsilon Plus", Color(0, 0, 0) )
team.SetUp( 10, "Epsilon Minus", Color(0, 0, 0) )

team.SetUp( 11, "Omega Plus", Color(0,200,255,255))
