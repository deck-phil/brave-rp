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

SWEP.PrintName	 = "Launcher"	 // 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot	 = 4	 // Slot in the weapon selection menu
SWEP.SlotPos	 = 3	 // Position in the slot

SWEP.DrawAmmo = false

SWEP.Author = "BolONYz"
SWEP.Instructions = "Walk around with these to look normal."
SWEP.Base = "weapon_base"

SWEP.Category	 = "BraveRP Weapons"

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Primary.ClipSize = 5
SWEP.Primary.DefaultClip = 5
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Ammo = "SMG1_Grenade"

//SWEP.Primary.Sound = Sound("Weapon_AR2.Single")
SWEP.Primary.Delay = 0.4

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.HoldType = "crossbow"
SWEP.ViewModelFOV = 69.748743718593
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {
 ["base"] = { scale = Vector(1, 1, 1), pos = Vector(-4.631, -0.926, -9.815), angle = Angle(1.11, 0, -7.778) }
}

SWEP.IronSightsPos = Vector(3.819, -2.211, -15.679)
SWEP.IronSightsAng = Vector(10.553, 0, 0)

SWEP.VElements = {
	["Clip1++++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "base", rel = "", pos = Vector(-1, 0, 1), angle = Angle(-92.338, 0, 0), size = Vector(0.449, 0.449, 0.449), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1+"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "base", rel = "", pos = Vector(-1, 0, 13), angle = Angle(-92.338, 0, 0), size = Vector(0.449, 0.449, 0.449), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dwa"] = { type = "Model", model = "models/props_c17/gaspipes006a.mdl", bone = "base", rel = "", pos = Vector(2.2, 2.4, 9.869), angle = Angle(0, 64.286, 180), size = Vector(0.5, 0.5, 0.301), color = Color(135, 170, 175, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip2"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "base", rel = "", pos = Vector(-1, 0, 23.377), angle = Angle(180, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(39, 55, 72, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1+++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "base", rel = "", pos = Vector(-1, 0, 5), angle = Angle(-92.338, 0, 0), size = Vector(0.449, 0.449, 0.449), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "base", rel = "", pos = Vector(-1, 0, 9), angle = Angle(-92.338, 0, 0), size = Vector(0.449, 0.449, 0.449), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip3"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "base", rel = "", pos = Vector(-1, 5.714, 2.596), angle = Angle(0, 0, 0), size = Vector(0.497, 0.497, 0.301), color = Color(79, 122, 133, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "base", rel = "", pos = Vector(-1, 0, 17), angle = Angle(-92.338, 0, 0), size = Vector(0.449, 0.449, 0.449), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["Clip1++++++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2, 1.6, -4.901), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip2"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(18, 1.6, -9.5), angle = Angle(76, 0, 0), size = Vector(0.6, 0.6, 0.6), color = Color(39, 55, 72, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.399, 1.6, -7.301), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1++++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13.5, 1.6, -8.5), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1+"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.909, 1.6, -7.901), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1+++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.8, 1.6, -6.7), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1+++++"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.6, 1.6, -5.5), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip3"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(15.064, 1.6, -3.636), angle = Angle(76, 0, 0), size = Vector(0.4, 0.4, 0.2), color = Color(79, 122, 133, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Clip1"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.2, 1.6, -6.1), angle = Angle(-14, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(135, 170, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:Initialize()

	// other initialize code goes here
	self:SetWeaponHoldType( self.HoldType )

	if CLIENT then
	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

function SWEP:PrimaryAttack()
	
	if ( !self:CanPrimaryAttack() ) then return end
	if ( IsValid(can)) and can:GetName() == self.Owner:SteamID() then return end
	
	self:SetNextPrimaryFire( CurTime() + 2 )	
	self:TakePrimaryAmmo(1)

	self.Weapon:EmitSound( "weapons/grenade_launcher1.wav" )
	
	self.Owner:ViewPunch( Angle( -5, 2, 0 ) )

	self:throwXplCan("models/props_junk/PopCan01a.mdl")
end

function SWEP:throwXplCan( model_file )
 
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
	
	timer.Simple( math.Rand( 1, 3 ), function() ExplodeCan(can) end )
end

function ExplodeCan( can )


    local explosion = ents.Create( "env_explosion" ) // Creating our explosion
	explosion:SetKeyValue( "spawnflags", 144 ) //Setting the key values of the explosion
	explosion:SetKeyValue( "iMagnitude", 35 ) // Setting the damage done by the explosion
    explosion:SetKeyValue( "iRadiusOverride", 350 ) // Setting the radius of the explosion
    explosion:SetPos(can:GetPos()) // Placing the explosion where we are
    explosion:Spawn( ) // Spawning it
    explosion:Activate()
    explosion:Fire("explode","",0)
	
	/*
	can:SetKeyValue( "iMagnitude", "220" )
	can:Fire("Explode", 0, 0)*/
	can:EmitSound( "weapon_AWP.Single", 400, 400 )
	can:Remove()
	
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end