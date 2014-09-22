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