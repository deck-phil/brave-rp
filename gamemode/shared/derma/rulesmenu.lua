if SERVER then

	util.AddNetworkString("rules_menu")		
	
	function RulesMenu( ply )
		net.Start("rules_menu")
		net.Send(ply)	
	end
	
	hook.Add("ShowHelp", "Rules Menu", RulesMenu)
	
elseif CLIENT then
	
	net.Receive( "rules_menu", function(len)
		openRulesMenu()
	end)
	
	function openRulesMenu() 
	
		local ply = LocalPlayer()	
	
		RulesFrame = vgui.Create( "DFrame" )
		RulesFrame:SetSize( ScrW(), ScrH() )
		RulesFrame:SetTitle( "RULES" )
		RulesFrame:SetVisible( true )
		RulesFrame:SetDraggable( false )
		RulesFrame:ShowCloseButton( true )
		RulesFrame:Center()
		RulesFrame:MakePopup()		
		RulesFrame.Paint = function(self, w, h)
			draw.RoundedBox( 8, 0, 0, w, h, Color( 25, 68, 131, 50 ) )
		end		
	
	
	
	end
	
	
	
end