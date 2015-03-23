local meta = FindMetaTable("Player")

function meta:HasGasmask()

	return OutfitsGetValue( "model", self:GetRPModel(), "gasProof" )

end

if SERVER then

	function HardSomaEffectInit(ply)	
	
		if not IsValid(ply) then return end

		SendUserMessage("HardSomaEffect", ply, true)

		ply.isHardSomad = true
		ply:SetRunSpeed( 60 )
		ply:SetWalkSpeed(50)

		timer.Create(ply:UniqueID().."HardSomaTimer", 20, 1, function()
			UnHardSomaEffectInit(ply)
			ply:SetRunSpeed( defaultRunSpeed )
			ply:SetWalkSpeed( defaultWalkSpeed )
		end	)
		
	end
	
	function UnHardSomaEffectInit(ply)	
		
		SendUserMessage("HardSomaEffect", ply, false)
		
		ply.isHardSomad = false
		
		
		timer.Remove(ply:UniqueID().."HardSomaTimer")
		hook.Remove("PlayerDeath", ply)	
		
	end
	hook.Add("PlayerDeath", "UnHardSomaPlayer", function(ply) if ply.isHardSomad then UnHardSomaEffectInit(ply) end end)

	
	
	
	function SomaEffectInit(ply)	
	
		if (ply:HasGasmask()) then return end
		if not IsValid(ply) then return end

		SendUserMessage("SomaEffect", ply, true)

		ply.isSomad = true

		timer.Create(ply:UniqueID().."SomaTimer", 30, 1, function()
			UnSomaEffectInit(ply)
		end	)
		
	end
	
	function UnSomaEffectInit(ply)	
		
		SendUserMessage("SomaEffect", ply, false)
		
		ply.isSomad = false
		
		
		timer.Remove(ply:UniqueID().."SomaTimer")
		hook.Remove("PlayerDeath", ply)	
		
	end
	hook.Add("PlayerDeath", "UnSomaPlayer", function(ply) if ply.isSomad then UnSomaEffectInit(ply) end end)
	
	
	
	function MaskHUDInit(ply)	
		
		if !(ply:HasGasmask()) then UnMaskHUDInit(ply) return end
		
		SendUserMessage("MaskHUD", ply, true)
		
	end	
	
	function UnMaskHUDInit(ply)	
		SendUserMessage("MaskHUD", ply, false)
	end		
	
elseif CLIENT then

	local function SomaEffect(um)
	
		local toggle = um:ReadBool()

		if toggle then
			hook.Add("RenderScreenspaceEffects", "Somad", function()
	 
					local tab = {}
					tab[ "$pp_colour_addr" ] = 0
					tab[ "$pp_colour_addg" ] = 0
					tab[ "$pp_colour_addb" ] = 0
					tab[ "$pp_colour_brightness" ] = 0
					tab[ "$pp_colour_contrast" ] = 1
					tab[ "$pp_colour_colour" ] = 5
					tab[ "$pp_colour_mulr" ] = 0
					tab[ "$pp_colour_mulg" ] = 1
					tab[ "$pp_colour_mulb" ] = 1
					

					DrawMotionBlur( 0.1, 1, 0.05 )
	 
					DrawColorModify( tab )

			end)
		else
			hook.Remove("RenderScreenspaceEffects", "Somad")
		end
	end
	usermessage.Hook("SomaEffect", SomaEffect)
	
	
	
	
	local function HardSomaEffect(um)
		
		local toggle = um:ReadBool()

		if toggle then

			hook.Add("RenderScreenspaceEffects", "HardSomad", function() 
				
				local tab = {}
				tab[ "$pp_colour_addr" ] = 0
				tab[ "$pp_colour_addg" ] = 0
				tab[ "$pp_colour_addb" ] = 0
				tab[ "$pp_colour_brightness" ] = 0
				tab[ "$pp_colour_contrast" ] = 1
				tab[ "$pp_colour_colour" ] = 0
				tab[ "$pp_colour_mulr" ] = 0
				tab[ "$pp_colour_mulg" ] = 0
				tab[ "$pp_colour_mulb" ] = 0
						

				DrawMotionBlur( 0.1, 1, 0.05 )
		 
				DrawColorModify( tab )
			end)	
		else
			hook.Remove("RenderScreenspaceEffects", "HardSomad")
		end
	end
	usermessage.Hook("HardSomaEffect", HardSomaEffect)	
	
	
	
	
	
	
	local function MaskHUD(um)
	
		local toggle = um:ReadBool()

		if toggle then
			hook.Add("RenderScreenspaceEffects", "MaskOverlay", function()
	 
				//DrawMaterialOverlay("models/props_c17/fisheyelens", -0.03)
				DrawMaterialOverlay("effects/combine_binocoverlay", -0.06)

			end)
		else
			hook.Remove("RenderScreenspaceEffects", "MaskOverlay")
		end
	end
	usermessage.Hook("MaskHUD", MaskHUD)	
	
	
end