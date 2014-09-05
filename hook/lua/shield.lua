local oldUnitShield = UnitShield
UnitShield = Class(oldUnitShield) {

	OnCollisionCheck = function(self,other)
		return false
	end
}