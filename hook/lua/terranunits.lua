local oldTAirFactoryUnit = TAirFactoryUnit
TAirFactoryUnit = Class(oldTAirFactoryUnit) {

    FinishBuildThread = function(self, unitBeingBuilt, order )
        self:SetBusy(true)
        self:SetBlockCommandQueue(true)
        local bp = self:GetBlueprint()
        local bpAnim = bp.Display.AnimationFinishBuildLand
        if bpAnim and EntityCategoryContains(categories.LAND, unitBeingBuilt) then
			if EntityCategoryContains(categories.TECH3, self) then
				self.RollOffAnim = CreateAnimator(self):PlayAnim(bpAnim):SetRate(5) --Increase the Rate further for T3			
			else
				self.RollOffAnim = CreateAnimator(self):PlayAnim(bpAnim):SetRate(3) --Increase the Rate
			end
            self.Trash:Add(self.RollOffAnim)
            WaitTicks(1)
            WaitFor(self.RollOffAnim)
        end
        if unitBeingBuilt and not unitBeingBuilt:IsDead() then
            unitBeingBuilt:DetachFrom(true)
        end
        self:DetachAll(bp.Display.BuildAttachBone or 0)
        self:DestroyBuildRotator()
        if order != 'Upgrade' then
            ChangeState(self, self.RollingOffState)
        else
            self:SetBusy(false)
            self:SetBlockCommandQueue(false)
        end
    end,

    PlayFxRollOffEnd = function(self)
        if self.RollOffAnim then        
			if EntityCategoryContains(categories.TECH3, self) then
				self.RollOffAnim:SetRate(-5) --Increase the Rate further for T3			
			else
				self.RollOffAnim:SetRate(-3) --Increase the Rate
			end		
            WaitFor(self.RollOffAnim)
            self.RollOffAnim:Destroy()
            self.RollOffAnim = nil
        end
    end,	
	
    RolloffBody = function(self)
        self:SetBusy(true)
        self:SetBlockCommandQueue(true)
        self:PlayFxRollOff()
        # Wait until unit has left the factory
		if not EntityCategoryContains(categories.TECH3, self) then
			while not self.UnitBeingBuilt:IsDead() and self.MoveCommand and not IsCommandDone(self.MoveCommand) do
				WaitSeconds(0.1)				--Decrease the check interval (0.5)
			end
		else 
			WaitSeconds(1.6)					--Force the platform up early. Introduce temporary speed boost for Engie.
		end
        self.MoveCommand = nil
        self:PlayFxRollOffEnd()
        self:SetBusy(false)
        self:SetBlockCommandQueue(false)
        ChangeState(self, self.IdleState)
    end,	
}