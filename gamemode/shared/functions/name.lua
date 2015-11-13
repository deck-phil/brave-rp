local meta = FindMetaTable("Player")

function meta:SetRPName( name )

	name = trimText(name)

	/*
	//Cap the first letter
	local strTbl = string.Explode(" ",string.Trim(name))
	name = ""
	
	for k, v in pairs(strTbl)do
	
		v = string.lower(v)
		local f = string.upper(string.sub(v,0,1))
		v = string.Replace(v,string.sub(v,0,1),f)
		
		name = name.." "..v
	end
	
	name = string.TrimLeft(name)
	
	if !(string.find(name," ")) then string.Replace(name,string.sub(name,0,1),string.upper(string.sub(name,0,1))) end*/
	
	
	self:SetNWString("rpname", name )
	
	if name == "" then return end
	
	print(self:Name().. " changed name to " ..self:GetNWString("rpname").. ".")
	
end

function meta:GetRPName()
	
	return self:GetNWString("rpname")
	
end

function meta:SaveRPName()

	self:SetPData("SQLname", self:GetNWString("rpname") )
	
	self:SetPData("SQLtitle", self:GetNWString("rptitle") )

end

function meta:LoadRPName()

	if not self:GetPData("SQLname") then return end

	self:SetNWString( "rpname", self:GetPData("SQLname") )
	
	self:SetNWString( "rptitle", self:GetPData("SQLtitle") )	

end


//RP TITLE
function meta:SetRPTitle( title )

	title = trimText(title)

	if string.len( title ) > 20 then 
	
		self:SendLua("notification.AddLegacy(\"That title is too long.\", NOTIFY_GENERIC, 5)") 
	
	return end

	self:SetNWString("rptitle", title )
	
	if title == "" then return end
	print(self:Name().. " changed title to " ..title.. ".")
	
end

function meta:GetRPTitle()

	return self:GetNWString("rptitle")

end

//Also caps it
function trimText( str )

	if !(string.find(str, "  ")) then return str end
	
	local strTbl = string.Explode(" ",string.Trim(str))
	local newName = ""
	
	for k, v in pairs(strTbl)do
		if v == "" then continue end
		
		newName = newName.." "..string.Trim(v)
	end

	return string.Trim(newName)
	
end

function GetNamePlayer( name )
		
	for k, v in pairs(player.GetAll()) do
		if v:GetRPName() == name then return v end
	end
			
end