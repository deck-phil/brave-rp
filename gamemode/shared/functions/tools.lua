
hook.Add("CanTool", "BlockSomeTools", function(ply, tr, tool)

	if table.HasValue( RPDoors, tr.Entity:GetClass()) then return false end

	if ply:isRPAdmin() then
	
		if tool == "remover" and IsValid( tr.Entity ) and tr.Entity:GetClass() == "prop_door_rotating" then
			return false
		end
	
	else

		if tool == "remover" and IsValid( tr.Entity ) and tr.Entity:GetRPOwner() == ply then
		
			notification.AddLegacy( "You can't use that tool on that!", NOTIFY_HINT, 5 )
			return false
		end
		
	end
	
	notification.AddLegacy( "You can't use that tool!", NOTIFY_HINT, 5 )
	
	return false
	
end)