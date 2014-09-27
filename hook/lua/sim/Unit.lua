local oldUnit = Unit
Unit = Class(oldUnit) {

	transportProtected = false,
    
	--Get rid of a broken check mechanism
    ShieldIsOn = function(self)
        if self.MyShield then
            return self.MyShield:IsOn()
        end
    end,

	--This change is part of fixing personal shields
    OnDamage = function(self, instigator, amount, vector, damageType)
        if self.CanTakeDamage then
            self:DoOnDamagedCallbacks(instigator)

			--Pass damage to an active personal shield, as personal shields no longer have collisions
            if self:GetShieldType() == 'Personal' and self:ShieldIsOn() then
                self.MyShield:ApplyDamage(instigator, amount, vector, damageType)
            elseif EntityCategoryContains(categories.NUKE, instigator) and transportProtected == true then
				self.MyShield:RevokeTransportProtection()
				self:DoTakeDamage(instigator, amount, vector, damageType)			
			elseif EntityCategoryContains(categories.COMMAND, self) and damageType == 'Overcharge' then
				amount = 500
				self:DoTakeDamage(instigator, amount, vector, damageType)
			else
				self:DoTakeDamage(instigator, amount, vector, damageType)
            end
        end
    end,	
	
	--Apply protection to transported units if appropriate
    OnTransportAttach = function(self, attachBone, unit)
		if self:ShieldIsOn() then
			unit:SetCanTakeDamage(false)
		end
		oldUnit.OnTransportAttach(self, attachBone, unit)		
    end,	
	
	OnTransportDetach = function(self, attachBone, unit)
		unit:SetCanTakeDamage(true)
		oldUnit.OnTransportDetach(self, attachBone, unit)
	end,		
	
	IsTransportProtected = function(self, value)
		transportProtected = value
	end,	
	
	--Add this function here to change the WaitSeconds to make higher drops look natural again
    TransportAnimationThread = function(self,rate)
        local bp = self:GetBlueprint().Display.TransportAnimation
        
        if rate and rate < 0 and self:GetBlueprint().Display.TransportDropAnimation then
            bp = self:GetBlueprint().Display.TransportDropAnimation
            rate = -rate
        end

        WaitSeconds(1)	--From 0.5
        if bp then
            local animBlock = self:ChooseAnimBlock( bp )
            if animBlock.Animation then
                if not self.TransAnimation then
                    self.TransAnimation = CreateAnimator(self)
                    self.Trash:Add(self.TransAnimation)
                end
                self.TransAnimation:PlayAnim(animBlock.Animation)
                rate = rate or 1
                self.TransAnimation:SetRate(rate)
                WaitFor(self.TransAnimation)
            end
        end
    end,	
	
	--Empty these functions, their purpose is now done in shield.lua. Harbinger's unique script
	--still uses them though
	OnShieldEnabled = function(self)
	end,
	
	OnShieldDisabled = function(self)
	end,
	
	OnShieldHpDepleted = function(self)
	end,
	
	OnShieldEnergyDepleted = function(self)
	end,
}