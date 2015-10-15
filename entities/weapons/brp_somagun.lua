/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

SWEP.PrintName	 = "Soma Gun"	 // 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot	 = 4	 // Slot in the weapon selection menu
SWEP.SlotPos	 = 3	 // Position in the slot

SWEP.DrawAmmo = false

SWEP.Author = "BolONYz"
SWEP.Instructions = "Scraps of metal put together."
SWEP.Base = "weapon_base"

SWEP.Category	 = "BraveRP Weapons"

SWEP.AnimPrefix = "crowbar"

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Primary.ClipSize = 3
SWEP.Primary.DefaultClip = 3
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Ammo = "RPG_Round"
SWEP.Primary.Damage = 70
SWEP.Primary.AmmoType = "crossbow_bolt"

SWEP.ReloadingTime = 2

SWEP.Primary.Delay = 0.4

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""


SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"

function SWEP:Initialize()
	self:SetWeaponHoldType( "ar2" )
end

function SWEP:Think()
	if self.Owner:GetActiveWeapon():Clip1() == 0 and ToEmpty then
		self.Weapon:SendWeaponAnim( ACT_VM_IDLE_EMPTY )
                ToEmpty = false
	end
	if self.Owner:GetActiveWeapon():Clip1() > 0 and not ToEmpty then
		self.Weapon:SendWeaponAnim( ACT_VM_IDLE_EMPTY )
                ToEmpty = true
	end
end


function SWEP:PrimaryAttack()
	
	if ( !self:CanPrimaryAttack() ) then self.Weapon:SendWeaponAnim( ACT_VM_IDLE_EMPTY ) return end
	if ( IsValid(can)) and can:GetName() == self.Owner:SteamID() then return end
	
	self:SetNextPrimaryFire( CurTime() + 2 )	
	self:TakePrimaryAmmo(1)

	self.Weapon:EmitSound( "weapons/grenade_launcher1.wav" )
	
	self.Owner:ViewPunch( Angle( -5, 2, 0 ) )

	self:throwModel("models/props_junk/PopCan01a.mdl")
	
end

function SWEP:throwModel( model_file )
 
	local tr = self.Owner:GetEyeTrace();
	
	//We now exit if this function is not running on the server
	if (!SERVER) then return end;
 
	//The next task is to create a physics entity based on the supplied model.
	local ent = ents.Create ("prop_physics");
	
	ent:SetModel (model_file);
	ent:SetOwner( self.Owner)
	ent:SetName( self.Owner:SteamID() )
 
	//Set the initial position of the object. This might need some fine tuning; but it
	//seems to work for the models I have tried
	ent:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector() * 16));
	ent:SetAngles (self.Owner:EyeAngles());
	ent:Spawn();
	ent:AddEffects( EF_DIMLIGHT )
 
	//Now we need to get the physics object for our entity so we can apply a force to it
	local phys = ent:GetPhysicsObject();
 
	//Time to apply the force. My method for doing this was almost entirely empirical 
	//and it seems to work fairly intuitively with chairs.
	local shot_length = tr.HitPos:Length();
	phys:ApplyForceCenter (self.Owner:GetAimVector():GetNormalized() * 1000);
	
	local can = ent	
 
	//Now for the all important part of adding the spawned objects to the undo and cleanup data.
	cleanup.Add (self.Owner, "props", ent);
 
	undo.Create ("Thrown chair");
	undo.AddEntity (ent);
	undo.SetPlayer (self.Owner);
	undo.Finish();
	
	timer.Simple( math.Rand( 1, 3 ), function() SomaCan(can) end )
end

function SomaCan( can )

/*
    local explosion = ents.Create( "env_explosion" ) // Creating our explosion
	explosion:SetKeyValue( "spawnflags", 144 ) //Setting the key values of the explosion
    explosion:SetKeyValue( "iRadiusOverride", 350 ) // Setting the radius of the explosion
    explosion:SetPos(can:GetPos()) // Placing the explosion where we are
	explosion:SetColor( Color(0,200,0,255) )
    explosion:Spawn( ) // Spawning it
    explosion:Activate()
    explosion:Fire("explode","",0)*/
	
	local vPoint = can:GetPos()
	local effectdata = EffectData()
	effectdata:SetOrigin( vPoint )
	effectdata:SetScale( 10 )
	effectdata:SetColor( 0,200,0)
	util.Effect( "AntlionGib", effectdata )
	
	for k, v in pairs(player.GetAll()) do
	
		local targetPos = v:GetPos()
		local targetDistance = math.floor(can:GetPos():Distance( targetPos ))
			
		if targetDistance < 350 then
		
			if SERVER then
				SomaEffectInit(v)
			end
		end 
		
	end
	
	/*
	can:SetKeyValue( "iMagnitude", "220" )
	can:Fire("Explode", 0, 0)*/
	can:EmitSound( "weapon_AWP.Single", 400, 400 )
	can:Remove()
	
end

function SWEP:SecondaryAttack()

	if ( !self:CanPrimaryAttack() ) then return end
	
	self:SetNextSecondaryFire( CurTime() + 0.4 )	
	self:TakePrimaryAmmo(1)

	local vPoint = self.Owner:GetPos()
	local effectdata = EffectData()
	effectdata:SetOrigin( vPoint )
	effectdata:SetScale( 10 )
	effectdata:SetColor( 0,200,0)
	util.Effect( "AntlionGib", effectdata )
	sound.Play( "weapons/physcannon/energy_sing_explosion2.wav", vPoint )

	for k, v in pairs(player.GetAll()) do
	
			local targetPos = v:GetPos()
			local targetDistance = math.floor(self.Owner:GetPos():Distance( targetPos ))
			
			if targetDistance < 400 then
				if SERVER then
					SomaEffectInit(v)
				end
			end 	
	end
	
end
