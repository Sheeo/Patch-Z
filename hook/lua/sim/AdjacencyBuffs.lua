-- Replace mass storage adjacency buffs with
-- buffs for only mass fabrication units
T1MassStorageAdjacencyBuffs = {
    'T1MassStorageMassProductionBonusMassFabrication',
}

BuffBlueprint {
    Name = 'T1MassStorageMassProductionBonusMassFabrication',
    DisplayName = 'T1MassStorageMassProductionBonus',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE MASSFABRICATION',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.MassProductionBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.125,
            Mult = 1.0,
        },
    },
}
