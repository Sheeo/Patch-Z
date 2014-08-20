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
		
			--Apply all buffs to all adjacent units. Like this?
			for k,v in AdjacencyBuffs[adjBuffs] do
				for k,adjacentUnit in AdjacentUnitMemory do
					Buff.ApplyBuff(adjacentUnit, v, self)
				end
			end
			
			--Turn on the visual adjacency FX
			for k,adjacentUnit in AdjacentUnitMemory do
				CreateAdjacentEffect(self, v)		--Function found in StructureUnit class
				adjacentUnit:RequestRefreshUI()				
			end
			
			self:RequestRefreshUI()
		end
    end,
	
	OnConsumptionInActive = function(self)
        StructureUnit.OnConsumptionInActive(self)
        self:SetMaintenanceConsumptionInactive()
        self:SetProductionActive(false)
		
		--Remove any active adjacency bonuses provided by this unit
		local asjBuffs = self:GetBlueprint().Adjacency
		if adjBuffs and AdjacencyBuffs[adjBuffs] then		--Make sure there are some buffs present
			for k,v in AdjacencyBuffs[adjBuffs] do
				for k,adjacentUnit in AdjacentUnitMemory do
					if Buff.HasBuff(adjacentUnit, v) then
						Buff.RemoveBuff(adjacentUnit, v)
					end
				end
			end
			
			--Turn off the visual adjacency FX
			for k,adjacentUnit in AdjacentUnitMemory do
				DestroyAdjacentEffects(self, v)
				adjacentUnit:RequestRefreshUI()
			end
			
			self:RequestRefreshUI()
		end
    end,
}




