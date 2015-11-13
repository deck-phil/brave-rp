
local WICON = {}

function WICON:Init()
	self:SetSize(64,64)
	self.Paint = function() end
	self:SetColor(Color(0,0,0,0))	
end

function WICON.SetDoClick(  )

	if (ply:canAfford(v.price)) then
		self.DoClick = function( self ) end
	else
		notification.AddLegacy( "You bought something!", NOTIFY_HINT, 5 )
	end

end

WICON.PaintOver = function()
	draw.SimpleText("0$", "DebugFixed",64,0,Color(255,100,100),TEXT_ALIGN_RIGHT)
	if (LocalPlayer():canAfford(0)) then return end
	surface.SetDrawColor(255,100,100,55)
	surface.DrawRect(0,0,64,64)
end		

WICON.DoClick = function ()

	WICON:SetSize(54,54)

	if (LocalPlayer():canAfford(0)) then
		SendWeapon( k, 0 ) notification.AddLegacy( "You bought something!", NOTIFY_HINT, 5 )
	end	
end


function WICON.SetPaintOver( )

	self.PaintOver = function()
		draw.SimpleText(v.price.."$", "DebugFixed",64,0,Color(255,100,100),TEXT_ALIGN_RIGHT)
		if (ply:canAfford(v.price)) then return end
		surface.SetDrawColor(255,100,100,55)
		surface.DrawRect(0,0,64,64)
	end		
	
end

vgui.Register("WeaponSpawnIcon", WICON, "DButton")

