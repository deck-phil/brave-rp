local meta = FindMetaTable("Player")

function meta:SetRPModel( path )

	local conved = self:ConvertOddOutfits( path )
	
	self:RegisterCPID()
	
	self:SetNWString("rpmodel", conved)
	
	self:SetModel( conved )
	
	MaskHUDInit( self )
	
	print(self:Name().. " has changed to " ..conved)

end

function meta:GetRPModel()

	return self:GetNWString( "rpmodel", defaultModel )

end

function meta:SaveRPModel()

	self:SetPData("SQLmodel", self:GetNWString("rpmodel") )

end

function meta:LoadRPModel()

	self:SetNWInt("rpmodel", self:GetPData("SQLmodel") )
	
end

function meta:SetOGModel( path )

	self:SetNWString("OGmodel", path)
	
	self:SetOGModelType( path )
	
	self:SetModel( path )
	
	print(self:Name().. " has OG'd to " ..path)

end

function meta:GetOGModel()

	return self:GetNWString( "OGmodel", defaultModel )

end

function meta:SetOGModelType( path )

	local sep = string.Explode( "/" , path)

	self:SetNWString("OGtype", sep[4])
	
	print(self:Name().. " has OGtype'd to " ..sep[4])

end

function meta:GetOGModelType()

	return self:GetNWString( "OGtype" )

end