
local allowedModels = {} --All or part of model name.
allowedModels[1] = "models/props_c17/" 
allowedModels[2] = "models/props_junk/"
allowedModels[3] = "crane_frame.mdl"

local function blockProps( ply, mdl )

	if ply:GetRPRole() == "null" then 
		ply:SendLua("notification.AddLegacy(\"You need to be a citizen to do that!\", NOTIFY_GENERIC, 5)") 
		ply:SendLua("notification.AddLegacy(\"Go see the DHC for more information.\", NOTIFY_GENERIC, 5)") 
	return false end
	
	if !(ply:canAfford( defaultPropPrice )) then return false end
			
	for _, v in pairs( allowedModels ) do
		if string.find( mdl, v ) then
			ply:TakeMoney(defaultPropPrice)
			return true
		end
	end
	return false
end

hook.Add("PlayerSpawnedProp", "PropOwnerFunc", function(ply, model, ent) 

	ent:SetRPOwner( ply )
	
	print( ply:GetName().." spawned a "..tostring(ent).."  //  "..model )
	
end )

hook.Add("PlayerUse", "OpenDoorFunction", function( ply, ent) 

	if !IsValid(ent) then return end
	
	if ent:IsDoor() then
	
		if ent.IsLocked then 
		
			ent:EmitSound("doors/door_locked2.wav")
			return false 
			
		end
	end

end)

hook.Add( "CanTool", "BlockRemoverandother", function( ply, tr, tool)

	print( ply:Name().." tried removing "..tostring(tr.Entity))
	
	if tr.Entity:IsDoor() then return false end

	if tool == "remover" and IsValid(tr.Entity) then
	
		return (tr.Entity:GetRPOwner() == ply )
	
	end
	
end)

function EntPickup(ply, ent)
	/*
	if ply:isRPAdmin() and ent:GetClass():lower() == "player" then
		return true
	end
	
	if ply:isRPAdmin() then
		return true
	end*/
	
	if !(ent:GetRPOwner() == ply) then
		return false
	end
	
end
hook.Add("PhysgunPickup", "PhysgunPickupThing", EntPickup)

local function RestrictWeapons(ply, class, weapon)
    return ply:IsAdmin()
end
hook.Add("PlayerSpawnSWEP", "RestrictWeapons", RestrictWeapons)
hook.Add("PlayerGiveSWEP", "RestrictWeapons", RestrictWeapons)



hook.Add( "PlayerSpawnProp", "blockProps", blockProps )

RunConsoleCommand("sbox_maxragdolls", MaxRagdolls)
RunConsoleCommand("sbox_maxnpcs", MaxNPCs)
RunConsoleCommand("sbox_maxballoons", MaxBalloons)
RunConsoleCommand("sbox_maxeffects", MaxEffects)
RunConsoleCommand("sbox_maxdynamite", MaxDynamite)
RunConsoleCommand("sbox_maxlamps", MaxLamps)
RunConsoleCommand("sbox_maxwheels", MaxWheels)
RunConsoleCommand("sbox_maxthrusters", MaxThrusters)
RunConsoleCommand("sbox_maxhoverballs", MaxHoverballs)
RunConsoleCommand("sbox_maxvehicles", MaxVehicles)
RunConsoleCommand("sbox_maxbuttons", MaxButtons)
RunConsoleCommand("sbox_maxsents", MaxSENTS)
RunConsoleCommand("sbox_maxemitters", MaxEmitters)
RunConsoleCommand("sbox_maxspawners", MaxSpawners)
RunConsoleCommand("sbox_maxturrets", MaxTurrets)
