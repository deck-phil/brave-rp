
//CHat system + police radio
function GM:OnPlayerChat( ply, strText, bTeamOnly, bPlayerIsDead )
 
	local tab = {}
 
	//Cant talk if dead
	if ( bPlayerIsDead ) then
		return false
	end
 
	//No team only
	if ( bTeamOnly ) then
		return false
	end
	
	local name = ply:GetRPName()
	
	//Name replacer to Cop id
	if table.HasValue( ModelTech, OutfitsGetValue( "model", ply:GetRPModel(), "id")) then
		name = "CP."..ply:GetCPRegister()
		sound.Play( table.Random(CopNoise), ply:GetPos(), 75, 100)
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
		table.insert( tab, Color( 135, 135, 135 ) )		//White
		table.insert( tab, " says " )
		table.insert( tab, Color( 255, 255, 255 ) )		//White
		table.insert( tab, "\""..string.TrimLeft(strText, " ").."\"" )	
	else
		table.insert( tab, "Console" )
	end
 
	//Unpack the chat table and display
	table.insert( tab, Color( 255, 255, 255 ) )
 
	chat.AddText( unpack(tab) )
 
	return true
 
end