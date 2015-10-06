local tohide = { -- This is a table where the keys are the HUD items to hide
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true
}

local function HUDHider(name) -- This is a local function because all functions should be local unless another file needs to run it
	if (tohide[name]) then     -- If the HUD name is a key in the table
		return false      -- Return false.
	end
end
hook.Add("HUDShouldDraw", "HUDHider", HUDHider)

local hudconvar = CreateClientConVar("BRP_RedHud", 1, false, false)

function RedHUD()
	
	if hudconvar:GetInt() == 1 then
		local ply = LocalPlayer()
		local HP = ply:Health()
		local Armor = ply:Armor()
		
		if HP <= 0 then
			draw.RoundedBox(1, -5, -5, (ScrW()+10), (ScrH()+10), Color(0, 0, 0, 255 )  )
		end

		if HP <= 30 then
			draw.RoundedBox(1, -5, -5, (ScrW()+10), (ScrH()+10), Color(255, 0, 0, -HP + 70 )  )
		end
	end

end
hook.Add("HUDPaint", "RedHUD", RedHUD)

local bleachedhud =
	{
	 [ "$pp_colour_addr" ] = 0,
	 [ "$pp_colour_addg" ] = 0,
	 [ "$pp_colour_addb" ] = 0,
	 [ "$pp_colour_brightness" ] = 0,
	 [ "$pp_colour_contrast" ] = 1,
	 [ "$pp_colour_colour" ] = 0.3,
	 [ "$pp_colour_mulr" ] = 0,
	 [ "$pp_colour_mulg" ] = 0,
	 [ "$pp_colour_mulb" ] = 0
	}

function GM:RenderScreenspaceEffects()

 DrawColorModify( bleachedhud )

end