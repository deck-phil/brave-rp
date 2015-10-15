if SERVER then

	util.AddNetworkString("commandmenu")
	
	concommand.Add( "BRP_Command_Menu", CommandMenu )
	
	function CommandMenu( ply )
		net.Start("commandmenu")
		net.Send(ply)
	end
	
	hook.Add("ShowTeam", "Command Menu", CommandMenu)

	
elseif CLIENT then
	function openCommands()
		
		local MainMenuFrame = vgui.Create( "DFrame" )
			MainMenuFrame:SetSize( 440, 230)
			MainMenuFrame:SetTitle( "Control Panel" )
			MainMenuFrame:SetVisible( true )
			MainMenuFrame:SetDraggable( true )
			MainMenuFrame:MakePopup()
			MainMenuFrame:Center()
			MainMenuFrame.Paint = function(self, w, h)
				draw.RoundedBox( 4, 0, 0, w, h, Color(25, 68, 131, 150))
			end
			
		local MainMenuSheet = vgui.Create( "DPropertySheet", MainMenuFrame )
			MainMenuSheet:SetPos( 5, 27 )
			MainMenuSheet:SetSize( 430, 196 )		
			MainMenuSheet.Paint = function(self, w, h)
				draw.RoundedBox(4, 0, 0, w, h, Color(255,255,255))
				draw.RoundedBox(0, 0, 23, w, 4, Color(25, 68, 131, 150))
			end
			
			
		local CommandsTab = vgui.Create( "DPanelList" )
			CommandsTab:SetPos( 0, 0 )
			CommandsTab:SetSize( MainMenuFrame:GetWide(), MainMenuFrame:GetTall() )
			CommandsTab:SetSpacing( 5 )
			CommandsTab:EnableVerticalScrollbar( true )
			
		local OptionsTab = vgui.Create( "DPanelList" )
			OptionsTab:SetPos( 0, 0 )
			OptionsTab:SetSize( MainMenuFrame:GetWide(), MainMenuFrame:GetTall() )
			OptionsTab:SetSpacing( 5 )
			OptionsTab:EnableVerticalScrollbar( true )				
			
		local ModelTab = vgui.Create( "DIconLayout" )
			ModelTab:SetSize( 340, 200 )
			ModelTab:SetPos( 0, 0 )
			ModelTab:SetSpaceY( 5 )
			ModelTab:SetSpaceX( 5 )	
			
		local ShopTab = vgui.Create( "DIconLayout" )
			ShopTab:SetSize( 340, 200 )
			ShopTab:SetPos( 0, 0 )
			ShopTab:SetSpaceY( 5 )
			ShopTab:SetSpaceX( 5 )	

		local AmmoIcon = vgui.Create( "SpawnIcon", ShopTab ) 
			AmmoIcon:SetModel( "models/items/ammocrate_smg1.mdl" )
			//AmmoIcon.weapon = "models/items/ammorounds.mdl"
			AmmoIcon:SetToolTip( "Ammo" )
			ShopTab:Add( AmmoIcon )
			AmmoIcon.DoClick = function(  ) RunConsoleCommand("BRP_BuyAmmo") end  			

		for k,v in pairs(getAvailWeapons(LocalPlayer())) do	
			local icon = vgui.Create( "SpawnIcon", ShopTab ) 
			icon:SetModel( v.model )//
			icon:SetToolTip( v.name )		
			ShopTab:Add( icon )
			icon.DoClick = function(  ) SendWeapon( v.weapon, v.price ) print(v.price) MainMenuFrame:Close() notification.AddLegacy( "You bought something!", NOTIFY_HINT, 5 ) end  
		end
		
		for k,v in pairs(getAvailEntities(LocalPlayer())) do	
			local icon = vgui.Create( "SpawnIcon", ShopTab ) 
			icon:SetModel( v.model )
			icon:SetToolTip( v.name )
			ShopTab:Add( icon )
			icon.DoClick = function(  ) SendEnt( v.ent, v.price, v.crate ) MainMenuFrame:Close() notification.AddLegacy( "You bought something!", NOTIFY_HINT, 5 ) end  
		end	

		for k,v in pairs(getAvailBuyModel(LocalPlayer())) do	
			local icon = vgui.Create( "SpawnIcon", ShopTab ) 
			icon:SetModel( v.showModel )
			icon:SetToolTip( v.name )
			ShopTab:Add( icon )
			icon.DoClick = function(  ) SendOutfit( v.id, "buy", v.price ) MainMenuFrame:Close() notification.AddLegacy( "You bought an outfit!", NOTIFY_HINT, 5 ) end  
		end	
		
		for k,v in pairs(getAvailModels(LocalPlayer())) do	
			local icon = vgui.Create( "SpawnIcon", ModelTab ) 
			icon:SetModel( v.showModel )
			icon:SetToolTip( v.name )			
			ModelTab:Add( icon )
			icon.DoClick = function( icon ) 
			
				local OutfitMenu = vgui.Create("DMenu")
					btnUse = OutfitMenu:AddOption( "Use" )
						btnUse.DoClick = function( icon )
							
							MainMenuFrame:Close() 
							if (LocalPlayer():GetRPModel() == v.model) then notification.AddLegacy( "You're already wearing that!", NOTIFY_HINT, 5 ) return end
							
							if (string.StartWith(LocalPlayer():GetRPModel(), v.model)) && (OutfitsGetValue("model",v.model,"diffModel")) then 
								notification.AddLegacy( "You're already wearing that!", NOTIFY_HINT, 5 ) 
							return end
							
							SendOutfit( v.model, "use" ) 
							
							end
							
					btnDrop = OutfitMenu:AddOption( "Drop" )					
						btnDrop.DoClick = function(icon) SendOutfit(v.id, "drop") MainMenuFrame:Close() end
					OutfitMenu:Open()
			
			end  
		end		
			
			local PayButton = vgui.Create( "DButton", CommandsTab )
				PayButton:SetText( "Pay Menu" )
				PayButton:SetSize(100, 40)
				PayButton:SetPos( 10, 10 )	
				PayButton:SetColor(Color(255,255,255))
			local c = COLOR_UNHOVER
				PayButton.OnCursorExited = function ()
					c = COLOR_UNHOVER
				end
				PayButton.OnCursorEntered = function ()
					c = COLOR_HOVER
				end	
				
				PayButton.Paint = function(self, w,h )
					draw.RoundedBox( 4, 0, 0, w, h, c )
				end	
				PayButton.DoClick = function ()
					MainMenuFrame:Close()
					openPaying()
				end
				
			local TitleButton = vgui.Create( "DButton", CommandsTab )
				TitleButton:SetText( "Change Title" )
				TitleButton:SetSize(100, 40)
				TitleButton:SetPos( 120, 10 )	
				TitleButton:SetColor( Color(255,255,255))	
			local c = COLOR_UNHOVER
				TitleButton.OnCursorExited = function ()
					c = COLOR_UNHOVER
				end
				TitleButton.OnCursorEntered = function ()
					c = COLOR_HOVER
				end	
				TitleButton.Paint = function(self, w,h )
					draw.RoundedBox( 4, 0, 0, w, h, c )
				end					
				TitleButton.DoClick = function ()
					MainMenuFrame:Close()
					openTitleMenu()
				end
				
			local BuyDoorBtn = vgui.Create( "DButton", CommandsTab )
				BuyDoorBtn:SetText( "Buy Door" )
				BuyDoorBtn:SetSize(100, 40)
				BuyDoorBtn:SetPos( 305, 10 )	
				BuyDoorBtn:SetColor(Color(255,255,255))
			local c = COLOR_UNHOVER
				BuyDoorBtn.OnCursorExited = function ()
					c = COLOR_UNHOVER
				end
				BuyDoorBtn.OnCursorEntered = function ()
					c = COLOR_HOVER
				end	
				BuyDoorBtn.Paint = function(self, w,h )
					draw.RoundedBox( 4, 0, 0, w, h, c )
				end						
				BuyDoorBtn.DoClick = function ()
					MainMenuFrame:Close()
					RunConsoleCommand("BRP_BuyDoor")
				end			

			local SellAllBtn = vgui.Create( "DButton", CommandsTab )
				SellAllBtn:SetText( "Sell All Doors" )
				SellAllBtn:SetSize(100, 40)
				SellAllBtn:SetPos( 305, 60 )		
				SellAllBtn:SetColor(Color(255,255,255))
			local c = COLOR_UNHOVER
				SellAllBtn.OnCursorExited = function ()
					c = COLOR_UNHOVER
				end
				SellAllBtn.OnCursorEntered = function ()
					c = COLOR_HOVER
				end	
				SellAllBtn.Paint = function(self, w,h )
					draw.RoundedBox( 4, 0, 0, w, h, c )
				end										
				SellAllBtn.DoClick = function ()
					MainMenuFrame:Close()
					RunConsoleCommand("BRP_SellAllDoors")
				end		

			local DropButton = vgui.Create( "DButton", CommandsTab )
				DropButton:SetText( "Drop Weapon" )
				DropButton:SetSize(100, 40)
				DropButton:SetPos( 10, 60 )	
				DropButton:SetColor(Color(255,255,255))				
			local c = COLOR_UNHOVER
				DropButton.OnCursorExited = function ()
					c = COLOR_UNHOVER
				end
				DropButton.OnCursorEntered = function ()
					c = COLOR_HOVER
				end	
				DropButton.Paint = function(self, w,h )
					draw.RoundedBox( 4, 0, 0, w, h, c )
				end						
				DropButton.DoClick = function ()
					MainMenuFrame:Close()
					RunConsoleCommand("BRP_DropWeapon")
				end
				
			local HudCheckbox = vgui.Create( "DCheckBox", OptionsTab )
				HudCheckbox:SetPos( 10, 10 )
				HudCheckbox:SetConVar( "BRP_RedHud" ) 
				
			local HudChkTxt = vgui.Create("DLabel", OptionsTab )
				HudChkTxt:SetPos( 30,10)
				HudChkTxt:SetTextColor( Color(0,0,0) )				
				HudChkTxt:SetText( "HUD" )
				HudChkTxt:SizeToContents()

		MainMenuSheet:AddSheet( "Commands", CommandsTab, nil, false, false, "All your commands" )	
		MainMenuSheet:AddSheet( "Outfits", ModelTab, nil, false, false, "Change your outfit" )
		MainMenuSheet:AddSheet( "Shop", ShopTab, nil, false, false, "Buy weapons and shipments" )				

		
		local DHCTab = vgui.Create( "DPanelList" )
			DHCTab:SetPos( 0, 0 )
			DHCTab:SetSize( MainMenuFrame:GetWide(), MainMenuFrame:GetTall() )
			DHCTab:SetSpacing( 5 )
			DHCTab:EnableVerticalScrollbar( true )	
			
		local ReqTab = vgui.Create( "DPanelList" )
			ReqTab:SetPos( 0, 0 )
			ReqTab:SetSize( MainMenuFrame:GetWide(), MainMenuFrame:GetTall() )
			ReqTab:SetSpacing( 5 )
			ReqTab:EnableVerticalScrollbar( true )				

		local AdminTab = vgui.Create( "DPanelList" )
			AdminTab:SetPos( 0, 0 )
			AdminTab:SetSize( MainMenuFrame:GetWide(), MainMenuFrame:GetTall() )
			AdminTab:SetSpacing( 5 )
			AdminTab:EnableVerticalScrollbar( true )		

		local PoliceTab = vgui.Create( "DPanelList" )
			PoliceTab:SetPos( 0, 0 )
			PoliceTab:SetSize( MainMenuFrame:GetWide(), MainMenuFrame:GetTall() )
			PoliceTab:SetSpacing( 5 )
			PoliceTab:EnableVerticalScrollbar( true )				
		
		
		//DHC TAB
		if (LocalPlayer():GetRPRole() == "dhc") then 
			MainMenuSheet:AddSheet( "DHC", DHCTab, nil, false, false, "Manage DHC Options" )
			
			local LeftPanel = vgui.Create( "DPanel", DHCTab ) --can be anything other than DPanel
			local RightPanel = vgui.Create( "DPanel", DHCTab )

			local div = vgui.Create( "DHorizontalDivider", DHCTab )
			div:Dock( FILL )		 --make the divider fills place of the DFrame
			div:SetLeft( LeftPanel ) --set what panel is in left side of the divider
			div:SetRight( RightPanel )
			div:SetDividerWidth( 4 ) --set the divider width. DEF: 8
			div:SetLeftMin( 20 )	 --set the minimun width of left side
			div:SetRightMin( 20 )
			div:SetLeftWidth( 230 ) --set the left side width	
			
			local SelectID = "0"
			
				local RegList = vgui.Create( "DListView", RightPanel )
				RegList:SetMultiSelect( false )
				RegList:Dock( FILL )
				RegList:AddColumn( "Citizen" )
				RegList:AddColumn( "ID" )
				RegList:AddColumn( "Wanted" )
				
					for k, v in pairs( player.GetAll()) do
						if v:isRegistered() then 
							RegList:AddLine( v:GetRPName(), v:GetRegister(), GetPlayerNameID( v:GetRegister() ):isWantedCaps())
						elseif v:GetNWBool("wanted") then
							RegList:AddLine( v:GetRPName(), "****", "True")
						end
						
					end
				
				RegList.OnRowSelected = function( panel, line )
					lineID = line
				end			

			local RegButton = vgui.Create( "DButton", LeftPanel )
				RegButton:SetText( "Register Citizen" )
				RegButton:SetSize(100, 40)
				RegButton:SetPos( 10, 10 )
				RegButton:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					RegButton.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					RegButton.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					RegButton.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end					
				RegButton.DoClick = function ()
					MainMenuFrame:Close()
					openRegister()
				end		

			local OfficeButton = vgui.Create( "DButton", LeftPanel )
				OfficeButton:SetText( "Set Office" )
				OfficeButton:SetSize(100, 40)
				OfficeButton:SetPos( 120, 10 )	
				OfficeButton:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					OfficeButton.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					OfficeButton.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					OfficeButton.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end					
				OfficeButton.DoClick = function ()
					MainMenuFrame:Close()
					SendLocation("dhc")
				end					

			local WantBut = vgui.Create( "DButton", LeftPanel )
				WantBut:SetText( "Make Wanted" )
				WantBut:SetSize(100, 40)
				WantBut:SetPos( 10, 60 )	
				WantBut:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					WantBut.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					WantBut.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					WantBut.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end					
				WantBut.DoClick = function ()
			
					notification.AddLegacy( RegList:GetLine(lineID):GetValue(1).." is now wanted.", NOTIFY_HINT, 5 )
			
					if RegList:GetLine(lineID):GetValue(2) == "****" then
						SendWantedPly(GetPlayerNameRPName( RegList:GetLine(lineID):GetValue(1) ), true)
					else
						SendWantedPly(GetPlayerNameID( RegList:GetLine(lineID):GetValue(2)), true)
					end
				
					
					RegList:AddLine( RegList:GetLine(lineID):GetValue(1), RegList:GetLine(lineID):GetValue(2), "True" )
					RegList:RemoveLine( lineID )
					
				end	
				
			local UnWantBut = vgui.Create( "DButton", LeftPanel )
				UnWantBut:SetText( "Make UnWanted" )
				UnWantBut:SetSize(100, 40)
				UnWantBut:SetPos( 10, 110 )		
				UnWantBut:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					UnWantBut.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					UnWantBut.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					UnWantBut.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end					
				UnWantBut.DoClick = function ()
				
					notification.AddLegacy( RegList:GetLine(lineID):GetValue(1).." is no longer wanted.", NOTIFY_HINT, 5 )
				
					if RegList:GetLine(lineID):GetValue(2) == "****" then
						SendWantedPly(GetPlayerNameRPName( RegList:GetLine(lineID):GetValue(1) ), false)
					else
						SendWantedPly(GetPlayerNameID( RegList:GetLine(lineID):GetValue(2)), false)
					end
					
					RegList:AddLine( RegList:GetLine(lineID):GetValue(1), RegList:GetLine(lineID):GetValue(2), "False" )
					RegList:RemoveLine( lineID )

				end	
			
				
		end
		

		//REQ WANTED TAB
	if (LocalPlayer():GetRPRole() == "dhc") then 
			MainMenuSheet:AddSheet( "Request Wanted", ReqTab, nil, false, false, "Manage Wanted Request" )	
			
			local SelectID = "0"
			
			local ReqList = vgui.Create( "DListView", ReqTab )
				ReqList:SetMultiSelect( false )
				ReqList:Dock( FILL )
				ReqList:AddColumn( "Citizen" )
				ReqList:AddColumn( "ID" )
				ReqList:AddColumn( "Reason" )
				
					for k, v in pairs( player.GetAll()) do
						local CitID = v:GetRegister()
						
						if CitID == "" then CitID = "****" end
						if v:GetNWBool("WantReq") then 
							ReqList:AddLine( v:GetRPName(), CitID, GetPlayerNameID( v:GetRegister() ):GetNWString("WantReason"))
						end
					end
					
				ReqList.DoDoubleClick = function( lineID, line )
				
					local Menu = vgui.Create( "DMenu" )
						Menu:AddOption("Accept", function()
						
						if ReqList:GetLine(POPOPO):GetValue(2) == "****" then

							notification.AddLegacy( ReqList:GetLine(POPOPO):GetValue(1).." is now wanted.", NOTIFY_HINT, 5 )
							SendWantedPly(GetPlayerNameRPName( ReqList:GetLine(POPOPO):GetValue(1)), true) 
							
						else
							notification.AddLegacy( ReqList:GetLine(POPOPO):GetValue(1).." is now wanted.", NOTIFY_HINT, 5 )			
							SendWantedPly(GetPlayerNameID( ReqList:GetLine(POPOPO):GetValue(2)), true) 
						end
						
							ReqList:RemoveLine(line) 					
						end)
						
						Menu:AddOption("Decline", function()
						
							if ReqList:GetLine(POPOPO):GetValue(2) == "****" then

								notification.AddLegacy( ReqList:GetLine(POPOPO):GetValue(1).." is a free man.", NOTIFY_HINT, 5 )
								SendWantedPly(RemoveWantedRequest( ReqList:GetLine(POPOPO):GetValue(1))) 
								
							else
							
								notification.AddLegacy( ReqList:GetLine(POPOPO):GetValue(1).." is a free man.", NOTIFY_HINT, 5 )
								SendWantedPly(RemoveWantedRequest( ReqList:GetLine(POPOPO):GetValue(2))) 
							end						

							ReqList:RemoveLine(line)
						end)
						Menu:Open()
						
				end
				
				ReqList.OnRowSelected = function( panel, line )
					POPOPO = line
				end
				
		end		
		
		
		
		//POLICE TAB
		
		if table.HasValue( RPCops, LocalPlayer():GetRPRole() ) then 
		
			MainMenuSheet:AddSheet( "Police", PoliceTab, nil, false, false, "Police Agenda" )
			
			local LeftPanel = vgui.Create( "DPanel", PoliceTab ) --can be anything other than DPanel
			local RightPanel = vgui.Create( "DPanel", PoliceTab )

			local div = vgui.Create( "DHorizontalDivider", PoliceTab )
			div:Dock( FILL )		 --make the divider fills place of the DFrame
			div:SetLeft( LeftPanel ) --set what panel is in left side of the divider
			div:SetRight( RightPanel )
			div:SetDividerWidth( 4 ) --set the divider width. DEF: 8
			div:SetLeftMin( 20 )	 --set the minimun width of left side
			div:SetRightMin( 20 )
			div:SetLeftWidth( 230 ) --set the left side width	
			
			//local SelectPlayer = "0"
				
			if LocalPlayer():GetRPRole() == "headpolice" then

				local TextEntry = vgui.Create( "DTextEntry", RightPanel )	-- create the form as a child of frame
					TextEntry:SetPos( 25, 50 )
					TextEntry:Dock( FILL )
					TextEntry:DockMargin( 2, 2, 2, 96 )
					TextEntry:SetText( GetAgenda() )
					TextEntry:SetMultiline(true)
					
				local WayList = vgui.Create( "DListView", RightPanel )
					WayList:SetMultiSelect( false )
					WayList:Dock( FILL )
					WayList:DockMargin( 2, 86, 2, 2 )				
					WayList:AddColumn( "Waypoint Name" )
					WayList:AddColumn( "Position" )	
					
					for k, v in pairs( ents.GetAll()) do
						if v:GetClass() == "brp_waypoint" then
							WayList:AddLine( v:GetWaypointName(), v:GetPos())
						end
					end	
					
					function WayList:DoDoubleClick( lineID, line )

						DeleteWaypoint( WayList:GetLine(lineID):GetValue(1) )
						notification.AddLegacy( "You have deleted "..WayList:GetLine(lineID):GetValue(1)..".", NOTIFY_HINT, 5 )
						WayList:RemoveLine( lineID )

					end
					
				local UpAgenda = vgui.Create( "DButton", LeftPanel )
					UpAgenda:SetText( "Update Agenda" )
					UpAgenda:SetSize(100, 40)
					UpAgenda:SetPos( 10, 110 )
					UpAgenda:SetColor( COLOR_WHITE )
				local c = COLOR_UNHOVER
					UpAgenda.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					UpAgenda.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					UpAgenda.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end							
					UpAgenda.DoClick = function ()
						SendPoliceAgenda(TextEntry:GetValue())
					end
					
				local Waypoint = vgui.Create( "DButton", LeftPanel )
					Waypoint:SetText( "Set Waypoint" )
					Waypoint:SetSize(100, 40)
					Waypoint:SetPos( 10, 60 )		
					Waypoint:SetColor(COLOR_WHITE)
				local c = COLOR_UNHOVER
					Waypoint.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					Waypoint.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					Waypoint.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end						
					Waypoint.DoClick = function ()
						openWaypoint()
						MainMenuFrame:Close()
					end	

				local PoliceBtn = vgui.Create( "DButton", LeftPanel )
					PoliceBtn:SetText( "Set Jail" )
					PoliceBtn:SetSize(100, 40)
					PoliceBtn:SetPos( 120, 10 )	
					PoliceBtn:SetColor( COLOR_WHITE )	
				local c = COLOR_UNHOVER
					PoliceBtn.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					PoliceBtn.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					PoliceBtn.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end						
					PoliceBtn.DoClick = function ()
						MainMenuFrame:Close()
						SendLocation("jail")
						notification.AddLegacy( "You have set the jail location.", NOTIFY_HINT, 5 )
					end							

				else
				
					local TextEntry = vgui.Create( "DTextEntry", RightPanel )	-- create the form as a child of frame
						TextEntry:SetPos( 25, 50 )
						TextEntry:Dock( FILL )
						TextEntry:DockMargin( 2, 2, 2, 90 )
						TextEntry:SetText( GetAgenda() )
						TextEntry:SetEditable( false )
						TextEntry:SetMultiline(true)			
			
				end
				
			local WantBut = vgui.Create( "DButton", LeftPanel )
				WantBut:SetText( "Request Wanted" )
				WantBut:SetSize(100, 40)
				WantBut:SetPos( 10, 10 )
				WantBut:SetColor( COLOR_WHITE )
			local c = COLOR_UNHOVER
				WantBut.OnCursorExited = function ()
					c = COLOR_UNHOVER
				end
				WantBut.OnCursorEntered = function ()
					c = COLOR_HOVER
				end	
				WantBut.Paint = function(self, w,h )
					draw.RoundedBox( 4, 0, 0, w, h, c )
				end					
				WantBut.DoClick = function ()
					MainMenuFrame:Close()
					openReqWanted()
				end					
				
		end		

		
		
		//ADMIN TAB
		if (LocalPlayer():isRPAdmin()) then 
			MainMenuSheet:AddSheet( "Admin", AdminTab, nil, false, false, "Manage Admin Options" )
			
			local LeftPanel = vgui.Create( "DPanel", AdminTab ) --can be anything other than DPanel
			local RightPanel = vgui.Create( "DPanel", AdminTab )

			local div = vgui.Create( "DHorizontalDivider", AdminTab )
			div:Dock( FILL )		 --make the divider fills place of the DFrame
			div:SetLeft( LeftPanel ) --set what panel is in left side of the divider
			div:SetRight( RightPanel )
			div:SetDividerWidth( 4 ) --set the divider width. DEF: 8
			div:SetLeftMin( 20 )	 --set the minimun width of left side
			div:SetRightMin( 20 )
			div:SetLeftWidth( 120 ) --set the left side width	
			
			//local SelectPlayer = "0"
			
			local RegList = vgui.Create( "DListView", RightPanel )
				RegList:SetMultiSelect( false )
				RegList:Dock( FILL )
				RegList:AddColumn( "RP Name" )
				RegList:AddColumn( "Steam ID" )
				
				function PopList()
					for k, v in pairs( player.GetAll()) do
							RegList:AddLine( v:GetRPName(), v:SteamID())
					end
				end
				
				PopList()
				
				RPName = ""
				
				RegList.OnRowSelected = function( panel, line )
					RPName = RegList:GetLine(line):GetValue(1)		
				end

			local RegButton = vgui.Create( "DButton", LeftPanel )
				RegButton:SetText( "Kick" )
				RegButton:SetSize(100, 40)
				RegButton:SetPos( 10, 10 )		
				RegButton:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					RegButton.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					RegButton.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					RegButton.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end					
				RegButton.DoClick = function ()
					MainMenuFrame:Close()
					
					//if RPName == false then return end
					if RPName == "" then return end
					
					RunConsoleCommand("say", "!kick "..RPName)
				end	
				
			local function GetNamePlayer( name )
			
				for k, v in pairs(player.GetAll()) do
					if v:GetRPName() == name then return v end
				end
			
			end

			local PermaBtn = vgui.Create( "DButton", LeftPanel )
				PermaBtn:SetText( "Perma Death" )
				PermaBtn:SetSize(100, 40)
				PermaBtn:SetPos( 10, 60 )	
				PermaBtn:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					PermaBtn.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					PermaBtn.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					PermaBtn.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end						
				PermaBtn.DoClick = function ()
				
					if RPName == "" then return end
				
					//print(GetNamePlayer(RPName))
					SendDemote(GetNamePlayer(RPName))
					notification.AddLegacy( "You have demoted "..RPName..".", NOTIFY_HINT, 5 )
					//victim:demoteRP( )
				end						
				
			local AdminRole = vgui.Create( "DButton", LeftPanel )
				AdminRole:SetText( "Set Role" )
				AdminRole:SetSize(100, 40)
				AdminRole:SetPos( 10, 110 )
				AdminRole:SetColor( COLOR_WHITE )		
				local c = COLOR_UNHOVER
					AdminRole.OnCursorExited = function ()
						c = COLOR_UNHOVER
					end
					AdminRole.OnCursorEntered = function ()
						c = COLOR_HOVER
					end	
					AdminRole.Paint = function(self, w,h )
						draw.RoundedBox( 4, 0, 0, w, h, c )
					end					
				AdminRole.DoClick = function ()
					MainMenuFrame:Close()
					openRoleMenu(RPName)
				end						
				
		end	
		MainMenuSheet:AddSheet( "Options", OptionsTab, nil, false, false, "Change your options" )	
		
		for k, v in pairs(MainMenuSheet.Items) do
			if (!v.Tab) then continue end
				v.Tab:SetColor(Color(0,0,0))
				
				local c = COLOR_WHITE
				v.Tab.OnCursorExited = function ()
					c = COLOR_WHITE
				end
				v.Tab.OnCursorEntered = function ()
					c = Color( 25, 68, 210, 150)
				end	
					
				v.Tab.Paint = function(self,w,h)		
					if MainMenuSheet:GetActiveTab() == self then
						draw.RoundedBox(0, 0, 0, w, h-5, Color(25, 68, 210, 150))
					else
						draw.RoundedBox(0, 5, 0, w-10, h-17, c)
					end
			end
		end
		
			
		
	end
	
	function openTitleMenu()
	
		local TitleFrame = vgui.Create( "DFrame" )
			TitleFrame:SetSize( 300, 150 )
			TitleFrame:SetTitle( "Change Player Title" )
			TitleFrame:SetVisible( true )
			TitleFrame:SetDraggable( false )
			TitleFrame:ShowCloseButton( true )
			TitleFrame:Center()
			TitleFrame:MakePopup()		
			TitleFrame.Paint = function(self, w, h)
				draw.RoundedBox( 8, 0, 0, w, h, Color(25, 68, 131, 150))
			end
	
		local DermaText = vgui.Create("DTextEntry", TitleFrame )		
			DermaText:SetPos( 75, 50 )
			DermaText:SetTall( 20 )
			DermaText:SetWide( 150 )		
			
		local TitleButton = vgui.Create( "DButton", TitleFrame )
			TitleButton:SetText( "Change Title" )
			TitleButton:SetPos( 100, 100 )
			TitleButton:SetSize( 100, 25 )		
			TitleButton:SetColor(color_black)
			TitleButton.Paint = function(self, w,h )
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
			end			
			
			TitleButton.DoClick = function ()
				TitleFrame:Close()
				SendTitle( DermaText:GetValue() )
				notification.AddLegacy( "You have changed your title to: "..DermaText:GetValue()..".", NOTIFY_HINT, 5 )
			end				

	
	end
	
	
	
	function openWaypoint()
	
		local Point = vgui.Create( "DFrame" )
			Point:SetSize( 300, 150 )
			Point:SetTitle( "Set a Waypoint" )
			Point:SetVisible( true )
			Point:SetDraggable( false )
			Point:ShowCloseButton( true )
			Point:Center()
			Point:MakePopup()		
			Point.Paint = function(self, w, h)
				draw.RoundedBox( 8, 0, 0, w, h, Color(25, 68, 131, 150))
			end
			
		local PointText = vgui.Create("DTextEntry", Point )		
			PointText:SetPos( 75, 50 )
			PointText:SetTall( 20 )
			PointText:SetWide( 150 )		
			
		local PointBtn = vgui.Create( "DButton", Point )
			PointBtn:SetText( "Set Waypoint Here" )
			PointBtn:SetPos( 100, 100 )
			PointBtn:SetSize( 100, 25 )				
			PointBtn.DoClick = function ()
				Point:Close()
				SendWaypoint( PointText:GetValue() )
				notification.AddLegacy( "You have made a waypoint here.", NOTIFY_HINT, 5 )
			end
			PointBtn:SetColor(color_black)
			PointBtn.Paint = function(self, w,h )
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
			end			

	
	end
	
	function openReqWanted()
	
		local ReqManu = vgui.Create( "DFrame" )
			ReqManu:SetSize( 300, 150 )
			ReqManu:SetTitle( "Request Wanted" )
			ReqManu:SetVisible( true )
			ReqManu:SetDraggable( false )
			ReqManu:ShowCloseButton( true )
			ReqManu:Center()
			ReqManu:MakePopup()		
			ReqManu.Paint = function(self, w, h)
				draw.RoundedBox( 8, 0, 0, w, h, Color(25, 68, 131, 150))
			end
			
		local ReasonTxt = vgui.Create("DTextEntry", ReqManu )		
			ReasonTxt:SetPos( 75, 75 )
			ReasonTxt:SetTall( 20 )
			ReasonTxt:SetWide( 150 )	

		local PlayerCombo = vgui.Create("DComboBox", ReqManu )		
			PlayerCombo:SetPos( 75, 40 )
			PlayerCombo:SetTall( 20 )
			PlayerCombo:SetWide( 150 )
			PlayerCombo:SetTextColor( Color(0,0,0,255) )

		for k,v in pairs(player.GetAll()) do
			PlayerCombo:AddChoice( v:GetRPName() )
		end
			
		local PointBtn = vgui.Create( "DButton", ReqManu )
			PointBtn:SetText( "Request Wanted" )
			PointBtn:SetPos( 100, 110 )
			PointBtn:SetSize( 100, 25 )
			PointBtn:SetColor(color_black)
			PointBtn.Paint = function(self, w,h )
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
			end				
			PointBtn.DoClick = function ()
				ReqManu:Close()
				SendWantedRequest( GetPlayerFromName(PlayerCombo:GetValue()), ReasonTxt:GetValue()  )
				notification.AddLegacy( "You have sent a request for "..PlayerCombo:GetValue().." to wanted.", NOTIFY_HINT, 5 )
			end				

		function GetPlayerFromName(name)
			for k, v in pairs(player.GetAll()) do
				if v:GetRPName() == name then return v end
			end
		end
			
	
	end	

	
	
	function openRegister()

		local tr = util.GetPlayerTrace(LocalPlayer())
		local trace = util.TraceLine(tr)
		
		if (!trace.Hit) then return notification.AddLegacy( "You must be looking at a player!", NOTIFY_HINT, 5 ) end
		if (!trace.HitNonWorld) then return notification.AddLegacy( "You must be looking at a player!", NOTIFY_HINT, 5 ) end	
			
			if (trace.Hit) then
				local target = trace.Entity
					
				if (target:IsPlayer()) then
					if (target:IsValid()) then
						
						local targetPos = target:GetPos() + Vector(0,0,84)
						local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
							
					if targetDistance < 5 then
					
						print(target)
						
						SendRegPlayer( target )
						notification.AddLegacy( "You registered "..target:GetRPName().."", NOTIFY_HINT, 5 )
						
					
					end
					
				end
					
			end
		end
	
	end
	
	function openRoleMenu( default )
	
		local RoleFrame = vgui.Create( "DFrame" )
			RoleFrame:SetSize( 300, 200 )
			RoleFrame:SetTitle( "Set Player Role" )
			RoleFrame:SetVisible( true )
			RoleFrame:SetDraggable( false )
			RoleFrame:ShowCloseButton( true )
			RoleFrame:Center()
			RoleFrame:MakePopup()	
			RoleFrame.Paint = function(self, w, h)
				draw.RoundedBox( 8, 0, 0, w, h, Color(25, 68, 131, 150))
				//draw.RoundedBox( 4, 5, 22, w-10, h-15, COLOR_WHITE)
			end			
	
		local RoleText = vgui.Create("DComboBox", RoleFrame )		
			RoleText:SetPos( 75, 50 )
			RoleText:SetTall( 20 )
			RoleText:SetWide( 150 )
			RoleText:SetTextColor( Color(0,0,0,255) )
		for k,v in pairs(RPRoles) do
			RoleText:AddChoice(v["name"]) 
		end
			
		local PlayerText = vgui.Create("DComboBox", RoleFrame )		
			PlayerText:SetPos( 75, 100 )
			PlayerText:SetTall( 20 )
			PlayerText:SetWide( 150 )
			if default then
				PlayerText:SetValue(default)
			end
			PlayerText:SetTextColor( Color(0,0,0,255) )

		for k,v in pairs(getPlayers()) do				
			PlayerText:AddChoice( v:GetRPName() )
		end
			
		local RoleButton = vgui.Create( "DButton", RoleFrame )
			RoleButton:SetText( "Set Role" )
			RoleButton:SetPos( 100, 150 )
			RoleButton:SetSize( 100, 25 )
			RoleButton:SetColor(color_black)
			RoleButton.Paint = function(self, w,h )
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
			end				
			RoleButton.DoClick = function ()
				
				if RoleText:GetValue() == "" then notification.AddLegacy( "Please select a role.", NOTIFY_HINT, 5 ) return end
				
				RoleFrame:Close()
				
				if !(HasRole(getRoleName(RoleText:GetValue()))) then notification.AddLegacy( "That is not a valid role!", NOTIFY_HINT, 5 )	return end			
				
				RunConsoleCommand("say", "!role "..getRoleName(RoleText:GetValue()).." "..PlayerText:GetValue())
			end
			
		function getRoleName( name )

			for k, v in pairs( RPRoles ) do
			
				if v["name"] == name then
					return v["role"]
				end
			end
			return false
		end

	
	end	
		
		
	net.Receive( "commandmenu", function(len)
		openCommands()
	end)
	
	/*
	function ClosePanels()
		
		print("dasdad")
		
	end

	hook.Add("Think", "ClosingPanel", ClosePanels)*/
end	
		