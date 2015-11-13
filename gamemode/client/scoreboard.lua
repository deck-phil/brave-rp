//Needswork.

surface.CreateFont( "ScoreboardSmall", {
	font	= "Helvetica",
	size	= 18,
	weight	= 800
} )

surface.CreateFont( "ScoreboardDefault", {
	font	= "Helvetica",
	size	= 22,
	weight	= 800
} )

surface.CreateFont( "ScoreboardDefaultTitle", {
	font	= "Helvetica",
	size	= 32,
	weight	= 800
} )

--
-- This defines a new panel type for the player row. The player row is given a player
-- and then from that point on it pretty much looks after itself. It updates player info
-- in the think function, and removes itself when the player leaves the server.
--
local PLAYER_LINE = {
	Init = function( self )
		
		self.Avatar = self:Add("SpawnIcon")
		self.Avatar:Dock( LEFT )
		self.Avatar:DockMargin( 5,0,0,0)		
		self.Avatar:SetSize( 44, 44 )
		self.Avatar:SetModel( defaultModel )
		self.Avatar:SetMouseInputEnabled( false )		
	
		self.Name = self:Add( "DLabel" )
		self.Name:Dock( FILL )
		self.Name:SetFont( "ScoreboardDefault" )
		self.Name:SetTextColor( color_black )
		self.Name:DockMargin( 8, 0, 0, 0 )

		self.Mute = self:Add( "DImageButton" )
		self.Mute:SetSize( 44, 44 )
		self.Mute:Dock( RIGHT )

		self.Ping = self:Add( "DLabel" )
		self.Ping:Dock( RIGHT )
		self.Ping:SetWidth( 50 )
		self.Ping:SetFont( "ScoreboardDefault" )
		self.Ping:SetTextColor( color_black )
		self.Ping:SetContentAlignment( 5 )

		self.Deaths = self:Add( "DLabel" )
		self.Deaths:Dock( RIGHT )
		self.Deaths:SetWidth( 50 )
		self.Deaths:SetFont( "ScoreboardDefault" )
		self.Deaths:SetTextColor( color_black )
		self.Deaths:SetContentAlignment( 5 )

		self.Kills = self:Add( "DLabel" )
		self.Kills:Dock( RIGHT )
		self.Kills:SetWidth( 50 )
		self.Kills:SetFont( "ScoreboardDefault" )
		self.Kills:SetTextColor(color_black)
		self.Kills:SetContentAlignment( 5 )

		self.ID = self:Add( "DLabel" )
		self.ID:Dock( RIGHT )
		self.ID:DockMargin(0,0,140,0)
		self.ID:SetWidth( 50 )
		self.ID:SetFont( "ScoreboardDefault" )
		self.ID:SetTextColor( color_black )
		self.ID:SetContentAlignment( 5 )
		
		
		self:Dock( TOP )
		self:DockPadding( 3, 3, 3, 3 )
		self:SetHeight( 44 + 3 * 2 )
		self:DockMargin( 2, 0, 2, 2 )

	end,

	Setup = function( self, pl )

		self.Player = pl

		self.Avatar:SetPlayer( pl )		
		
		self:Think( self )

		--local friend = self.Player:GetFriendStatus()
		--MsgN( pl, " Friend: ", friend )

	end,

	Think = function( self )

		if ( !IsValid( self.Player ) ) then
			self:SetZPos( 9999 ) -- Causes a rebuild
			self:Remove()
			return
		end

		if !(self.Player:isRegistered()) then
		
			self.Avatar:SetModel( defaultModel )
			self.Name:SetText( "???" )
			self.ID:SetText( "????" )
			
		else
		
			if ( self.OGModel == nil || self.OGModel != self.Player:GetOGModel() ) then
				self.OGModel = self.Player:GetOGModel()
				self.Avatar:SetModel( self.OGModel )
			end				
					
			if ( self.PName == nil || self.PName != self.Player:GetRPName() ) then
				self.PName = self.Player:GetRPName()
				self.Name:SetText( self.PName )
			end

			if ( self.citID == nil || self.citID != self.Player:GetRegister() ) then
				self.citID = self.Player:GetRegister()
				self.ID:SetText( self.citID )
			end		
			
		end
		
		if ( self.NumKills == nil || self.NumKills != self.Player:Frags() ) then
			self.NumKills = self.Player:Frags()
			self.Kills:SetText( self.NumKills )
		end		
		
		if ( self.NumDeaths == nil || self.NumDeaths != self.Player:Deaths() ) then
			self.NumDeaths = self.Player:Deaths()
			self.Deaths:SetText( self.NumDeaths )
		end

		if ( self.NumPing == nil || self.NumPing != self.Player:Ping() ) then
			self.NumPing = self.Player:Ping()
			self.Ping:SetText( self.NumPing )
		end

		--
		-- Change the icon of the mute button based on state
		--
		if ( self.Muted == nil || self.Muted != self.Player:IsMuted() ) then

			self.Muted = self.Player:IsMuted()
			if ( self.Muted ) then
				self.Mute:SetImage( "icon32/muted.png" )
			else
				self.Mute:SetImage( "icon32/unmuted.png" )
			end

			self.Mute.DoClick = function() self.Player:SetMuted( !self.Muted ) end

		end

		--
		-- Connecting players go at the very bottom
		--
		if ( self.Player:Team() == TEAM_CONNECTING ) then
			self:SetZPos( 2000 + self.Player:EntIndex() )
			return
		end

		--
		-- This is what sorts the list. The panels are docked in the z order,
		-- so if we set the z order according to kills they'll be ordered that way!
		-- Careful though, it's a signed short internally, so needs to range between -32,768k and +32,767
		--
		self:SetZPos( ( self.NumKills * -50 ) + self.NumDeaths + self.Player:EntIndex() )

	end,

	Paint = function( self, w, h )

		if ( !IsValid( self.Player ) ) then
			return	
		end
	
		draw.RoundedBox( 4, 3, 0, w-6	, h, color_white )

	end
}

--
-- Convert it from a normal table into a Panel Table based on DPanel
--
PLAYER_LINE = vgui.RegisterTable( PLAYER_LINE, "DPanel" )

--
-- Here we define a new panel table for the scoreboard. It basically consists
-- of a header and a scrollpanel - into which the player lines are placed.
--
local SCORE_BOARD = {
	Init = function( self )

		self.Header = self:Add( "Panel" )
		self.Header:Dock( TOP )
		self.Header:SetHeight( 100 )

		self.Name = self.Header:Add( "DLabel" )
		self.Name:SetFont( "ScoreboardDefaultTitle" )
		self.Name:SetTextColor( Color(85,85,85) )
		self.Name:Dock( TOP )
		self.Name:SetHeight( 70 )
		self.Name:SetContentAlignment( 5 )
		//self.Name:SetExpensiveShadow( 2, Color( 0, 0, 0, 200 ) )

		--self.NumPlayers = self.Header:Add( "DLabel" )
		--self.NumPlayers:SetFont( "ScoreboardDefault" )
		--self.NumPlayers:SetTextColor( Color( 255, 255, 255, 255 ) )
		--self.NumPlayers:SetPos( 0, 100 - 30 )
		--self.NumPlayers:SetSize( 300, 30 )
		--self.NumPlayers:SetContentAlignment( 4 )

		self.Scores = self:Add( "DScrollPanel" )
		self.Scores:Dock( FILL )
		self.Scores:DockMargin(0,0+5+10,0,0)

	end,

	PerformLayout = function( self )

		local space = 120	
	
		for k, v in pairs(player.GetAll()) do
			space = space + 50
		end
	
		self:SetSize( 700,space )
		self:SetPos( ScrW() / 2 - 350, 100 )

	end,

	Paint = function( self, w, h )

		draw.RoundedBox( 4, 0, 0, w, h, Color( 25, 68, 131, 75 ) ) // Black Background
		
		draw.RoundedBox( 4, 5, 0+5, w-10, 80, color_white) // Header BG

		draw.RoundedBox( 4, 5, 0+5+80+5, w-10, 20, Color(107,107,107, 255 ) ) //small bar
		draw.RoundedBox( 4, 5, 0+5+80+5+10, w-10, 10, Color(65,65,65, 255 ) )
		
		draw.SimpleText( "Name", "ScoreboardSmall",15,  0+5+80+5+1, Color(255,255,255,255) )
		
		draw.SimpleText( "Cit.ID", "ScoreboardSmall", 315,  0+5+80+5+1, Color(255,255,255,255) )
		
		draw.SimpleText( "Kills", "ScoreboardSmall", 510,  0+5+80+5+1, Color(255,255,255,255) )
		
		draw.SimpleText( "Deaths", "ScoreboardSmall", 552,  0+5+80+5+1, Color(255,255,255,255) )
		
		draw.SimpleText( "Ping", "ScoreboardSmall", 612,  0+5+80+5+1, Color(255,255,255,255) )
	
	end,

	Think = function( self, w, h )

		self.Name:SetText( GetHostName() )

		--
		-- Loop through each player, and if one doesn't have a score entry - create it.
		--

		local plyrs = getRPAdmins()
		for id, pl in pairs( player.GetAll() ) do

			if ( IsValid( pl.ScoreEntry ) ) then continue end
			pl.ScoreEntry = vgui.CreateFromTable( PLAYER_LINE, pl.ScoreEntry )
			pl.ScoreEntry:Setup( pl )

			self.Scores:AddItem( pl.ScoreEntry )

		end

	end
}

SCORE_BOARD = vgui.RegisterTable( SCORE_BOARD, "EditablePanel" )

function GM:ScoreboardShow()

	if ( !IsValid( g_Scoreboard ) ) then
		g_Scoreboard = vgui.CreateFromTable( SCORE_BOARD )
	end

	if ( IsValid( g_Scoreboard ) ) then
		g_Scoreboard:Show()
		g_Scoreboard:MakePopup()
		g_Scoreboard:SetKeyboardInputEnabled( false )
	end

end

function GM:ScoreboardHide()

	if ( IsValid( g_Scoreboard ) ) then
		g_Scoreboard:Hide()
	end

end

function GM:HUDDrawScoreBoard()
end
