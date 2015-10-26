local meta = FindMetaTable("Player")


if SERVER then

	util.AddNetworkString("Buddy:ClientUpdate")
	util.AddNetworkString("Buddy:ServerUpdate")

	hook.Add("PlayerInitialSpawn","Buddy:IN",function( self )
		self.BuddyList = {}
	end)
	
	function meta:AddBuddy( ply, bool )
	
		self.BuddyList[ply:UniqueID()] = bool
		
	end
	
	function meta:IsBuddy(tar)
	
		if not BuddyList then BuddyList = {} end
	
		if !(self.BuddyList[tar:SteamID()]) then return false end
	
		return self.BuddyList[tar:SteamID()]
	
	end
	
	function meta:SendBuddy()
		
		for k,v in pairs(self.BuddyList) do
			
			net.Start("Buddy:ClientUpdate")
			net.WriteInt(k)
			net.WriteBool(v)
			net.Send(self)
			
		end
		
	end

	net.Receive("Buddy:ServerUpdate", function(len, ply)
	
		if not ply.BuddyList then ply.BuddyList = {} end
		
		local tarID, bool = net.ReadString(), net.ReadBool()
		
		ply.BuddyList[tarID] = bool
	
	end)
	
elseif CLIENT then


	hook.Add("Initialize","Buddy:IN", function()
		BuddyList = {}
	end)

	net.Receive("Buddy:ClientUpdate", function(len, ply)
	
		if not BuddyList then BuddyList = {} end
		local tar, bool = net.ReadEntity(), net.ReadBool()
		
		BuddyList[tar:SteamID()] = bool
	
	end)
	
	function AddBuddy(ply)
	
		if BuddyList[ply:SteamID()] then
		
			BuddyList[ply:SteamID()] = false
			SendBuddy()
			
		return end
	
		BuddyList[ply:SteamID()] = true
		SendBuddy()
		
	end
	
	function SendBuddy()
	
		for k,v in pairs(BuddyList) do
			
			net.Start("Buddy:ServerUpdate")
			net.WriteString(k)
			net.WriteBool(v)
			net.SendToServer()
			
		end		
	
	end
	
	function IsBuddy(ply)

		if not BuddyList then BuddyList = {} end
	
		if not BuddyList[ply:SteamID()] then return false end
	
		return BuddyList[ply:SteamID()]
	
	end
	
end