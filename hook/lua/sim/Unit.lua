local oldUnit = Unit
Unit = Class(oldUnit) {
    
    ShieldIsOn = function(self)
        if self.MyShield then
            return self.MyShield:IsOn()
        end
    end,

    OnDamage = function(self, instigator, amount, vector, damageType)
        if self.CanTakeDamage then
            self:DoOnDamagedCallbacks(instigator)

            if self:GetShieldType() == 'Personal' and self:ShieldIsOn() then
                local overkill = self.MyShield:GetOverkill(instigator, amount, damageType)
                self.MyShield:ApplyDamage(instigator, amount, vector, damageType)
                if overkill > 0 then
                    self:DoTakeDamage(instigator, overkill, vector, damageType)
                end
            else
                self:DoTakeDamage(instigator, amount, vector, damageType)
            end
        end
    end,
}
