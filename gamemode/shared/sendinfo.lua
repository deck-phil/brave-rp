
if SERVER then

	util.AddNetworkString( "sendName" )
	util.AddNetworkString( "sendOutfit" )	
	util.AddNetworkString( "sendTitle" )
	util.AddNetworkString( "sendModel" )
	util.AddNetworkString( "sendOGModel" )
	util.AddNetworkString( "changeOGModel" )
	util.AddNetworkString( "dropWeapon" )
	util.AddNetworkString( "dropOutfit" )
	
	util.AddNetworkString( "sendWeapon" )
	util.AddNetworkString( "sendEnt" )

	util.AddNetworkString( "sendRegPlayer" )	

	util.AddNetworkString( "SendWantedPly" )

	util.AddNetworkString( "buyOutfit" )
	
	util.AddNetworkString( "SendDemote" )
	
	util.AddNetworkString( "SendPoliceAgenda" )	
	
	util.AddNetworkString( "SendWaypoint" )	
	
	util.AddNetworkString( "DeleteEnt" )	
	
	util.AddNetworkString( "TelePlayer" )
	
	util.AddNetworkString( "CreateLocation" )	
	
	util.AddNetworkString( "WantReq" )	
	
	util.AddNetworkString( "RemoveWantReq" )	
	

	net.Receive( "WantReq", function( len, ply )
	
			net.ReadEntity():ReqWanted( net.ReadString() )
			
	end )
	
	net.Receive( "RemoveWantReq", function( len, ply )

		net.ReadEntity():RemoveReqWanted()

	end)

	net.Receive( "TelePlayer", function( len, ply )
		local target = net.ReadEntity()
		local location = net.ReadString()
		
		target:TelePlayer( location )
		
	end )	

	net.Receive( "CreateLocation", function( len, ply )
		local name = net.ReadString()
		
		ply:CreateLocation( name )
		
	end )		
	
	net.Receive( "sendModel", function( len, ply )
		local path = net.ReadString()
		ply:SetRPModel( path )
	end )
	
	net.Receive( "sendOutfit", function( len, ply )
		local path = net.ReadString()
		
		ply:Freeze( true )
		timer.Create( ply:SteamID().."LoadingOutfit", defaultOutfitTime, 1, function() ply:Freeze( false ) ply:SetRPModel( path ) timer.Remove(ply:SteamID().."LoadingOutfit") end)
		
		function stopOutfit( victim )
		
			timer.Remove( victim:SteamID().."LoadingOutfit" )
			victim:Freeze( false ) 
		
		end
		hook.Add( "PlayerHurt", "stopOutfit", stopOutfit )
		
	end )

	net.Receive( "dropOutfit", function( len, ply )
		local path = net.ReadString()
		print('SNED PALYER' ..path)
		ply:DropOutfit( path )
	end )	
	
	net.Receive( "buyOutfit", function( len, ply )
		local path = net.ReadString()
		local price = net.ReadDouble()
		
		
		ply:TakeMoney( price )
		ply:CreateOutfit( path )
	end )	
	
	net.Receive( "SendWantedPly", function( len, ply )
		if net.ReadBool() then
			net.ReadEntity():MakeWanted()
		else
			net.ReadEntity():MakeUnwanted()
		end
	end )		
	
	
	net.Receive( "sendTitle", function( len, ply )
		ply:SetRPTitle( net.ReadString() )
	end )	
	
	net.Receive( "sendOGModel", function( len, ply )
		ply:SetOGModel( net.ReadString() )
		ply:GenerateCaste()
		ply:SendMsg("Visit ", Color(155,155,255), "BraveRP.com", Color(255,255,255)," to help us develop this gamemode!")
		ply:Freeze( false )
	end )
	
	net.Receive( "changeOGModel", function( len, ply )
		ply:UnRegister()
		ply:SetOGModel( net.ReadString() )
	end )	

	net.Receive( "sendName", function( len, ply )
		ply:SetRPName( net.ReadString() )
	end )		
	
	net.Receive( "dropWeapon", function( len, ply )
		SpawnWeapon( ply, net.ReadString() )		
	end )
	
	net.Receive( "sendWeapon", function( len, ply, pr )
		SpawnShipment( ply, net.ReadString(), net.ReadDouble() )		
	end )	
	
	net.Receive( "sendEnt", function( len, ply, pr )
		SpawnEntShipment( ply, net.ReadString(), net.ReadDouble(), net.ReadBool() )		
	end )	
	
	net.Receive( "sendRegPlayer", function( len, ply )
		net.ReadEntity():Register()		
	end )	
	
	net.Receive("SendDemote", function(len, ply)
		local target = net.ReadEntity()
		target:demoteRP()
	end)
	
	net.Receive("SendPoliceAgenda", function(len, ply)
		local str = net.ReadString()
		UpdateAgenda(str)
	end)	
	
	net.Receive("SendWaypoint", function (len, ply)
	
		local str = net.ReadString()
		ply:CreateWaypoint( str )
		
	end)
	
	net.Receive("DeleteEnt", function (len, ply)
	
		local enti = net.ReadString()
		
		for k, v in pairs( ents.GetAll() ) do
			if (v:GetClass() == "brp_waypoint") then
				if v:GetWaypointName() == enti then
					v:Remove()
				end
			end
		end
		
	end)	
		
	
elseif CLIENT then

	function SendName( name )
	
	    net.Start( "sendName" )
        net.WriteString( name )
		net.SendToServer()
	
	end
	
	function SendTitle( title )
	
	    net.Start( "sendTitle" )
        net.WriteString( title )
		net.SendToServer()
	
	end	
	
	function SendModel( model )
		
	    net.Start( "sendModel" )
        net.WriteString( model )
		net.SendToServer()
	
	end
	
	function SendOutfit( model, use, price )
	
	if use == "use" then
	
		net.Start("sendOutfit")
		net.WriteString( model )
		net.SendToServer()	
		//playShuffleNoise()
		LoadingOutfit(model)	
		
	elseif use == "drop" then
	
		net.Start("dropOutfit")
		net.WriteString( model )
		net.SendToServer()
		
	elseif use == "buy" then	
	
		net.Start("buyOutfit")
		net.WriteString( model )
		net.WriteDouble( price )
		net.SendToServer()			
	end
	
	end
	
	function SendCharCreation( name, title, model )
	
	    net.Start( "sendName" )
        net.WriteString( name )
		net.SendToServer()

	    net.Start( "sendTitle" )
        net.WriteString( title )
		net.SendToServer()
		
		net.Start( "sendModel" )
        net.WriteString( model )
		net.SendToServer()

	    net.Start( "sendOGModel" )
        net.WriteString( model )
		net.SendToServer()		
	
	end
	
	function SendGeneticSwap( name, model )
	
	    net.Start( "sendName" )
        net.WriteString( name )
		net.SendToServer()
		
		net.Start( "sendModel" )
        net.WriteString( model )
		net.SendToServer()

	    net.Start( "changeOGModel" )
        net.WriteString( model )
		net.SendToServer()		
	
	end	
	
	function dropWeapon( weapon )
	
	net.Start("dropWeapon")
	net.WriteString(weapon)
	net.SendToServer()
	
	end
	
	function SendWeapon( weapon, price )
	
	net.Start("sendWeapon")
	net.WriteString(weapon)
	net.WriteDouble(price)
	net.SendToServer()
	
	end	
	
	function SendEnt( ent, price, bool )
	
	net.Start("sendEnt")
	net.WriteString(ent)
	net.WriteDouble(price)
	net.WriteBool(bool)
	net.SendToServer()
	
	end	

	function SendRegPlayer( target )

	net.Start("sendRegPlayer")
	net.WriteEntity(target)
	net.SendToServer()
	
	end
	
	function SendWantedPly( target, bool )

	net.Start("SendWantedPly")
	net.WriteBool( bool )
	net.WriteEntity( target )
	net.SendToServer()
	
	end
	
	function SendDemote( target )

	if !(IsValid(target)) or !(target:Alive()) then return end
	
	net.Start("SendDemote")
	net.WriteEntity( target )
	net.SendToServer()
	
	end
	
	function SendPoliceAgenda( text )

	net.Start("SendPoliceAgenda")
	net.WriteString( text )
	net.SendToServer()
	
	end	
	
	function SendWaypoint( name)
	
	net.Start("SendWaypoint")
	net.WriteString(name)
	net.SendToServer()
	
	end
	
	function DeleteWaypoint( ent )
	
	net.Start("DeleteEnt")
	net.WriteString(ent)
	net.SendToServer()
	
	end	

	function TelePlayer( ply, location )
	
	net.Start("TelePlayer")
	net.WriteEntity(ply)
	net.WriteString(location)
	net.SendToServer()
	
	end	
	
	function SendLocation( name )
	
	net.Start("CreateLocation")
	net.WriteString(name)
	net.SendToServer()
	
	end		
	
	function SendWantedRequest( target, reason )
	print(target)
	net.Start("WantReq")
	net.WriteEntity(target)
	net.WriteString(reason)
	net.SendToServer()
	
	end	

	function RemoveWantedRequest( target )
	
	net.Start("RemoveWantReq")
	net.WriteEntity( target)
	net.SendToServer()
	
	end
	
end