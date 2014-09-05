local oldUnit = Unit
Unit = Class(oldUnit) {

    OnDamage = function(self, instigator, amount, vector, damageType)
        if self.CanTakeDamage then
            self:DoOnDamagedCallbacks(instigator)

			--Re-jig for the new shielding setup
            if self:GetShieldType() != 'Personal' or not self:ShieldIsUp() then
                self:DoTakeDamage(instigator, amount, vector, damageType)
			elseif self:GetShieldType() == 'Personal' and self:ShieldIsUp() then
				self.MyShield:OnDamage(instigator, amount, vector, damageType)	--Pass damage on to shield
            end
        end
    end,
}