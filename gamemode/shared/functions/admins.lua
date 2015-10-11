local meta = FindMetaTable("Player")


RPAdmins = {"localhost", "Cruisin' to Uranus", "Haski"}



function meta:makeRPAdmin()

	local name = self:Nick()
	
	if self:isRPAdmin() then print(name.." is already an admin!"  )return end

	table.insert( RPAdmins, name )
	
	print(self:Name().. " has been promoted to admin!")

end

function getRPAdmins()
	
	local ads = {}

	for k, v in pairs(player.GetAll()) do
		if v:isRPAdmin() then table.insert(ads, v) end 
	end

	return ads

end



function meta:isRPAdmin()

	if self:IsAdmin() then return true end

	if table.HasValue( RPAdmins, self:Nick() ) then

		return true
	else
	
		return false
	end
	
end



function printRPAdmins()
	
	print( table.ToString(RPAdmins,"BraveRP Admins",true) )

end
concommand.Add( "BRP_PrintAdmins", printRPAdmins )


function getPlayers()

	

	local playertable = {}
	local x = 0
	
	for k, v in pairs( player.GetAll() ) do
		
		x = x + 1
		playertable[x] = v:GetName()
		x = x + 1
		playertable[x] = v:GetRPName()
		
	end
	
	print( table.ToString(playertable, "Player Name, RP Name", true) )

end