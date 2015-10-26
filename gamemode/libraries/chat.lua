
local meta = FindMetaTable("Player")

if SERVER then


	util.AddNetworkString("ColoredChat")

	function SendMsgAll( ... )
		
		net.Start( "ColoredChat" )
			net.WriteTable( { color_white, ... }  )
		net.Broadcast()

	end
	
	function meta:SendMsg( ... )
	
		net.Start( "ColoredChat" )
			net.WriteTable( { color_white, ... } )
		net.Send(self)
	end

elseif CLIENT then


	net.Receive("ColoredChat", function( len, ply ) 
		
		chat.AddText( unpack( net.ReadTable()) )
		
	end) 

end