--Hooking into the main state of the normal class so just switch the order of two lines, giving unit.lua more control over shield parameters.
local oldShield = Shield
Shield = Class(oldShield) {

    OnState = State {
        Main = function(self)
			
            -- If the shield was turned off; use the recharge time before turning back on
            if self.OffHealth >= 0 then
                self.Owner:SetMaintenanceConsumptionActive()
                self:ChargingUp(0, self.ShieldEnergyDrainRechargeTime)

                -- If the shield has less than full health, allow the shield to begin regening
                if self:GetHealth() < self:GetMaxHealth() and self.RegenRate > 0 then
                    self.RegenThread = ForkThread(self.RegenStartThread, self)
                    self.Owner.Trash:Add(self.RegenThread)
                end
            end

            -- We are no longer turned off
            self.OffHealth = -1

            self:UpdateShieldRatio(-1)

			--Switch the order of these around to make many things possible
            self:CreateShieldMesh()			
			self.Owner:OnShieldEnabled() --Now an empty function needed only for Harbinger
			--OnShieldEnabled() is part of several functions which play a sound and manipulate the energy drain.
			--They are only called from shield.lua, so I can replace them here.
			self.Owner:PlayUnitSound('ShieldOn')
			self.Owner:SetMaintenanceConsumptionActive()
			
			--Then we can make any units inside a transport with a Shield invulnerable here
			self:ProtectTransportedUnits()
			self.Owner:IsTransportProtected(true)

            local aiBrain = self.Owner:GetAIBrain()

            WaitSeconds(1.0)
            local fraction = self.Owner:GetResourceConsumed()
            local on = true
            local test = false

            -- Test in here if we have run out of power; if the fraction is ever not 1 we don't have full power
            while on do
                WaitTicks(1)
                self:UpdateShieldRatio(-1)
                fraction = self.Owner:GetResourceConsumed()
                if fraction != 1 and aiBrain:GetEconomyStored('ENERGY') <= 0 then
                    if test then
                        on = false
                    else
                        test = true
                    end
                else
                    on = true
                    test = false
                end
            end
            -- Record the amount of health on the shield here so when the unit tries to turn its shield
            -- back on and off it has the amount of health from before.
            --self.OffHealth = self:GetHealth()
            ChangeState(self, self.EnergyDrainRechargeState)
        end,

        IsOn = function(self)
            return true
        end,
    },
	
    OffState = State {
        Main = function(self)

            -- No regen during off state
            if self.RegenThread then
                KillThread(self.RegenThread)
                self.RegenThread = nil
            end

            -- Set the offhealth - this is used basically to let the unit know the unit was manually turned off
            self.OffHealth = self:GetHealth()

            -- Get rid of teh shield bar
            self:UpdateShieldRatio(0)

            self:RemoveShield()
            self.Owner:OnShieldDisabled() --Now an empty function needed only for Harbinger
			self.Owner:PlayUnitSound('ShieldOff')
			self.Owner:SetMaintenanceConsumptionInactive()

			--Apply vulnerabilities
			self:RevokeTransportProtection()
			self.Owner:IsTransportProtected(false)

            WaitSeconds(1)            
        end,

        IsOn = function(self)
            return false
        end,
    },	
	
    DamageRechargeState = State {
        Main = function(self)
            self:RemoveShield()
            self.Owner:OnShieldHpDepleted(self) --Now an empty function needed only for Harbinger
			self.Owner:PlayUnitSound('ShieldOff')
			
			--Apply vulnerabilities
			self:RevokeTransportProtection()
			self.Owner:IsTransportProtected(false)
			
            # We must make the unit charge up before gettings its shield back
            self:ChargingUp(0, self.ShieldRechargeTime)

            -- Fully charged, get full health
            self:SetHealth(self, self:GetMaxHealth())

            ChangeState(self, self.OnState)
        end,

        IsOn = function(self)
            return false
        end,
    },	
	
    EnergyDrainRechargeState = State {
        Main = function(self)
            self:RemoveShield()
            self.Owner:OnShieldEnergyDepleted(self) --Now an empty function needed only for Harbinger
			self.Owner:PlayUnitSound('ShieldOff')
			--Apply vulnerabilities
			self:RevokeTransportProtection()
			self.Owner:IsTransportProtected(false)
			
            self:ChargingUp(0, self.ShieldEnergyDrainRechargeTime)

            -- If the unit is attached to a transport, make sure the shield goes to the off state
            -- so the shield isn't turned on while on a transport
            if not self.Owner:IsUnitState('Attached') then
                ChangeState(self, self.OnState)
            else
                ChangeState(self, self.OffState)
            end
        end,

        IsOn = function(self)
            return false
        end,
    },	
	
	ProtectTransportedUnits = function(self)
		if EntityCategoryContains(categories.TRANSPORTATION, self.Owner) then
			self.Owner:SetCanTakeDamage(false)		
			local Cargo = self.Owner:GetCargo()
			for _, v in Cargo do
				v:SetCanTakeDamage(false)
			end	
		end
	end,
	
	RevokeTransportProtection = function(self)
		if EntityCategoryContains(categories.TRANSPORTATION, self.Owner) then	
			self.Owner:SetCanTakeDamage(true)		
			local Cargo = self.Owner:GetCargo()
			for _, v in Cargo do
				v:SetCanTakeDamage(true)
			end
		end
	end,
}

local oldUnitShield = UnitShield
UnitShield = Class(oldUnitShield) {

    CreateShieldMesh = function(self)
		--Remove the shield collision entirely to allow everything to go through unit.lua
		self:SetCollisionShape('None')	
        self.Owner:SetMesh(self.OwnerShieldMesh,true)
    end,
}
