
if SERVER then

		hook.Add("OnEntityCreated","ACFE_Inject",function(ent)
			if ent and ent:IsValid() and ent:GetClass() == "acf_engine" and not ent.acfe_detected then 
				ent.oldUpdate = ent.Update
				if ent.oldUpdate and not ACF.Repositories then --acf3 fix
					
					ent.Update = function(self,ArgsTable) --dirty motherfuckers  dirty fix
					if self.Active then return false, "Turn off the engine before updating it!" end
					
					if ArgsTable[1] ~= self.Owner then -- Argtable[1] is the player that shot the tool
						return false, "You don't own that engine!"
					end

					local Id = ArgsTable[4]	-- Argtable[4] is the engine ID
					local Lookup = list.Get("ACFEnts").Mobility[Id]

					if Lookup.model ~= self.Model then
						return false, "The new engine must have the same model!"
					end
					
					local Feedback = ""
					if Lookup.fuel != self.FuelType then
						Feedback = " Fuel type changed, fuel tanks unlinked."
						for Key,Value in pairs(self.FuelLink) do
							table.remove(self.FuelLink,Key)
							--need to remove from tank master?
						end
					end

					self.Id = Id
					self.SoundPath = Lookup.sound
					self.Weight = Lookup.weight
					self.PeakTorque = Lookup.torque
					self.PeakTorqueHeld = Lookup.torque
					self.IdleRPM = Lookup.idlerpm
					self.PeakMinRPM = Lookup.peakminrpm
					self.PeakMaxRPM = Lookup.peakmaxrpm
					self.LimitRPM = Lookup.limitrpm
					self.Inertia = Lookup.flywheelmass*(3.1416)^2
					self.iselec = Lookup.iselec -- is the engine electric?
					self.FlywheelOverride = Lookup.flywheeloverride -- modifies rpm drag on iselec==true
					self.IsTrans = Lookup.istrans
					self.FuelType = Lookup.fuel
					self.EngineType = Lookup.enginetype
					self.RequiresFuel = Lookup.requiresfuel
					self.SoundPitch = Lookup.pitch or 1
					self.SpecialHealth = true
					self.SpecialDamage = true
					self.TorqueMult = self.TorqueMult or 1
					self.FuelTank = 0
					
					self.TorqueScale = ACF.TorqueScale[self.EngineType]
					
					--calculate boosted peak kw
					if self.EngineType == "Turbine" or self.EngineType == "Electric" then
						self.peakkw = ( self.PeakTorque * ( 1 + self.PeakMaxRPM / self.LimitRPM )) * self.LimitRPM / (4*9548.8) --adjust torque to 1 rpm maximum, assuming a linear decrease from a max @ 1 rpm to min @ limiter
						self.PeakKwRPM = math.floor(self.LimitRPM / 2)
					else
						self.peakkw = self.PeakTorque * self.PeakMaxRPM / 9548.8
						self.PeakKwRPM = self.PeakMaxRPM
					end
					
					--calculate base fuel usage
					if self.EngineType == "Electric" then
						self.FuelUse = ACF.ElecRate / (ACF.Efficiency[self.EngineType] * 60 * 60) --elecs use current power output, not max
					else
						self.FuelUse = ACF.TorqueBoost * ACF.FuelRate * ACF.Efficiency[self.EngineType] * self.peakkw / (60 * 60)
					end

					self:SetModel( self.Model )	
					self:SetSolid( SOLID_VPHYSICS )
					self.Out = self:WorldToLocal(self:GetAttachment(self:LookupAttachment( "driveshaft" )).Pos)

					local phys = self:GetPhysicsObject()  	
					if IsValid( phys ) then 
						phys:SetMass( self.Weight ) 
					end
					
					self:SetNWString( "WireName", Lookup.name )
					self:UpdateOverlayText()
						return true, "Engine updated successfully!"
					end
				end
				ent.oldACF_Activate = ent.ACF_Activate
				ent.ACF_Activate = function(self)
					acfe_inject(ent)
					ent.oldACF_Activate(ent)
				end

			end
		end)
		
		
		function acfe_inject(ent)
			
			if string.find(ent:GetModel(), "/turbine") then
				local model = ent:GetModel()
				if string.find(model,"turbine_l.mdl") then
					ent.MaxThrust = 256
				elseif string.find(model,"turbine_m.mdl") then
					ent.MaxThrust = 128
				elseif string.find(model,"turbine_s.mdl") then
					ent.MaxThrust = 64
				end
				
				
				
				
				
				--[[ent.oldTriggerInput = ent.TriggerInput
					if ent.oldTriggerInput then
					ent.TriggerInput = function(self, iname, value)
						if not self or not self:IsValid() then return end
						if iname == "Thrust" then self.Thrust = math.Clamp(value,0,100) end
						if iname == "FlameEffect" then self:SetNetworkedBool("acfe_effects", (value >0 and true or false) ) end
						if iname == "FlameColor" then self:SetNetworkedVector("acfe_effect_color", Vector(math.Clamp(value.x or 0, 0, 255), math.Clamp(value.y or 0, 0, 255), math.Clamp(value.z or 0, 0, 255)) ) end
						self.oldTriggerInput(self, iname, value)
					end
				else
					ent.oldTriggerInput = ent.TriggerInput
				end--]]
				
			if not ACF.Repositories then -- acf 3...
				
				Wire_AdjustInputs(ent,{"Active", "Throttle", "Thrust", "FlameEffect", "FlameColor [VECTOR]"})
				ent.TriggerInput = function(self,iname,value) --overwrite original func cuz overwriting hooks is gay 

						if (iname == "Throttle") then
							self.Throttle = math.Clamp(value,0,100)/100
						end
						if (iname == "Active") then
							if (value > 0 and not self.Active and self.Legal) then
								--make sure we have fuel
								local HasFuel
								if not self.RequiresFuel then
									HasFuel = true
								else 
									for _,fueltank in pairs(self.FuelLink) do
										if fueltank.Fuel > 0 and fueltank.Active and fueltank.Legal then HasFuel = true break end
									end
								end
								
								if HasFuel then
									self.Active = true
									if not (self.SoundPath=="") then
										self.Sound = CreateSound(self, self.SoundPath)
										self.Sound:PlayEx(0.5,100)
									end
									self:ACFInit()
								end
							elseif (value <= 0 and self.Active) then
								self.Active = false
								self.FlyRPM = 0
								self.RPM = {}
								self.RPM[1] = self.IdleRPM
								if self.Sound then
									self.Sound:Stop()
								end
								self.Sound = nil
								Wire_TriggerOutput( self, "RPM", 0 )
								Wire_TriggerOutput( self, "Torque", 0 )
								Wire_TriggerOutput( self, "Power", 0 )
								Wire_TriggerOutput( self, "Fuel Use", 0 )
							end
						end

						if iname == "Thrust" then self.Thrust = math.Clamp(value,0,100) end
						if iname == "FlameEffect" then self:SetNetworkedBool("acfe_effects", (value >0 and true or false) ) end
						if iname == "FlameColor" then self:SetNetworkedVector("acfe_effect_color", Vector(math.Clamp(value.x or 0, 0, 255), math.Clamp(value.y or 0, 0, 255), math.Clamp(value.z or 0, 0, 255)) ) end
											
				end
			end	
				

				timer.Create("acfe_turbine_"..ent:EntIndex().."_update", 0.1, 0, function()
					if ent and ent:GetClass() == "acf_engine" and ent.FlyRPM then
						ent:SetNetworkedFloat( "acfe_turbine_thrust", (ent.FlyRPM / ent.LimitRPM) * ( ( ent.Thrust or 0 )+50) / 100 )
						
					end
				end)
				ent.oldOnRemove = ent.OnRemove
				if ent.oldOnRemove then
					ent.OnRemove = function(self) --overwrite ent:onremove
						timer.Remove("acfe_turbine_"..self:EntIndex().."_update")
						self.oldOnRemove(self) --call original onremove
					end
				else
					ent.oldOnRemove = ent.OnRemove
				end
       			
       			-- apply thrust 
       			ent.oldPhysicsUpdate = ent.PhysicsUpdate
				if ent.oldPhysicsUpdate then
					ent.PhysicsUpdate = function(self,phys)
						if self and self:IsValid() and phys and phys:IsValid() and self.Active ~= false and self.FlyRPM ~=0 then
							self.CalculatedThrust = ((( self.FlyRPM / self.LimitRPM ) * (self.Thrust or 0))*self.MaxThrust)*10
							phys:ApplyForceCenter( ( self:GetForward() or -self:GetForward() ) * self.CalculatedThrust) --apply formula to phys obj
						end
						self.oldPhysicsUpdate(self,phys)
					end
				else
					ent.oldPhysicsUpdate = ent.PhysicsUpdate --reassign if first try failed
				end
				
			end
			if string.find(ent:GetModel(), "/pulsejet") then
				--stop sounds on removal

				ent.oldOnRemove = ent.OnRemove
				if ent.oldOnRemove then
					ent.OnRemove = function(self) --overwrite ent:onremove
						if self.Sound2 then
							self.Sound2:Stop() --stop new sound on remove
						end
						timer.Remove("acfe_pulsejet_"..self:EntIndex().."_update")
						self.oldOnRemove(self) --call original onremove
					end
				else
					ent.oldOnRemove = ent.OnRemove
				end
				
				
				local model = ent:GetModel()
				if string.find(model,"pulsejetl.mdl") then
					ent.TraceSize = 350
					ent.SoundOffPitch=100
					ent.MaxThrust=256
					ent.Soundlevel=110
				elseif string.find(model,"pulsejetm.mdl") then
					ent.TraceSize = 225
					ent.SoundOffPitch=150
					ent.MaxThrust=128
					ent.Soundlevel=100
				elseif string.find(model,"pulsejets.mdl") then
					ent.TraceSize = 100
					ent.SoundOffPitch=200
					ent.MaxThrust=64
					ent.Soundlevel=90
				end
				
				--ent.oldThink = ent.Think
				--if ent.oldThink then
					--ent.Think = function(self)
						
					timer.Create("acfe_pulsejet_"..ent:EntIndex().."_update", 0.1, 0, function()
					--so dirty gotta wash my hands   my old method slowed down think hook too much...
						if ent.Sound ~= nil then 
							ent.Sound:Stop() 
						end
						
						if ent.Active ~= false and ent.FlyRPM ~=0 then
							--exhaust damage
							ent.acfetrace = util.TraceLine({
								start = ent:GetPos(),
								endpos = ent:GetPos() - ent:GetForward() * ent.TraceSize,
								filter = ent
							})
							if ent.acfetrace and ent.acfetrace.Entity and IsValid(ent.acfetrace.Entity) and IsEntity(ent.acfetrace.Entity) then
								ACFE_ApplyDamage(ent.acfetrace.Entity,ent)
							end
						
							if not ent.Sound2 or not ent.Sound2:IsPlaying() then
								ent.Sound2 = CreateSound(ent,ent.SoundPath) --create sound 2 when engine is on
								if  ent.Sound2 and not ent.Sound2:IsPlaying() then
									ent.Sound2:SetSoundLevel(ent.Soundlevel)
									ent.Sound2:PlayEx(0.3,115) --play			
								end
							end

							if ent.Sound2 and ent.Sound2:IsPlaying() then 
								ent.Sound2:ChangePitch(120-(math.Clamp(ent.Throttle,0,1)*20)) --pitch and volume
								ent.Sound2:ChangeVolume(0.5+ (math.Clamp(ent.Throttle,0,1)/2) )
							end
							
							ent:SetNetworkedFloat( "acfe_pjet_thrust",((( math.Clamp(ent.Throttle,0,1) or 0 )+0.1)) ) --effect size
							ent:SetBodygroup(2,1) --on state bodygroup
							
						else
							ent:SetNetworkedFloat( "acfe_pjet_thrust",0 ) --turn off effects
							if ent.Sound2 and ent.Sound2:IsPlaying() then
								ent.Sound2:Stop() --stop sound and remove object 
								ent.Sound2 = nil
								ent:EmitSound("acf_engines/pulsejetoff.wav",ent.Soundlevel,ent.SoundOffPitch,0.5,0)
							end
							ent:SetBodygroup(2,0) --off state bodygroup
							
						end
					end)
						--self.oldThink(self)
						
						
						
					--end
				--else
					--ent.oldThink = ent.Think
				--end	
				
				--apply thrust
				ent.oldPhysicsUpdate = ent.PhysicsUpdate
				if ent.oldPhysicsUpdate then
					ent.PhysicsUpdate = function(self,phys)
						if self and self:IsValid() and phys and phys:IsValid() and self.Active ~= false and self.FlyRPM ~=0 then
							self.CalculatedThrust = ( self.MaxThrust * (( math.Clamp(self.Throttle,0,1) or 0)*1000) ) --thrust formula, dont laught lol
							phys:ApplyForceCenter( ( self:GetForward() or -self:GetForward() ) * self.CalculatedThrust) --apply formula to phys obj
						end
						self.oldPhysicsUpdate(self,phys)
					end
				else
					ent.oldPhysicsUpdate = ent.PhysicsUpdate --reassign if first try failed
				end
				
				
				
			end

		end--end function acfe_inject
		
		function ACFE_ApplyDamage(ent,self) 
			if not self or not self.Owner or not ent then return end
			if(ent:IsPlayer()) then
				ent:TakeDamage(15,self.Owner,self)
			else
				ent:TakeDamage(20,self.Owner,self)
				local HitRes = {}
					
				HitRes = ACF_Damage ( ent , {Kinetic = 150,Momentum = 0,Penetration = 15} , 2 , 0 , self.Owner )
				if HitRes and HitRes.Kill then
					constraint.RemoveAll( ent )
					ent:SetParent(nil)
					ent:SetCollisionGroup( COLLISION_GROUP_NONE ) 
					local Phys = ent:GetPhysicsObject()
					Phys:EnableMotion( true )
					Phys:Wake()
				end
			end
		end
		

		
end	--end IF SERVER

if CLIENT then
		local pemitter = ParticleEmitter(Vector(0,0,0))

		hook.Add("Think","ACFE_Inject",function()
			for k,ent in pairs(ents.FindByClass("acf_engine")) do
				if ent and ent:IsValid() and not ent.acfe_detected then
					ent.acfe_detected = true
					acfe_inject(ent)
				end
			end
		end)
		
		function acfe_inject(ent)
			if string.find(ent:GetModel(),"/turbine_") then
				--effect offset
				ent.GetOffset = function(self)
					local Offset = Vector()
					if self and self:IsValid() and self:GetClass() == "acf_engine" then
						local model = self:GetModel()
						if string.find(model,"turbine_l.mdl") then
							Offset = Vector(-50,0,0)
							Size = 1
						elseif string.find(model,"turbine_m.mdl") then
							Offset = Vector(-35,0,0)
							Size = 0.75
						elseif string.find(model,"turbine_s.mdl") then
							Offset = Vector(-25,0,0)
							Size = 0.5
						end
						
					end
					return {Size, Offset}
				end
				
				ent.CalcNormal = function (self)
					local Offset = self:GetOffset()[2] or Vector()
					return (self:LocalToWorld(Offset) - self:GetPos()):GetNormalized()
				end
				
				--overwrite think
				ent.oldThink = ent.Think
					if ent.oldThink then
					ent.Think = function(self)
						if self and self:IsValid() then
							if self:GetNetworkedBool("acfe_effects") then
								self.EffectSize = self:GetNetworkedFloat("acfe_turbine_thrust")
								self.EffectColor = self:GetNetworkedVector("acfe_effect_color")
							else
								self.EffectSize = 0
								self.EffectColor = Vector()
							end
						end
						self.oldThink(self)
					end
				else
					ent.oldThink = ent.Think
				end
				
				--overwrite draw
				ent.oldDraw = ent.Draw
				if ent.oldDraw then
		            ent.Draw = function(self)
					    if not self or not self:IsValid() then return end
		                self.oldDraw(self)
						if self.EffectSize and self.EffectSize > 0 then
							self:EffectDraw_fire()
						end
		            end
		        else
		        	ent.oldDraw = ent.Draw
	        	end
	            
	            ent.EffectDraw_fire = function(self)
					local Size = self:GetOffset()[1] or 1
					local Offset = self:GetOffset()[2] or Vector()
					
					if not Size then Size = 1 end
					local vOffset = self:LocalToWorld(Offset)
					local vNormal = self:CalcNormal()
					local speed = math.Rand(290,752)
					local roll = math.Rand(-90,90)
						--------------------
					local particle = pemitter:Add( "particle/fire", vOffset )
						particle:SetVelocity( vNormal * speed )
						particle:SetDieTime( (0.2*Size) * math.Clamp(self.EffectSize*4 or 0,0.1,4)+0.01 )
						particle:SetStartAlpha( 255 )
						particle:SetEndAlpha( 100 )
						particle:SetStartSize( 8.8*Size )
						particle:SetEndSize( 22*Size )
						particle:SetColor( self.EffectColor.x or 0, self.EffectColor.y or 0, self.EffectColor.z or 0 )
						particle:SetRoll( roll )
						--------------------
					local particle3 = pemitter:Add( "sprites/heatwave", vOffset )
						particle3:SetVelocity( vNormal * speed )
						particle3:SetDieTime( (0.3*Size) * math.Clamp(self.EffectSize*4 or 0,0,1)+0.1 )
						particle3:SetStartAlpha( 255 )
						particle3:SetEndAlpha( 55 )
						particle3:SetStartSize( 16*Size )
						particle3:SetEndSize( 18*Size )
						particle3:SetColor( 255,255,255 )
						particle3:SetRoll( roll )
						--------------------
					
				end			
			end		
			if string.find(ent:GetModel(),"/pulsejet") then
				ent.GetOffset = function(self)
					local Offset = Vector()
					if self and self:IsValid() and self:GetClass() == "acf_engine" then
						local model = self:GetModel()
						if string.find(model,"pulsejetl.mdl") then
							Offset = Vector(-110,0,0)
							Size = 1
						elseif string.find(model,"pulsejetm.mdl") then
							Offset = Vector(-85,0,0)
							Size = 0.55
						elseif string.find(model,"pulsejets.mdl") then
							Offset = Vector(-50,0,0)
							Size = 0.3
						end
						
					end
					return {Size, Offset}
				end
				
				ent.CalcNormal = function (self)
					local Offset = self:GetOffset()[2] or Vector()
					return (self:LocalToWorld(Offset) - self:GetPos()):GetNormalized()
				end
				
				ent.oldThink = ent.Think
				if ent.oldThink then
					ent.Think = function(self)
						self.EffectColor = Vector(255,255,255)
						if self and self:IsValid() then
							self.EffectSize = self:GetNetworkedFloat("acfe_pjet_thrust")
						end
						
						self.oldThink(self)
					end
				else
					ent.oldThink = ent.Think --reassign if first try failed
				end
				
				ent.oldDraw = ent.Draw
				if ent.oldDraw then
					ent.Draw = function(self)
						if not self or not self:IsValid() then return end
						self.oldDraw(self)
						if self.EffectSize and self.EffectSize > 0 then
							self:EffectDraw_fire()
						end
					end
				else
					ent.oldDraw = ent.Draw --reassign if first try failed
				end
				
				ent.EffectDraw_fire = function(self)
					local Size = self:GetOffset()[1] or 1
					local Offset = self:GetOffset()[2] or Vector()
					local vOffset = self:LocalToWorld(Offset)
					local vNormal = self:CalcNormal()
					local speed = math.Rand(150,352) * (self.EffectSize+1)
					local roll = math.Rand(-90,90)
						--------------------
					local particle = pemitter:Add( "particle/fire", vOffset )
						particle:SetVelocity( vNormal * (speed*7) )
						particle:SetDieTime( (0.05*Size) * math.Clamp(self.EffectSize or 0,0,1)+0.001 )
						particle:SetStartAlpha( 255 )
						particle:SetEndAlpha( 200 )
						particle:SetStartSize( 15*Size )
						particle:SetEndSize( 45*Size )
						particle:SetColor( 230 , 0, 0 )
						particle:SetRoll( roll )
						--------------------
					local particle3 = pemitter:Add( "particle/fire", vOffset )
						particle3:SetVelocity( vNormal * (speed*6) )
						particle3:SetDieTime( (0.1*Size) * math.Clamp(self.EffectSize*3 or 0,0,1)+0.01 )
						particle3:SetStartAlpha( 55 )
						particle3:SetEndAlpha( 20 )
						particle3:SetStartSize( 20*Size )
						particle3:SetEndSize( 30*Size )
						particle3:SetColor( 220,140,0 )
						particle3:SetRoll( roll )
						--------------------
						vOffset = self:LocalToWorld(Offset)

					local particle4 = pemitter:Add( "sprites/heatwave", vOffset )
						particle4:SetVelocity( vNormal * (speed*9) )
						particle4:SetDieTime( (0.3*Size) * math.Clamp(self.EffectSize/2 or 0,0,1)+0.001 )
						particle4:SetStartAlpha( 255 )
						particle4:SetEndAlpha( 200 )
						particle4:SetStartSize( 15.8*Size )
						particle4:SetEndSize( 100*(Size* math.Clamp(self.EffectSize or 0,0.2,1)) )
						particle4:SetColor( 255,255,255 )
						particle4:SetRoll( roll )
				end
				
			end
		
		end--end function acfe_inject
	
end