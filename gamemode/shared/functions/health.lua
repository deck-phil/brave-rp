local meta = FindMetaTable("Player")

function meta:GetHealthStatus()

	local hlth = self:Health()
	
	if hlth <= healthDeadThres then
		return healthDead
	elseif hlth <= healthCriticalThres then
		return healthCritical
	elseif hlth <= healthWeakThres then
		return healthWeak	
	elseif hlth <= healthDamagedThres then
		return healthDamaged		
	elseif hlth <= healthHealthyThres then
		return healthHealthy		
	end
	
end

function meta:GetHealthColor()

	local hlth = self:Health()
	
	if hlth <= healthDeadThres then
		return healthDeadColor
	elseif hlth <= healthCriticalThres then
		return healthCriticalColor
	elseif hlth <= healthWeakThres then
		return healthWeakColor
	elseif hlth <= healthDamagedThres then
		return healthDamagedColor	
	elseif hlth <= healthHealthyThres then
		return healthHealthyColor	
	end
	

end

function meta:GetStatus()


end