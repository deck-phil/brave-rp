include("shared.lua")

function ENT:Initialize()
end

function ENT:Think()
end

local function drugEffects(um)
	local toggle = um:ReadBool()

	if toggle then
		hook.Add("RenderScreenspaceEffects", "drugged", function()
 
				local tab = {}
				tab[ "$pp_colour_addr" ] = 0
				tab[ "$pp_colour_addg" ] = 0
				tab[ "$pp_colour_addb" ] = 0
				tab[ "$pp_colour_brightness" ] = 0
				tab[ "$pp_colour_contrast" ] = 1.2
				tab[ "$pp_colour_colour" ] = 1.7
				tab[ "$pp_colour_mulr" ] = 1
				tab[ "$pp_colour_mulg" ] = 1
				tab[ "$pp_colour_mulb" ] = 1 
 
				DrawColorModify( tab )
				
				//DrawMotionBlur( 0.5, 1, 0 )

		end)
	else
		hook.Remove("RenderScreenspaceEffects", "drugged")
	end
end
usermessage.Hook("DrugEffects", drugEffects)