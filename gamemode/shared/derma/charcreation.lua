if SERVER then

	util.AddNetworkString("char_creation")	
	util.AddNetworkString("genetic_swap")	
	
	
	function CharCreation( ply )
		net.Start("char_creation")
		net.Send(ply)	
	end
	
	function GeneticCreation( ply )
		net.Start("genetic_swap")
		net.Send(ply)	
	end
	
	
	
elseif CLIENT then
	
	net.Receive( "char_creation", function(len)
		openCharCreation()
	end)
	
	
	function openCharCreation()
			
			LocalPlayer():SetNWInt("openmenu", 1)

			local ply = LocalPlayer()	
	
			CreateFrame = vgui.Create( "DFrame" )
			CreateFrame:SetSize( 450, 400 )
			CreateFrame:SetTitle( "Character Creation Menu" )
			CreateFrame:SetVisible( true )
			CreateFrame:SetDraggable( false )
			CreateFrame:ShowCloseButton( false )
			CreateFrame:Center()
			CreateFrame:MakePopup()		
			CreateFrame.Paint = function(self, w, h)
				draw.RoundedBox( 8, 0, 0, w, h, Color( 25, 68, 131, 255 ) )
				draw.RoundedBox( 8, 5, 5, w - 10, h - 10, Color( 255, 255, 255, 255 ) )
			end							
			
		local NameText = vgui.Create("DLabel", CreateFrame )		
			NameText:SetPos( 32, 70 )
			NameText:SetTall( 20 )
			NameText:SetWide( 150 )
			NameText:SetText("Name:")
			NameText:SetColor(Color(0,0,0,255))
			
		local DermaName = vgui.Create("DTextEntry", CreateFrame )		
			DermaName:SetPos( 32, 90 )
			DermaName:SetTall( 20 )
			DermaName:SetWide( 150 )		
			
		local InfoText = vgui.Create("DLabel", CreateFrame )		
			InfoText:SetPos( 32, 130 )
			InfoText:SetTall( 60 )
			InfoText:SetWide( 150 )
			InfoText:SetColor(Color(0,0,0,255))
			InfoText:SetText("(Note: Your caste will be \nrandomly generated upon \ncreation. )")					
						
		local DChar = vgui.Create("DModelPanel", CreateFrame )
			DChar:SetHeight( CreateFrame:GetTall()/1.2 )
			DChar:SetWidth( CreateFrame:GetWide()/1.3 )
			DChar:SetPos(CreateFrame:GetWide() - DChar:GetWide()+ 80, (CreateFrame:GetTall() / 2) - (DChar:GetTall() / 2)  )
			DChar:SetModel( "models/player/Group01/Male_01.mdl" )
			function DChar:LayoutEntity( Entity ) return end
			local y = 1
			DChar.DoClick = function ()
				y = y + 1
				
				if y == 15 then
					y = 1
				end
				
				DChar:SetModel(swapModel( y ))
			
			end	

		local DermaButton = vgui.Create( "DButton", CreateFrame )
			DermaButton:SetText( "Create Character" )
			DermaButton:SetPos( 32, 250 )
			DermaButton:SetSize( 150, 50 )
			
			local c = Color( 255, 255, 255)
			DermaButton.OnCursorExited = function ()
				c = Color( 255, 255, 255)
			end
			DermaButton.OnCursorEntered = function ()
				c = Color( 230, 230, 250)
			end
			DermaButton.Paint = function ()
				draw.RoundedBox( 0, 0, 0, DermaButton:GetWide(), DermaButton:GetTall(), c )
			end

			DermaButton.DoClick = function ()
			
				if DermaName:GetValue() == "" then return end
					
				SendCharCreation( DermaName:GetValue(), "", DChar.Entity:GetModel() )
				
				
				notification.AddLegacy( "You've created " .. DermaName:GetValue() .. "!", NOTIFY_HINT, 5 )
				surface.PlaySound( "buttons/button14.wav" )		
				ply:SetNWInt("openmenu", 0)
				CreateFrame:Close()
			end
			
	end
	
	
	
	net.Receive( "genetic_swap", function(len)
		openGeneticSwap()
	end)	
	
	
	function openGeneticSwap()

			local ply = LocalPlayer()	
	
			CreateFrame = vgui.Create( "DFrame" )
			CreateFrame:SetSize( 450, 400 )
			CreateFrame:SetTitle( "Genetic Swap Menu" )
			CreateFrame:SetVisible( true )
			CreateFrame:SetDraggable( false )
			CreateFrame:ShowCloseButton( true )
			CreateFrame:Center()
			CreateFrame:MakePopup()		
			CreateFrame.Paint = function()
				draw.RoundedBox( 8, 0, 0, CreateFrame:GetWide(), CreateFrame:GetTall(), Color( 25, 68, 131, 255 ) )
				draw.RoundedBox( 8, 5, 5, CreateFrame:GetWide() - 10, CreateFrame:GetTall() - 10, Color( 255, 255, 255, 255 ) )
			end				
			
		local NameText = vgui.Create("DLabel", CreateFrame )		
			NameText:SetPos( 32, 90 )
			NameText:SetTall( 20 )
			NameText:SetWide( 150 )
			NameText:SetText("Name:")
			NameText:SetColor(Color(0,0,0,255))
			
		local InfoText = vgui.Create("DLabel", CreateFrame )		
			InfoText:SetPos( 32, 130 )
			InfoText:SetTall( 60 )
			InfoText:SetWide( 150 )
			InfoText:SetColor(Color(0,0,0,255))
			InfoText:SetText("(Note: Your caste will be \nnot be changed by \nthis. )")			
			

			local DermaName = vgui.Create("DTextEntry", CreateFrame )		
			DermaName:SetPos( 32, 110 )
			DermaName:SetTall( 20 )
			DermaName:SetWide( 150 )		
			
			local y = 1
			
		local DChar = vgui.Create("DModelPanel", CreateFrame )
			DChar:SetHeight( CreateFrame:GetTall()/1.2 )
			DChar:SetWidth( CreateFrame:GetWide()/1.3 )
			DChar:SetPos(CreateFrame:GetWide() - DChar:GetWide()+ 80, (CreateFrame:GetTall() / 2) - (DChar:GetTall() / 2)  )
			DChar:SetModel( "models/player/Group01/Male_01.mdl" )
			function DChar:LayoutEntity( Entity ) return end
			DChar.DoClick = function ()
				y = y + 1
				
				if y == 15 then
					y = 1
				end
				
				DChar:SetModel(swapModel( y ))
			
			end	

		local DermaButton = vgui.Create( "DButton", CreateFrame )
			DermaButton:SetText( "Change Genetics" )
			DermaButton:SetPos( 32, 250 )
			DermaButton:SetSize( 150, 50 )
			DermaButton.DoClick = function ()
			
				if DermaName:GetValue() == "" then return end
					
				SendCharCreation( DermaName:GetValue(), "", DChar.Entity:GetModel() )
				
				notification.AddLegacy( "You've change you genetics!", NOTIFY_HINT, 5 )
				
				notification.AddLegacy( "You've changed your name to " .. DermaName:GetValue() .. "!", NOTIFY_HINT, 5 )
				surface.PlaySound( "buttons/button14.wav" )		
				CreateFrame:Close()
			end
			
	end
	
end	