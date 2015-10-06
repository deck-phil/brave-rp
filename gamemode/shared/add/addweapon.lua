
if SERVER then

	function SpawnShipment( ply, weapon, price )

		ply:TakeMoney( price)
	
		local ent = ents.Create('brp_shipment_base')
			ent:SetPos( ply:LocalToWorld(Vector(35, 0,0)))
			ent:NewShipment( weapon )
			ent:Spawn()

	end

	function SpawnEntShipment( ply, entity, price, bool )

		ply:TakeMoney( price)
		
		local ent = Entity
		
		if bool then	
			ent = ents.Create('brp_entshipment_base')
			ent:SetPos( ply:LocalToWorld(Vector(35, 0,0)))
			ent:NewShipment( entity )
		else
			ent = ents.Create(entity)
			ent:SetPos( ply:LocalToWorld(Vector(35, 0,0)))
		end
			ent:Spawn()

	end

	function DropWeapon( ply )
		
		if ply:GetActiveWeapon():GetClass() == "rp_hands" then return end
		if ply:GetActiveWeapon():GetClass() == "weapon_physcannon" then return end
		if ply:GetActiveWeapon():GetClass() == "weapon_physgun" then return end
		
		print(ply:GetActiveWeapon():Clip1())
		
		if (GetMaxAmmo(ply:GetActiveWeapon():GetClass()) > (ply:GetActiveWeapon():Clip1())) then return ply:SendLua("notification.AddLegacy(\"You can't drop a weapon without a full clip.\", NOTIFY_GENERIC, 5)")	end
		
		local trace = ply:GetEyeTraceNoCursor()
		local spawnpos = trace.HitPos
		
		local ent = ents.Create('brp_weapon_base')
			ent:NewWeapon( ply:GetActiveWeapon():GetClass(), ply:GetActiveWeapon():GetModel() )
			ent:SetPos( ply:LocalToWorld(Vector(35, 0,0)))
			ent:Spawn()
						

			ply:StripWeapon(ply:GetActiveWeapon():GetClass())
			
	end

concommand.Add("BRP_DropWeapon", DropWeapon)

elseif CLIENT then

	/* List of Roles
	RProles[0] = "null"	
	RProles[1] = "police"
	RProles[2] = "citizen"
	RProles[3] = "dhc"
	RProles[4] = "watcher"
	RProles[5] = "headpolice"
	RProles[6] = "distributer"
	RProles[7] = "medic"
	*/

	function getAvailWeapons(ply)

		local availweapons = {}
		local plyrole = ply:GetRPRole()
		local w = 0
		
		for k,v in pairs(RPWeapons) do	
			if v.role == plyrole then
				w = w + 1				
				availweapons[w] = v
			end
		end
		
		return availweapons

	end
	
	function getAvailEntities(ply)

		local availents = {}
		local plyrole = ply:GetRPRole()
		local w = 0
		
		for k,v in pairs(RPEnts) do	
			if v.role == plyrole then
				w = w + 1
				availents[w] = v
			end
		end
		
		return availents

	end
	
function getAvailBuyModel(ply)

		local availout = {}
		local plyrole = ply:GetRPRole()
		local w = 0
		
		for k,v in pairs(RPBuyOutfits) do	
		
			if v.role == plyrole and v.id == "rebel" then
				w = w + 1
				availout[w] = v
				availout[w].showModel = v.model..""..ply:GetOGModelType()
				
			elseif v.role == plyrole then
				w = w + 1
				availout[w] = v
				availout[w].showModel = v.model
			end
		end
		
		return availout

	end		
	
end