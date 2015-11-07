if SERVER then
	
	util.AddNetworkString("outfit_swap")	
	
	
	function SwapOutfitLoad( ply )
		net.Start("outfit_swap")
		net.Send(ply)	
	end
	
	
elseif CLIENT then

	function swapModel( index )
		
		local RRPModels = {}
			
		RRPModels[1] = "models/player/Group01/Male_01.mdl"
		RRPModels[2] = "models/player/Group01/Male_02.mdl"	
		RRPModels[3] = "models/player/Group01/Male_03.mdl"
		RRPModels[4] = "models/player/Group01/Male_04.mdl"
		RRPModels[5] = "models/player/Group01/Male_05.mdl"
		RRPModels[6] = "models/player/Group01/Male_06.mdl"
		RRPModels[7] = "models/player/Group01/Male_07.mdl"
		RRPModels[8] = "models/player/Group01/Male_08.mdl"
		RRPModels[9] = "models/player/Group01/Male_09.mdl"
		RRPModels[10] = "models/player/Group01/Female_01.mdl"
		RRPModels[11] = "models/player/Group01/Female_02.mdl"
		RRPModels[12] = "models/player/Group01/Female_03.mdl"
		RRPModels[13] = "models/player/Group01/Female_04.mdl"
		RRPModels[14] = "models/player/Group01/Female_06.mdl"
			
		return RRPModels[index]

	end
	
	function getAvailModels( ply )

		local plyrole = ply:GetRPRole()		
		
		local w = 0
		
		local rolestr = ply:GetOutfitList()
		local roletbl = string.Split( rolestr, ";" )
		//print(table.ToString(roletbl))
		
		local availmodels = {}
		
		for k, v in pairs(RPModels) do

			if table.HasValue(v.role, "default") then
				w = w + 1
				availmodels[w] = v
				availmodels[w].showModel = v["model"] .."".. ply:GetOGModelType()
			end
			
			for k, f in pairs(roletbl) do
			
				if !(f == "") then
			
					if f == "medic" and v["id"] == "medic" then
						w = w + 1
						availmodels[w] = v		
						availmodels[w].showModel = v["model"] .."".. ply:GetOGModelType()
					elseif f == "rebel" and v["id"] == "rebel" then
						w = w + 1
						availmodels[w] = v		
						availmodels[w].showModel = v["model"] .."".. ply:GetOGModelType()
						
					elseif v["id"] == f then
						w = w + 1
						availmodels[w] = v
						availmodels[w].showModel = v.model
					end
				end
				
			end	
		end
		return availmodels
	end		
	
	function getAvailBuyModel(ply)

			local availout = {}
			local plyrole = ply:GetRPRole()
			local w = 0
			
			for k,v in pairs(RPBuyOutfits) do	
			
			
				if table.HasValue(v.role, plyrole) and v.id == "rebel" then
					w = w + 1
					availout[w] = v
					availout[w].name = RPModels[k].name
					availout[w].showModel = RPModels[k].model..""..ply:GetOGModelType()
					
				elseif table.HasValue(v.role, plyrole) then
					w = w + 1
					availout[w] = v
					availout[w].name = RPModels[k].name
					availout[w].showModel = RPModels[k].model
				end
				
			end
			
			return availout

		end			
	
	function LoadingOutfit( model )
	
		local timeStart = SysTime()
	
		local LoadingFrame = vgui.Create( "DFrame" )
			LoadingFrame:SetTitle("")
			LoadingFrame:SetSize( 300, 75)
			LoadingFrame:SetVisible( true )
			LoadingFrame:SetDraggable( false )
			LoadingFrame:ShowCloseButton( false )		
			LoadingFrame:MakePopup()
			LoadingFrame:Center()
			LoadingFrame.Paint = function(self, w, h) 
				draw.RoundedBox( 8, 0, 0, w, h, Color( 25, 68, 131, 200 ) )
				draw.RoundedBox( 8, 5, 5, ((w-10) * (SysTime() - timeStart)/defaultOutfitTime), h - 10, Color( 255, 255, 255, 200 ) )
			end			
			
			
		local LoadingText = vgui.Create("DLabel", LoadingFrame )		
			LoadingText:SetSize( 250,150 )
			LoadingText:SetColor(Color(0,0,0,255))
			LoadingText:SetText("Changing into ".. OutfitsGetValue("model", model, "name"))	
			LoadingText:SizeToContentsX()
			LoadingText:SetPos( 150-(LoadingText:GetWide()/2), -75/2 )
	
		timer.Create( LocalPlayer():SteamID().."ClientOutfit", defaultOutfitTime, 1, function() playShuffleNoise() LoadingFrame:Close() notification.AddLegacy( "You have changed your outfit!", NOTIFY_HINT, 5 ) timer.Remove(LocalPlayer():SteamID().."ClientOutfit")  end )	
	
	end
	
	function playShuffleNoise()
	
		local tbl = {
			"npc/combine_soldier/gear1.wav",
			"npc/combine_soldier/gear2.wav",
			"npc/combine_soldier/gear3.wav",
			"npc/combine_soldier/gear4.wav",
			"npc/combine_soldier/gear5.wav",
			"npc/combine_soldier/gear6.wav"
		}

		surface.PlaySound(table.Random(tbl))
	
	end
	
	net.Receive( "outfit_swap", function(len)
		openCharacter()
	end)
	
end