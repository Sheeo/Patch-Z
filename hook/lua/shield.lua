local oldUnitShield = UnitShield
UnitShield = Class(oldUnitShield) {
	OnCollisionCheck = function(self,other)
		return false
	end,
    OnDamage = function(self, instigator, amount, vector, dmgType)
    end
}
