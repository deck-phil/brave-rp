local meta = FindMetaTable("Player")

function meta:SetRPName( name )

	if string.len( name ) > 30 then 
	
		self:SendLua("notification.AddLegacy(\"That name was too long.\", NOTIFY_GENERIC, 5)") 
	
	end
	
	local RPNAME = string.sub(name, 1, 30)
	
	self:SetNWString("rpname", RPNAME )
	
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