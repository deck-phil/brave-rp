// Variables that are used on both client and server

SWEP.PrintName	 = "Keys"	 // 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot	 = 1	 // Slot in the weapon selection menu
SWEP.SlotPos	 = 2	 // Position in the slot

SWEP.DrawAmmo = false

SWEP.HoldType	 = "normal"
SWEP.Author = "BolONYz"
SWEP.Instructions = "Walk around with these to look normal and lock doors."
SWEP.Base = "weapon_base"
SWEP.PrintName = "Hands"

SWEP.Category	 = "BraveRP Weapons"

SWEP.ViewModel = Model("models/weapons/v_hands.mdl")
SWEP.WorldModel	= ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.UseHands = false

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
	self:SetWeaponHoldType("normal")
end

function SWEP:PrimaryAttack()
		
	if SERVER then
	
	local tr = util.GetPlayerTrace(self.Owner)
	local trace = util.TraceLine(tr)
		
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return  end	
			
	local door = trace.Entity
			
		if (door:IsDoor()) then
					
			local targetPos = door:GetPos() + Vector(0,0,84)
			local targetDistance = math.floor((self.Owner:GetPos():Distance( targetPos ))/40)
						
			if targetDistance < 5 then
				
				self.Owner:EmitSound("npc/metropolice/gear" .. math.floor(math.Rand(1,7)) .. ".wav")
				
				if door.IsLocked then
					door:UnLockDoor( self.Owner)
				else
					door:LockDoor( self.Owner )
				end
				
			end	
	
		end
	end
end

function SWEP:SecondaryAttack()

end