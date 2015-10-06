
if SERVER then

	function BuyRPAmmo( ply )

		local weapon = ply:GetActiveWeapon():GetClass()
		
		if weapon == "rp_hands" then return end
		if weapon == "weapon_physcannon" then return end
		if weapon == "weapon_physgun" then return end
		if weapon == "weapon_stunstick" then return end

		print(GetMaxAmmo(weapon))
		
		print(GetPrimaryAmmo(weapon))
		
		ply:GiveAmmo( GetMaxAmmo(weapon), GetPrimaryAmmo(weapon) )

	end
	
	function GetPrimaryAmmo( weapon)
	
		local wep = RPWeapons[weapon]
		
		return wep["priammo"]	
	
	end
	
	function GetMaxAmmo( weapon )
		
		local wep = RPWeapons[weapon]
		
		return wep["clipsize"]			
		
	end

concommand.Add("BRP_BuyAmmo", BuyRPAmmo)

elseif CLIENT then

end