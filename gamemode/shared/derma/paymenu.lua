if SERVER then

	util.AddNetworkString("paymenu")
	util.AddNetworkString( "sendPay" )
	util.AddNetworkString( "sendDropPay" )
	
	concommand.Add( "BRP_PayMenu", PayMenu )
	
	function PayMenu( ply )
		net.Start("paymenu")
		net.Send(ply)
	end
	
	
	net.Receive( "sendPay", function( len, ply )
		PayMoney( ply, net.ReadEntity(), net.ReadDouble() )
	end )
	
	net.Receive( "sendDropPay", function( len, ply )
		DropMoney( ply, net.ReadDouble() )
	end )
	

elseif CLIENT then

	function openPaying()
		local ply = LocalPlayer()
	
		local PayingFrame = vgui.Create( "DFrame" )
			PayingFrame:SetSize( 250, 175 )
			PayingFrame:SetTitle( "Paying Menu" )
			PayingFrame:SetVisible( true )
			PayingFrame:SetDraggable( true )
			PayingFrame:ShowCloseButton( true )
			PayingFrame:Center()
			PayingFrame:MakePopup()		
			PayingFrame.Paint = function(self, w, h)
				draw.RoundedBox( 8, 0, 0, w, h, Color(25, 68, 131, 150))
			end	
	
		local DermaText = vgui.Create("DTextEntry", PayingFrame )		
			DermaText:SetPos( 50, 50 )
			DermaText:SetTall( 20 )
			DermaText:SetWide( 150 )
			DermaText:SetNumeric(true)

		local GiveBtn = vgui.Create( "DButton", PayingFrame )
			GiveBtn:SetText( "Give Money" )
			GiveBtn:SetPos( 75, 90 )
			GiveBtn:SetSize( 100, 25 )
			GiveBtn:SetColor(color_black)
			GiveBtn.Paint = function(self, w, h)
				draw.RoundedBox( 4, 0, 0, w, h, color_white)
			end	
			GiveBtn.DoClick = function ()
				
				if DermaText:GetValue() == "" then notification.AddLegacy( "Enter a number!", NOTIFY_HINT, 5 ) return end
				if DermaText:GetInt() < 0 then notification.AddLegacy( "You can't give that much!", NOTIFY_HINT, 5 ) return end
				if LocalPlayer():GetMoney() < DermaText:GetInt() then notification.AddLegacy( "You can't give that much!", NOTIFY_HINT, 5 ) return end
				
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
							
								SendPayment( LocalPlayer(), target, (DermaText:GetInt()) )
								PayingFrame:Close()
								notification.AddLegacy( "You gave "..DermaText:GetInt().."$ to "..target:GetRPName()..".", NOTIFY_GENERIC, 5 )
								
							else	
								notification.AddLegacy( "You need to be closer!", NOTIFY_HINT, 5 )
							end
						end
					else
						notification.AddLegacy( "That is not a player!", NOTIFY_HINT, 5 )
					end
				end						
			end			
			
		local DropButton = vgui.Create( "DButton", PayingFrame )
			DropButton:SetText( "Drop" )
			DropButton:SetPos( 75, 125 )
			DropButton:SetSize( 100, 25 )
			DropButton:SetColor(color_black)
			DropButton.Paint = function(self, w, h)
				draw.RoundedBox( 4, 0, 0, w, h, color_white)
			end				
			DropButton.DoClick = function ()		
	
				if DermaText:GetValue() == "" then notification.AddLegacy( "Enter a number!", NOTIFY_HINT, 5 ) return end
				if DermaText:GetInt() < 0 then notification.AddLegacy( "You can't give that much!", NOTIFY_HINT, 5 ) return end
				if LocalPlayer():GetMoney() < DermaText:GetInt() then notification.AddLegacy( "You can't give that much!", NOTIFY_HINT, 5 ) return end
				
				SendDropPayment( DermaText:GetInt() )
				//notification.AddLegacy( "You dropped "..DermaText:GetInt().."$", NOTIFY_GENERIC, 5 )
				PayingFrame:Close()
			
			end
		
	end	
	
	function SendDropPayment( amount )
	
	    net.Start( "sendDropPay" )
		net.WriteDouble( amount )
		net.SendToServer() 
	
	end		
	
	function SendPayment( p1, p2, amount )
	
	    net.Start( "sendPay" )
        net.WriteEntity( p2 )
		net.WriteDouble( amount )
		net.SendToServer() 
	
	end	
	
	net.Receive( "paymenu", function(len)
		openPaying()
	end)
	
	
end	