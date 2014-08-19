-- Removed size 4 Mass Storage adjacency with Mass Extractors
BuffBlueprint {
    Name = 'T1MassStorageMassProductionBonusSize4',
    DisplayName = 'T1MassStorageMassProductionBonus',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4 MASSFABRICATION',
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