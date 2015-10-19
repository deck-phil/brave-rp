local meta = FindMetaTable("Player")

function meta:SetRPName( name )

	name = trimText(name)
	
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

function trimText( str )

	if !(string.find(str, "  ")) then return str end
	
	local strTbl = string.Explode(string.Trim(str), " ")
	local newName = ""
	
	for k, v in pairs(strTbl)do
		NewName = NewName.." "..string.Trim(strTabl[v])
	end

	return string.Trim(NewName)
	
end