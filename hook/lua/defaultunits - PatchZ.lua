local Unit = import('/lua/sim/Unit.lua').Unit

StructureUnit = Class(Unit) {

    OnAdjacentTo = function(self, adjacentUnit, triggerUnit)
        if self:IsBeingBuilt() then return end
        if adjacentUnit:IsBeingBuilt() then return end
        
		--Remember all the adjacent units
		self.AdjacentUnitMemory = AdjacentUnitMemoryTable[adjacentUnit]
		
        local adjBuffs = self:GetBlueprint().Adjacency
        if not adjBuffs then return end
        
        for k,v in AdjacencyBuffs[adjBuffs] do
            Buff.ApplyBuff(adjacentUnit, v, self)
        end
        self:RequestRefreshUI()
        adjacentUnit:RequestRefreshUI()
    end,	
}

MassFabricationUnit = Class(StructureUnit) {

	OnConsumptionActive = function(self)
        StructureUnit.OnConsumptionActive(self)
        self:SetMaintenanceConsumptionActive()
        self:SetProductionActive(true)
		
		--Activate Adjacency bonuses if they weren't already
		if not AdjacencyBuffs[adjBuffs] then
			local adjBuffs = self:GetBlueprint().Adjacency
			if not adjBuffs then return end
		
			for k,v in AdjacencyBuffs[adjBuffs] do
				for k,v in AdjacentUnitMemory do
					Buff.ApplyBuff(adjacentUnit, v, self)
				end
			end
			self:RequestRefreshUI()
			adjacentUnit:RequestRefreshUI()
		end
    end,
}