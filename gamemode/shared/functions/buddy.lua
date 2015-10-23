local meta = FindMetaTable("Player")

function meta:SetBuddyList( tbl )

	if not self.BuddyList then self.BuddyList = {} return end

	self.BuddyList = tbl
	
end

function meta:AddBuddy( ply )

	table.Add(self.BuddyList, ply)

end

function meta:GetBuddyList()

	return self.BuddyList

end
