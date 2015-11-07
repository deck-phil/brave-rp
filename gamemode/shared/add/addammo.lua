
if SERVER then

	function BuyRPAmmo( ply )

		local weapon = ply:GetActiveWeapon():GetClass()
		
		if weapon == "rp_hands" then return end
		if weapon == "weapon_physcannon" then return end
		if weapon == "weapon_physgun" then return end
		if weapon == "weapon_stunstick" then return end

		ply:GiveAmmo( RPWeapons[weapon].clipsize, RPWeapons[weapon].priammo )

	end
	
concommand.Add("BRP_BuyAmmo", BuyRPAmmo)

elseif CLIENT then

end