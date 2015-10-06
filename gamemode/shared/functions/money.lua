local meta = FindMetaTable("Player")

function meta:SetMoney( amount )

	self:SetNWInt("rpmoney", amount)

end

function meta:GetMoney()

	return self:GetNWInt("rpmoney", default )

end

function meta:GiveMoney(amount)

	self:SetNWInt("rpmoney", ( self:GetNWInt("rpmoney") + amount ))
	
	self:SendLua("notification.AddLegacy(\"You receive "..amount.."$.\", NOTIFY_GENERIC, 5)")
	
end

function meta:TakeMoney(amount)

	self:SetNWInt("rpmoney", ( self:GetNWInt("rpmoney") - amount ))
	
	if self:GetNWInt("rpmoney") < 0 then self:SetNWInt("rpmoney", 0) end

	self:SendLua("notification.AddLegacy(\"You lose "..amount.."$.\", NOTIFY_GENERIC, 5)")	

end

function meta:SaveMoney()

	self:SetPData("SQLmoney", self:GetNWString("rpmoney") )

end

function meta:LoadMoney()

	self:SetNWInt("rpmoney", self:GetPData("SQLmoney") )
	
end

function meta:RPSalary()

	local salmoney = self:GetRPSalary()

	self:SendLua("notification.AddLegacy(\"You receive your salary.\", NOTIFY_GENERIC, 5)")		
	self:GiveMoney(salmoney)

end

function CreateRPSalary( ply )

	timer.Create( ""..ply:SteamID().. "|salary", defaultSalaryTime, 0, function () ply:RPSalary() end )

end

function DeleteRPSalary( ply )

	timer.Destroy( ""..ply:SteamID().. "|salary")

end
//hook.Add( "PlayerDeath", "playerDeathSalary", DeleteRPSalary )
hook.Add( "PlayerDisconnected", "playerDisconnectSalary", DeleteRPSalary )

function meta:canAfford( amount )

	if self:GetMoney() - amount > -1 then 

	return true

	else

	self:SendLua("notification.AddLegacy(\"You need more money.\", NOTIFY_GENERIC, 5)")	

	return false

	end

end

function meta:GetRPSalary()

	local t = self:Team()

	if t == 1 or t == 2 then
		return defaultAlphaSalary
	elseif t == 3 or t == 4 then
		return defaultBetaSalary
	elseif t == 5 or t == 6 then
		return defaultDeltaSalary
	elseif t == 7 or t == 8 then
		return defaultGammaSalary
	elseif t == 9 or t == 10 then
		return defaultEpsilonSalary
	elseif t == 11 then
		return defaultOmegaSalary		
	end

end

function PayMoney( p1, p2, amount)

	if (p1:GetMoney() - amount) < 0 then return end
	if amount < 0 then return end
	
	p1:TakeMoney(amount)
	
	p2:GiveMoney(amount)
	
	print(p1:GetRPName().. " paid " ..p2:GetRPName().. " " ..amount.. "$.")

end

function DropMoney( ply, amount )

	if (ply:GetMoney() - amount) < 0 then return end
	if amount < 0 then return end

	ply:TakeMoney( amount )

	local ent = ents.Create('brp_money')
		ent:SetPos( ply:LocalToWorld(Vector(35, 0,40)))
		ent:SetMMoney(amount)
		ent:Spawn()

	print(ply:GetRPName().. " dropped "..amount.. "$.")		
		
end
