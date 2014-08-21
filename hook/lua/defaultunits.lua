local AdjacencyTogglingUnit = Class(StructureUnit) {
    OnAdjacentTo = function(self, adjacentUnit, triggerUnit)
        if self:IsBeingBuilt() then return end
        if adjacentUnit:IsBeingBuilt() then return end
        if not self.AdjacentUnits then self.AdjacentUnits = {} end

        -- Clear all adjacency buffs from sorrounding structures
        self:RemoveAdjacencyBuffs()
        -- Add the new adjacent building and readd the buffs if we're producing mass
        table.insert(self.AdjacentUnits, adjacentUnit)


        -- Only readd adjacencies if consumption is active
        if self._productionActive then
            self:ApplyAdjacencyBuffs()
        end
    end,
    
    OnNotAdjacentTo = function(self, adjacentUnit)
        for k,u in self.AdjacentUnits do
            if u == adjacentUnit then
                table.remove(self.AdjacentUnits, k)
                adjacentUnit:RequestRefreshUI()
            end
        end
        self:RequestRefreshUI()
    end,

    ApplyAdjacencyBuffs = function(self)
        local adjBuffs = self:GetBlueprint().Adjacency
        if not adjBuffs or not self.AdjacentUnits then return end
        for key, adjacentUnit in self.AdjacentUnits do
            for k,v in AdjacencyBuffs[adjBuffs] do
                Buff.ApplyBuff(adjacentUnit, v, self)
                adjacentUnit:RequestRefreshUI()
            end
        end
        self:RequestRefreshUI()
    end,
    RemoveAdjacencyBuffs = function(self)
        local adjBuffs = self:GetBlueprint().Adjacency
        if not adjBuffs or not self.AdjacentUnits then return end
		
        for k, adjacentUnit in self.AdjacentUnits do
            for key, v in AdjacencyBuffs[adjBuffs] do
                if Buff.HasBuff(adjacentUnit, v) then
                    Buff.RemoveBuff(adjacentUnit, v, false, self)
                    adjacentUnit:RequestRefreshUI()
                end
            end
        end
    end
}


local oldMassFabricationUnit = MassFabricationUnit
MassFabricationUnit = Class(AdjacencyTogglingUnit, oldMassFabricationUnit) {
    OnConsumptionActive = function(self)
        oldMassFabricationUnit.OnConsumptionActive(self)
        self:ApplyAdjacencyBuffs()
        self._productionActive = true
    end,
    OnConsumptionInActive = function(self)
        oldMassFabricationUnit.OnConsumptionInActive(self)
        self:RemoveAdjacencyBuffs()
        self._productionActive = false
    end
}

local oldMassCollectionUnit = MassCollectionUnit
MassCollectionUnit = Class(AdjacencyTogglingUnit, oldMassCollectionUnit) {
    OnConsumptionActive = function(self)
        oldMassCollectionUnit.OnConsumptionActive(self)
        self:ApplyAdjacencyBuffs()
        self._productionActive = true
    end,

    OnConsumptionInActive = function(self)
        oldMassCollectionUnit.OnConsumptionInActive(self)
        self:RemoveAdjacencyBuffs()
        self._productionActive = false
    end
}
