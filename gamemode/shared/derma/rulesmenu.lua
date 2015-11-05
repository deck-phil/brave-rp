if SERVER then

	util.AddNetworkString("rules_menu")		
	
	concommand.Add( "BRP_RulesMenu", RulesMenu )	
	
	function RulesMenu( ply )
		net.Start("rules_menu")
		net.Send(ply)	
	end
	
	hook.Add("ShowSpare2", "Rules Menu", RulesMenu)
	
elseif CLIENT then
	
	net.Receive( "rules_menu", function(len)
		openRulesMenu()
	end)
	
	function openRulesMenu() 
	
		local ply = LocalPlayer()	
	
	local RulesFrame = vgui.Create( "DFrame" )
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
		
	local HTML = vgui.Create("HTML", RulesFrame)
		HTML:SetPos(50,50)
		HTML:SetSize(ScrW() - 100, ScrH() - 100)
		HTML:OpenURL("http://forums.braverp.com/showthread.php?tid=7&pid=7#pid7")
	
	end
	
	
	
end