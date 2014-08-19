function CanOvercharge(isPaused, econData)
    return econData["stored"]["ENERGY"] >= 2000 and not isPaused
end


EnterOverchargeMode = function()
    local econData = GetEconomyTotals()
    if not currentSelection[1] or currentSelection[1]:IsDead() then return end
    local bp = currentSelection[1]:GetBlueprint()
    local overchargeFound = false
    local overchargePaused = currentSelection[1]:IsOverchargePaused()
    for index, weapon in bp.Weapon do
        if weapon.OverChargeWeapon then
            overchargeFound = true
            break
        end
    end
    if overchargeFound and CanOvercharge(overchargePaused, econData) then
        ConExecute('StartCommandMode order RULEUCC_Overcharge')
    end
end

local OverChargeFrame = function(self, deltaTime)
    if deltaTime then
        if currentSelection[1]:IsDead() then return end
        local econData = GetEconomyTotals()
        local overchargePaused = currentSelection[1]:IsOverchargePaused()
        if CanOvercharge(overchargePaused, econData) then
            if self:IsDisabled() then
                LOG("Enabling overcharge button")
                self:Enable()
                local armyTable = GetArmiesTable()
                local facStr = import('/lua/factions.lua').Factions[armyTable.armiesTable[armyTable.focusArmy].faction + 1].SoundPrefix
                local sound = Sound({Bank = 'XGG', Cue = 'Computer_Computer_Basic_Orders_01173'})
                PlayVoice(sound)
            end
        else
            if not self:IsDisabled() then
                self:Disable()
            end
        end
    end
end

defaultOrdersTable['RULEUCC_Overcharge'] = {
    helpText = "overcharge",
    bitmapId = 'overcharge',
    preferredSlot = 7,
    behavior = StandardOrderBehavior,
    onframe = OverChargeFrame
}
