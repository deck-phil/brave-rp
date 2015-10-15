if SERVER then

	util.AddNetworkString("doormenu")
	
	concommand.Add( "BRP_DoorMenu", DoorMenu )
	
	hook.Add("ShowSpare1", "Door Menu", DoorMenu)
	
	function DoorMenu( ply )
	
		local tr = util.GetPlayerTrace(ply)
		local trace = util.TraceLine(tr)
		if !(trace.Entity:IsDoor()) then return end
		local tar = trace.Entity
		local b = tar:GetRPOwner() == ply
		if math.floor((ply:GetPos():Distance( tar:GetPos() ))/40) > 5 then return end
	
		net.Start("doormenu")
		net.WriteBool(b)
		net.Send(ply)
	end

elseif CLIENT then

	function openDoorMenu( owned )
	
		local ply = LocalPlayer()
	
		local DoorFrame = vgui.Create( "DFrame" )
			DoorFrame:SetSize( 185, 385 )
			DoorFrame:SetTitle( "Door Menu" )
			DoorFrame:SetVisible( true )
			DoorFrame:SetDraggable( false )
			DoorFrame:ShowCloseButton( true )
			DoorFrame:Center()
			DoorFrame:MakePopup()	
			DoorFrame.Paint = function(self,w,h)
				draw.RoundedBox( 8, 0, 0, w, h, Color( 25, 68, 131, 75 ) )
			end

		local BuyBtn = vgui.Create( "DButton", DoorFrame )
			BuyBtn:SetText( "Buy Door" )
			BuyBtn:SetPos( 10, 35 )
			BuyBtn:SetSize( 165, 105 )
			BuyBtn:SetEnabled(!owned)
			BuyBtn:SetColor(COLOR_BLACK)
			BuyBtn.Paint = function (self, w ,h)
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
				if owned then
					draw.RoundedBox( 4, 0, 0, w, h, Color(155,155,155,255) )				
				end
			end
			BuyBtn.DoClick = function ()
				RunConsoleCommand("BRP_BuyDoor")
				DoorFrame:Close()
			end	
			
			
		local SellBtn = vgui.Create( "DButton", DoorFrame )
			SellBtn:SetText( "Sell Door" )
			SellBtn:SetPos( 10, 150 )
			SellBtn:SetSize( 165, 105 )
			SellBtn:SetColor(COLOR_BLACK)

			SellBtn.Paint = function (self, w ,h)
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
			end
			SellBtn.DoClick = function ()	
				RunConsoleCommand("BRP_SellDoor")	
				DoorFrame:Close()				
			end
			
			
		local ChangeNameBtn = vgui.Create( "DButton", DoorFrame )
			ChangeNameBtn:SetText( "Change Door Name" )
			ChangeNameBtn:SetPos( 10, 265 )
			ChangeNameBtn:SetSize( 165, 105 )
			ChangeNameBtn:SetColor(COLOR_BLACK)
			ChangeNameBtn.Paint = function (self, w ,h)
				draw.RoundedBox( 4, 0, 0, w, h, COLOR_WHITE )
			end
			ChangeNameBtn.DoClick = function ()	
				openNameMenu()
				DoorFrame:Close()
			end			
		
	end	
	
	function openNameMenu()
	
		local TitleFrame = vgui.Create( "DFrame" )
			TitleFrame:SetSize( 300, 150 )
			TitleFrame:SetTitle( "Change Door Name" )
			TitleFrame:SetVisible( true )
			TitleFrame:SetDraggable( false )
			TitleFrame:ShowCloseButton( true )
			TitleFrame:Center()
			TitleFrame:MakePopup()		
	
		local DermaText = vgui.Create("DTextEntry", TitleFrame )		
			DermaText:SetPos( 75, 50 )
			DermaText:SetTall( 20 )
			DermaText:SetWide( 150 )		
			
		local TitleButton = vgui.Create( "DButton", TitleFrame )
			TitleButton:SetText( "Door Name!" )
			TitleButton:SetPos( 100, 100 )
			TitleButton:SetSize( 100, 25 )				
			TitleButton.DoClick = function ()
				TitleFrame:Close()
				RunConsoleCommand("BRP_NameDoor",DermaText:GetValue())
				//notification.AddLegacy( "You have changed your title to: "..DermaText:GetValue()..".", NOTIFY_HINT, 5 )
			end				

	
	end	
	
	net.Receive( "doormenu", function(len)
		openDoorMenu( net.ReadBool() )
	end)
	
	
end	