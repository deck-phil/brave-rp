function HoveringNames()

	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end	
	
	local target = trace.Entity
	
		if target:IsPlayer() and target != LocalPlayer() then
		
			local targetPos = target:GetPos() + Vector(0,0,84)
			local targetDistance = math.floor((LocalPlayer():GetPos():Distance( targetPos ))/40)
			local targetScreenpos = targetPos:ToScreen()
			//Players
			if targetDistance < 5 then
					if !table.HasValue( ModelTech, OutfitsGetValue( "model",target:GetRPModel(), "id")) then
						draw.SimpleText( target:GetRPName(), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y), Color(200,200,200,210), TEXT_ALIGN_CENTER)
					else	
						draw.SimpleText( 'CP.'..target:GetCPRegister(), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y), Color(190,40,40,210), TEXT_ALIGN_CENTER)
						
						//print("dsadawds")
						//PrintTable(GetWaypointTable())
					end
			
					//draw.SimpleText( target:GetRPName(), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y), Color(200,200,200,210), TEXT_ALIGN_CENTER)
					draw.SimpleText( target:GetRPTitle(), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 12), Color(200,200,200,210), TEXT_ALIGN_CENTER)
					draw.SimpleText(team.GetName( target:Team() ), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y + 24), team.GetColor( target:Team() ), TEXT_ALIGN_CENTER)
					
					if table.HasValue( ModelTech, OutfitsGetValue( "model",LocalPlayer():GetRPModel(), "id")) and !(table.HasValue( ModelTech, OutfitsGetValue( "model",target:GetRPModel(), "id"))) then
					
						if target:isRegistered() == true then
							draw.SimpleText( 'CITIZEN.'..target:GetRegister(), "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 14), Color(190,40,40,210), TEXT_ALIGN_CENTER)
						else
							draw.SimpleText( 'UNREGISTERED', "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 14), Color(190,40,40,210), TEXT_ALIGN_CENTER)
						end
						
						if target:isWanted() == true then
							draw.SimpleText( 'WANTED', "Trebuchet18", tonumber(targetScreenpos.x), tonumber(targetScreenpos.y - 28), Color(190,40,40,210), TEXT_ALIGN_CENTER)
						end
					
					end
					
			end
			
			
	end
end
hook.Add("HUDPaint", "HoveringNames", HoveringNames)

function HoveringWaypointNames()

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
			end 	
		end
		
		
		if (crate:IsDoor()) then
		
			if !(crate:GetClass() == "prop_door_rotating") then return end

			local targetPos = crate:LocalToWorld(Vector(0,22,0))
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

	for id, ent in pairs( ents.FindByClass( "prop_door_rotating" ) ) do

		print(tostring(ent))
		//if math.floorLocalPlayer():GetPos():Distance( ent:GetPos() ) < 5 then return end
	
	if IsValid(ent:GetRPOwner()) then
	
		cam.Start3D2D( ent:LocalToWorld(Vector(3,24,0)), ent:LocalToWorldAngles( Angle(0,90,90) ), 1 )
			draw.DrawText(ent:GetRPOwner():GetRPName(), "Trebuchet18", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
		cam.End3D2D()
		
		cam.Start3D2D( ent:LocalToWorld(Vector(-3,24,0)), ent:LocalToWorldAngles( Angle(0,-90,90) ), 1 )
			draw.DrawText(ent:GetRPOwner():GetRPName(), "Trebuchet18", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
		cam.End3D2D()
	
	end
	
	end

end)