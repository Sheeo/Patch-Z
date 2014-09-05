local oldUnit = Unit
Unit = Class(oldUnit) {

    OnDamage = function(self, instigator, amount, vector, damageType)
        if self.CanTakeDamage then
            self:DoOnDamagedCallbacks(instigator)

			--Re-jig for the new shielding setup
            if self:GetShieldType() != 'Personal' then
                self:DoTakeDamage(instigator, amount, vector, damageType)
			elseif self:GetShieldType() = 'Personal' and self:ShieldIsUp() then
				self.MyShield:OnDamage(instigator, amount, vector, damageType)	--Pass damage on to shield
			else
				self:DoTakeDamage(instigator, amount, vector, damageType)
            end
        end
    end,
}