local prop = FindMetaTable("Entity")
local meta = FindMetaTable("Player")

if SERVER then

	util.AddNetworkString("PropPerms:ServerUpdate")
	util.AddNetworkString("PropPerms:ClientUpdate")
	/*
	function prop:AddPerm()
	
	end

	function meta:SendPerm(prop)
	
		for k,v in pairs(prop.Groups) do

			net.Start("PropPerms:ClientUpdate")
			net.WriteString(k)
			net.WriteBool(v)
			net.SendToServer(self)		
		
		end
	
	end*/
	
	net.Receive("PropPerms:ServerUpdate", function(len, ply)
		
		local prop, group, bool = net.ReadEntity(), net.ReadString(), net.ReadBool()

		if not prop.Groups then prop.Groups = {} end
		
		prop.Groups[group] = bool
		
		PrintTable(prop.Groups)
	
	end)

elseif CLIENT then

	function AddPerm( prop, group )

		if not prop.Groups then prop.Groups = {} end
	
		if !(HasRole(group)) then group = group:GetRPName() end
		
		if prop.Groups[group] then
	
			prop.Groups[group] = false
			SendPerm(prop)
			
		else
		
			prop.Groups[group] = true
			SendPerm(prop)		
		
		end

	end
	
	function IsPerm( prop, group, str )
	
		if not prop.Groups then prop.Groups = {} end
	
		if str then
			if prop.Groups[group] then
				return "True"
			else
				return "False"
			end
		end
	
		return prop.Groups[group]
	
	end
	
	function SendPerm(prop)
	
		for k,v in pairs(prop.Groups) do
			
			net.Start("PropPerms:ServerUpdate")
			net.WriteEntity(prop)
			net.WriteString(k)
			net.WriteBool(v)
			net.SendToServer()
			
		end		
	
	end
	
end