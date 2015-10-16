function HoveringNames()

	//Init ent getter
	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end	
	
	local target = trace.Entity
	
		//if ent is a player and not himself
		if target:IsPlayer() and target != LocalPlayer() then
		
			//Get the distance
			local targetPos = target:GetPos() + Vector(0,0,84)
			local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
			local targetScreenpos = targetPos:ToScreen()
			
			//If the distance is cloe enough
			if targetDistance < 5 then
			
					local function StrucText( posx, posy, text, color) 
					
						local struc = {}	
							struc["pos"] = {posx,posy}
							struc["color"] = color
							struc["text"] = text
							struc["font"] = "Trebuchet18"
							struc["xalign"] = TEXT_ALIGN_CENTER
							struc["yalign"] = TEXT_ALIGN_CENTER
							
						return struc
						
					end	
			
					//Draw either the name or CopID
					if !table.HasValue( ModelTech, OutfitsGetValue( "model",target:GetRPModel(), "id")) then
						draw.TextShadow( StrucText( tonumber(targetScreenpos.x),tonumber(targetScreenpos.y), target:GetRPName() ,Color(155,155,155,210)), 1,255)
						draw.TextShadow( StrucText(tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 12), target:GetRPTitle(), Color(200,200,200,210)),1,255)
					else	
						draw.TextShadow( StrucText(tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 12), 'CP.'..target:GetCPRegister(), Color(190,40,40,210)),1,255)
					end
					
					//Draw their caste on screen
					draw.TextShadow(StrucText(tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 24), team.GetName( target:Team() ), team.GetColor( target:Team() )),1,255)
					
					//Draw their cop GUI
					if table.HasValue( ModelTech, OutfitsGetValue( "model",LocalPlayer():GetRPModel(), "id")) and !(table.HasValue( ModelTech, OutfitsGetValue( "model",target:GetRPModel(), "id"))) then
					
						//Draw citizens ID or unregistered
						if target:isRegistered() == true then
							draw.TextShadow( StrucText(tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 14), 'CITIZEN.'..target:GetRegister(), Color(190,40,40,210)),1,255)
						else
							draw.TextShadow( StrucText(tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 14), 'UNREGISTERED', Color(190,40,40,210)),1,255)
						end
						
						//Draw if their wanted
						if target:isWanted() == true then
							draw.TextShadow( StrucText(tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 28), 'WANTED', Color(190,40,40,210)),1,255)
						end
					
					end
					
			end
			
			
	end
end
hook.Add("HUDPaint", "HoveringNames", HoveringNames)

function HoveringWaypointNames()

	//Only cops have this, if they have their suits
	if !(table.HasValue( RPCops, LocalPlayer():GetRPRole())) then return end
	if !(table.HasValue( ModelTech, OutfitsGetValue( "model",LocalPlayer():GetRPModel(), "id"))) then return end

	//local tbl = GetWaypointTable()
	
	for k, v in pairs( ents.FindByClass("brp_waypoint") )do
	
		local target = v
	
		local targetPos = target:GetPos() + Vector(0,0,5)
		local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
		local targetScreenpos = targetPos:ToScreen()
		
		local trace = LocalPlayer():GetEyeTrace()
		local angle = trace.HitNormal:Angle()
		
		
		//Drawthe waypoint
		if targetDistance < 25 then	

			draw.SimpleText( v:GetWaypointName() , "DermaLarge", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 14), Color(190,40,40,210), TEXT_ALIGN_CENTER)
		
		end
	end

end
hook.Add("HUDPaint", "HoveringWaypointNames", HoveringWaypointNames)


function HoveringCrateNames( crate )

	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end
	
	local crate = trace.Entity
	
		if (crate:GetClass() == "brp_shipment_base") then
		
			local crateType = RPWeapons[crate:GetNWString("shipmentweapon")]
		
			local targetPos = crate:GetPos() + Vector(0,0,30)
			local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
			local targetScreenpos = targetPos:ToScreen()
			
			if targetDistance < 5 then
					draw.SimpleText( crateType["name"], "DermaLarge", tonumber(targetScreenpos.x), (tonumber(targetScreenpos.y)), Color(255,20,20,255), TEXT_ALIGN_CENTER)
					draw.SimpleText( "Remaining: " .. crate:GetNWString( "remaining"), "DermaLarge", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 26), Color(255,255,255,255), TEXT_ALIGN_CENTER)
					//draw.SimpleText(team.GetName( crate:Team() ), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 24), team.GetColor( crate:Team() ), TEXT_ALIGN_CENTER)
			end 	
		end
		
		if (crate:GetClass() == "brp_entshipment_base") then
		
			//local crateType = RPEnts[crate:GetNWString("shipmententity")]
		
			local targetPos = crate:GetPos() + Vector(0,0,30)
			local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
			local targetScreenpos = targetPos:ToScreen()
			
			if targetDistance < 5 then
					draw.SimpleText( crate:GetNWString("shipmententity"), "DermaLarge", tonumber(targetScreenpos.x), (tonumber(targetScreenpos.y)), Color(255,20,20,255), TEXT_ALIGN_CENTER)
					draw.SimpleText( "Remaining: " .. crate:GetNWString( "remaining"), "DermaLarge", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 26), Color(255,255,255,255), TEXT_ALIGN_CENTER)
			end 	
		end

		if (crate:GetClass() == "brp_outfit_base") then
		
			local targetPos = crate:GetPos() + Vector(0,0,15)
			local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
			local targetScreenpos = targetPos:ToScreen()
			
			if targetDistance < 5 then
				draw.SimpleText( OutfitsGetValue( "model", crate:GetNWString("outfitmodel"), "name"  ), "DermaLarge", tonumber(targetScreenpos.x), (tonumber(targetScreenpos.y + 26)), Color(255,20,20,255), TEXT_ALIGN_CENTER)
				//not tested
				/*
				if holo then return end
				local holoModel = ClientsideModel( crate:GetNWString("outfitmodel"), RENDERGROUP_BOTH)
				local holo = true
				holoModel:SetPos(crate:GetPos())
				holoModel:SetColor( Color(255,255,255,100))
				*/
			
			end
		end
		
		
		if (crate:IsDoor()) then

			local targetPos = crate:LocalToWorld(Vector(0,0,0))
			if crate:GetClass() == "prop_door_rotating" then
			//print(crate:GetAngles())
				targetPos = crate:LocalToWorld(Vector(0,22,0))
			elseif crate:GetClass() == "func_door_rotating" then
				//print(crate:GetAngles())
				//targetPos = crate:LocalToWorld(Vector(22,0,0)) + crate:LocalToWorldAngles():Forward()
			end
		

			local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
			local targetScreenpos = targetPos:ToScreen()
		
			if targetDistance < 5 then	
				
				if crate:IsOwned() then
					//draw.SimpleText( crate:GetRPOwner():GetRPName(), "Trebuchet18", tonumber(targetScreenpos.x), (tonumber(targetScreenpos.y + 26)), Color(255,20,20,255), TEXT_ALIGN_CENTER)
				else
					draw.SimpleText( "Unowned", "Trebuchet18", tonumber(targetScreenpos.x), (tonumber(targetScreenpos.y)), Color(255,255,255,200), TEXT_ALIGN_CENTER)
					draw.SimpleText( "Press F3 to buy this door.", "Trebuchet18", tonumber(targetScreenpos.x), (tonumber(targetScreenpos.y + 13)), Color(255,255,255,200), TEXT_ALIGN_CENTER)
				end 
			end
		end

		
end
hook.Add("HUDPaint", "HoveringCrateNames", HoveringCrateNames)

hook.Add( "PostDrawOpaqueRenderables", "DrawDoorsNames", function() 

	for _, ent in ipairs( ents.FindByClass("prop_door_rotating") ) do

		if !(ent:IsDoor()) then return end
		//if math.floorLocalPlayer():GetPos():Distance( ent:GetPos() ) < 5 then return end .DoorName
	
		if IsValid(ent:GetRPOwner()) then
		
			cam.Start3D2D( ent:LocalToWorld(Vector(3,24,0)), ent:LocalToWorldAngles( Angle(0,90,90) ), 1 )
				draw.DrawText(ent:GetDoorName(), "Trebuchet18", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
			cam.End3D2D()
			
			cam.Start3D2D( ent:LocalToWorld(Vector(-3,24,0)), ent:LocalToWorldAngles( Angle(0,-90,90) ), 1 )
				draw.DrawText(ent:GetDoorName(), "Trebuchet18", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
			cam.End3D2D()
		
		end
		
	end

end)