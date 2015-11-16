if SERVER then

	util.AddNetworkString("charmenu")
	
	concommand.Add( "BRP_PlayerMenu", CharMenu )
	
	function CharMenu( ply )
		net.Start("charmenu")
		net.Send(ply)
		ply:Freeze( false )
	end
	//hook.Add("ShowSpare2", "Player Menu", CharMenu)

	
elseif CLIENT then

	function openCharacter()
	
	RunConsoleCommand("BRP_StatHud", "0")
	
	if !(CLIENT) then return end
	
	if 	LocalPlayer():GetNWInt("openmenu") == 1 then return end
				
	local ply = LocalPlayer()
	
		surface.CreateFont( "BebasR", {
			font = "Arial",
			size = ScreenScale(14),
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
} )
	
		surface.CreateFont( "BebasT", {
			font = "Arial",
			size = ScreenScale(40),
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
} )	
		surface.CreateFont( "BebasB", {
			font = "Arial",
			size = ScreenScale(100),
			weight = 500,
			blursize = 0,
			scanlines = 0,
			antialias = true,
} )	
	
			local H = ScrH()
			local W = ScrW()
		
	
		local f = vgui.Create( "DFrame" )
			f:SetSize( W, H )
			f:SetTitle( "" )
			f:SetVisible( true )
			f:SetDraggable( true )
			f:MakePopup()
			f:Center()
			f:ShowCloseButton( false )
			f:SetScreenLock( true)
			f.Paint = function( self, w, h)
				draw.RoundedBox( 8, 0, 0, w,h, Color( 25, 68, 131, 75 ) )
				draw.RoundedBox( 8, 5, 5,w - 10, h - 10, Color( 255, 255, 255, 100 ) )
			end		
			
			
		local title = ply:GetName()	
		if ply:GetRPName()=="" then
			title = "BraveRP"
		end

		local SteamLabel = Label( title, f )
			SteamLabel:SetSize( 10000, 100)
			SteamLabel:SetPos( 10, 10 )
			SteamLabel:SetFont("BebasB")	
			SteamLabel:SetColor( color_black )
	

	if !(ply:GetRPName() == "" ) then
	

		local icon = vgui.Create( "DModelPanel", f )
			icon:SetPos( ScrW()/4, 0)
			icon:SetHeight( ScrH() )
			icon:SetWidth( ScrH() )
			icon:SetModel( ply:GetModel() )
			icon:Center()
			//function icon:LayoutEntity( Entity ) return end
			function icon.Entity:GetPlayerColor() return LocalPlayer():GetCasteColor()
			end
			
			
		local NameLabel = Label( "RP NAME: " ..  ply:GetRPName() .. "", f )
			NameLabel:SetSize( 500, 32)
			NameLabel:SetPos( 10, 10 + SteamLabel:GetTall() + 50)
			NameLabel:SetFont("BebasR")
			NameLabel:SetColor( color_black )

			if !(ply:GetRPTitle() == "") then
		local TitleLabel = Label( "TITLE: " .. ply:GetRPTitle() .. "", f )
			TitleLabel:SetSize( 500, 32)
			TitleLabel:SetPos( 10,  10 + SteamLabel:GetTall() + 50 + NameLabel:GetTall() +10 + 32 + 10 + 42 +42)
			TitleLabel:SetFont("BebasR")
			TitleLabel:SetColor( color_black )			
			end
			
			local CITID = ply:GetRegister()
			
			if CITID == '' then
				CITID = 'UNREGISTERED'
			end
			
		local RegNum = Label( "CIT.ID#: " .. CITID .. "", f )
			RegNum:SetSize( 500, 32)
			RegNum:SetPos( 10,  10 + SteamLabel:GetTall() + 50 + NameLabel:GetTall() +10 + 32 + 10 + 42)
			RegNum:SetFont("BebasR")
			RegNum:SetColor( color_black )			
			
		local CasteLabel = Label( "CASTE: " .. team.GetName( ply:Team() ) .. "", f )
			CasteLabel:SetSize( 500, 40)
			CasteLabel:SetPos( 10,  6 + SteamLabel:GetTall() + 50 + NameLabel:GetTall() +10 + 42)
			CasteLabel:SetFont("BebasR")
			CasteLabel:SetColor( color_black )
			
			
			
		local MoneyLabel = Label( "CREDITS: " .. ply:GetMoney() .. " $", f )
			MoneyLabel:SetSize( 500, 32)
			MoneyLabel:SetPos( 10,  10 + SteamLabel:GetTall() + 50 + NameLabel:GetTall() +10)
			MoneyLabel:SetFont("BebasR")
			MoneyLabel:SetColor( color_black )
			
		
			local PlayButton = vgui.Create( "DButton", f )
				PlayButton:SetFont( "BebasB" )
				PlayButton:SetText( "PLAY" )
				PlayButton:SetSize( 340, 150 )
				PlayButton:AlignLeft()
				PlayButton:SetPos( 10, ScrH() - PlayButton:GetTall() - 10 )	
				PlayButton:SetColor( color_black )
				
			local c = Color( 255, 255, 255, 0)
				PlayButton.OnCursorExited = function ()
					c = Color( 255, 255, 255, 0)
				end
				PlayButton.OnCursorEntered = function ()
					c = Color( 25, 68, 131, 150)
				end	
				
				PlayButton.Paint = function()
					draw.RoundedBox( 4, 0, 0, PlayButton:GetWide(), PlayButton:GetTall(), c )
				end
				
				PlayButton.DoClick = function ()
					f:Close()
					RunConsoleCommand("BRP_StatHud", "1")
				end
	end	
			
			
		if (ply:GetRPName() == "") then	
		
		local icon = vgui.Create( "DModelPanel", f )
			icon:SetPos( ScrW()/4, 0)
			icon:SetHeight( ScrH() )
			icon:SetWidth( ScrH() )
			icon:SetModel( table.Random(IntroModels) )
			icon:Center()
			//function icon:LayoutEntity( Entity ) return end
			function icon.Entity:GetPlayerColor() return LocalPlayer():GetCasteColor()
			end
			
			timer.Create("changeModel", 1,0,function() icon:SetModel(table.Random(IntroModels)) end)
			
			local CreateButton = vgui.Create( "DButton", f )
				CreateButton:SetFont( "BebasB" )
				CreateButton:SetText( "CREATE" )
				CreateButton:SetSize( ScreenScale(160), ScreenScale(30) )
				CreateButton:AlignLeft()
				CreateButton:SetPos( 10, ScrH() - CreateButton:GetTall() - 10 )	
				CreateButton:SetColor( color_black )			
				CreateButton.Paint = function()
					draw.RoundedBox( 8, 10, 10, CreateButton:GetWide(), CreateButton:GetTall(), Color( 255, 255, 255, 0 ) )
				end			
				CreateButton.DoClick = function ()
					timer.Remove("changeModel")
					f:Close()
					openCharCreation()
				end
		end

			
	end
		
		
		
	net.Receive( "charmenu", function(len)
		openCharacter()
	end)
		
end	
		