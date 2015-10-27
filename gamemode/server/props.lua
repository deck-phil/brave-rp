
//Aw
local allowedModels = {} --All or part of model name.
allowedModels[1] = "models/props_c17/" 
allowedModels[2] = "models/props_junk/"
allowedModels[3] = "crane_frame.mdl"

//all tools that are allowed
local RPTools = {
	"remover",
	"weld",
	"colour",
	"material",
	"nocollide"
}


local function blockProps( ply, mdl )

	if ply:GetRPRole() == "null" then 
		ply:SendLua("notification.AddLegacy(\"You need to be a citizen to do that!\", NOTIFY_GENERIC, 5)") 
		ply:SendLua("notification.AddLegacy(\"Go see the DHC for more information.\", NOTIFY_GENERIC, 5)") 
	return false end
	
	if !(ply:canAfford( defaultPropPrice )) then return false end
			
	//Make sure its on the list, and make they pay
	for _, v in pairs( allowedModels ) do
		if string.find( mdl, v ) then
			ply:TakeMoney(defaultPropPrice)
			return true
		end
	end
	ply:SendLua("notification.AddLegacy(\"You are not allowed to spawn that.\", NOTIFY_GENERIC, 5)") 
	return false
end

//Sets player as RP Owner of that item.
hook.Add("PlayerSpawnedProp", "PropOwnerFunc", function(ply, model, ent) 

	ent:SetRPOwner( ply )
	
	print( ply:GetName().." spawned a "..tostring(ent).."  //  "..model )
	
end )

//Remover tool restrictions
hook.Add( "CanTool", "BlockRemoverandother", function( ply, tr, tool)

	//if !(table.HasValue( RPTools, tool )) then return false end

	if tool == "remover" and IsValid(tr.Entity) then

		print( ply:Name().." tried removing "..tostring(tr.Entity))
	
		if tr.Entity:IsDoor() then return false end
	
		return (tr.Entity:GetRPOwner() == ply )
	
	end
	
	print("true")
	
	return true
	
end)

//Admins can pickup players
//Players can only pickup their stuff
function EntPickup(ply, ent)
	/*
	if ply:isRPAdmin() and ent:GetClass():lower() == "player" then
		return true
	end
	
	if ply:isRPAdmin() then
		return true
	end*/
	
	if ((ent:GetRPOwner() == ply) or (ent:GetRPOwner():IsBuddy(ply))) then
		return true
	end
	
end
hook.Add("PhysgunPickup", "PhysgunPickupThing", EntPickup)

//Restrict all nongamemode weapons
local function RestrictWeapons(ply, class, weapon)
    return true
end

//Disable prop kill
function PlayerHit( ent, dmginfo )
    if ent:IsPlayer() and dmginfo:GetDamageType() == DMG_CRUSH then
        dmginfo:ScaleDamage( 0.0 )
        
    end
end
hook.Add( "EntityTakeDamage", "PlayerHit", PlayerHit )

hook.Add("PlayerSpawnSWEP", "RestrictWeapons", RestrictWeapons)
hook.Add("PlayerGiveSWEP", "RestrictWeapons", RestrictWeapons)

hook.Add( "PlayerSpawnProp", "blockProps", blockProps )



//Set the values
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