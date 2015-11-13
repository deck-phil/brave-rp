local meta = FindMetaTable("Player")

function meta:SetRPModel( path )

	local conved = self:ConvertOddOutfits( path )
	
	self:RegisterCPID()
	
	self:SetNWString("rpmodel", conved)
	
	self:SetModel( conved )
	
	MaskHUDInit( self )
	
	if not OutfitsGetValue( "model", path, "weight" ) then
		self:SetRunSpeed( defaultRunSpeed)
		self:SetWalkSpeed( defaultWalkSpeed )
	else
		self:SetRunSpeed( defaultRunSpeed - OutfitsGetValue( "model", path,"weight" ))
		self:SetWalkSpeed( defaultWalkSpeed - OutfitsGetValue( "model", path,"weight" ))
	end
	
	print(self:Name().. " has changed to " ..conved)

end

function meta:GetRPModel()

	return self:GetNWString( "rpmodel", defaultModel )

end

function meta:SaveRPModel()

	self:SetPData("SQLmodel", self:GetNWString("OGmodel") )

end

function meta:LoadRPModel()

	if not self:GetPData("SQLmodel") then return end

	self:SetNWString("OGmodel", self:GetPData("SQLmodel") )
	self:SetModel(self:GetPData("SQLmodel"))
	
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