local meta = FindMetaTable("Player")


function meta:CreateOutfitList()

	self:SetNWString( "OutfitList", "" )

end


function meta:GetOutfitList()

	return self:GetNWString("OutfitList")

end

function meta:GetRoleOutfits( role )

	//print(role)

	local prevString =  self:GetNWString("OutfitList", "")

	//print(prevString)	
	
	for k, v in pairs(RPModels) do
	
		if v.role == role then
	
			prevString = prevString.."#"..v.id
	
		end
	end
	
	//print(prevString)
	
	self:SetNWString( "OutfitList", prevString )

end

function meta:ReconstructOutfitList( idList )

	local GString = "#"
	
	for k, v in pairs(idList) do
		if !(v == "") then
			GString = GString.."#"..v
		end
	end

	//print("GString "..GString)
	
	self:SetNWString( "OutfitList", GString )
	
end



function meta:RemoveOutfit(id)

	local ids = self:GetNWString("OutfitList")
	
	local idTable = string.Explode( "#", ids )
	
	for k, v in pairs(idTable) do
		if v == id then
			table.RemoveByValue( idTable, v )
			break
		end
	end

	self:ReconstructOutfitList(idTable)
	
end



function meta:AddOutfit(id)

	local IDS = self:GetNWString("OutfitList")
	
	self:SetNWString("OutfitList", IDS.."#"..id)

end



function OutfitsGetValue( Iput, value, Oput )
/*
	print("Iput "..Iput)
	print("value "..value)
	print("Oput "..Oput)*/

	for k, v in pairs( RPModels ) do
	
		if v[Iput] == value then
			return v[Oput]	
		end
	
	end

end

function meta:hasOutfitTimes( num, id )

//num = amount of times

	local n = 0
	local outfitlist = string.Explode("#", self:GetOutfitList())
	
	for k, v in pairs(outfitlist) do
		if v == id then 
			n = 1 + n
		end
	end
	
	if n >= num then return true end
	
	return false
	
end


function meta:CreateOutfit( id )

	local path = OutfitsGetValue( "id", id, "model" )
	
	//print("nyess"..path)
	
	
	
	local ent = ents.Create('brp_outfit_base')
		ent:NewOutfit( path )
		ent:SetPos( self:LocalToWorld(Vector(35, 0,0)))
		ent:Spawn()
	
	
end

function meta:DropOutfit( id )

	local path = OutfitsGetValue( "id", id, "model" )

	if (path == self:GetRPModel()) && !(self:hasOutfitTimes(2,id)) then self:SendLua("notification.AddLegacy(\"You can't drop an outfit you're wearing.\", NOTIFY_GENERIC, 5)") return end
	if !(OutfitsGetValue( "id", id, "droppable" )) then self:SendLua("notification.AddLegacy(\"You can't drop that outfit.\", NOTIFY_GENERIC, 5)") return end

	self:SendLua("notification.AddLegacy(\"You dropped "..OutfitsGetValue("id", id, "name")..".\", NOTIFY_GENERIC, 5)")
	
	self:RemoveOutfit(id)
	self:CreateOutfit( id )
	
end

function meta:UseOutfit( path )

	local id = OutfitsGetValue( "model", path, "id" )
	
	self:SendLua("notification.AddLegacy(\"You picked up "..OutfitsGetValue("id", id, "name")..".\", NOTIFY_GENERIC, 5)")
	
	self:AddOutfit(id)

end

function meta:ConvertOddOutfits( path )
	
	local newPath = path
	
	//print("ODDPATHASDWDASDWDSDW"..path)
	local tbl = OutfitsGetValue( "model", path, "diffModel" )
	
	if !tbl then return newPath end
	
	if OutfitsGetValue( "model", path, "diffModel" ) then
	
		newPath = path..""..self:GetOGModelType()
		
	end	

	/* OLD	if path == RPModels["Citizen"]["model"] then
		newPath = path..""..self:GetOGModelType()
	elseif path == RPModels["Medic"]["model"] then
		newPath = path..""..self:GetOGModelType()
	elseif path  == RPModels["Rebel"]["model"] then
		newPath = path..""..self:GetOGModelType()
	end*/

	
	return newPath

end