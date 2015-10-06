GM.Name = "BraveRP"
GM.Author = "BolONYz"
GM.Email = "N/A"
GM.Website = "N/A"
DeriveGamemode( "sandbox" )

 ----SHARED----
 include("add.lua")
 include("shared/sendinfo.lua")
 include("shared/screeneffects.lua")
include("shared/props.lua")

 //functions
include("shared/functions/money.lua")
include("shared/functions/name.lua")
include("shared/functions/model.lua")
include("shared/functions/caste.lua")
include("shared/functions/dhc.lua")
include("shared/functions/outfits.lua")
include("shared/functions/roles.lua")
include("shared/functions/admins.lua")
 
 
 //derma
include("shared/derma/doormenu.lua")
include("shared/derma/charcreation.lua")
include("shared/derma/charmenu.lua")
include("shared/derma/paymenu.lua")
include("shared/derma/commandmenu.lua")

//add
include("shared/add/addmodel.lua")
include("shared/add/addammo.lua")
include("shared/add/addweapon.lua")


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
