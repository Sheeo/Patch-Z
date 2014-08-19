Patch-Z
=======

An ambitious patch for Supreme Commander: Forged Alliance.

Contributors:

 - Sheeo
 - ZockyZock
 - IceDreamer
 - RK4000
 - Guy
 - Eximius
 - AIx clan

Overcharge
----------

Minimum energy requirement for overcharge changed to 2.000 energy.

Rate of fire increased to once every two seconds.

Overcharge will spend as much energy as possible, up to 50% of the total
storage capacity available.

Damage and reload time is scaled with the amount of energy spent with a formula
roughly according to the following table:

Energy Storages | Energy Spent | Damage Dealt | Reload Time | DPS
----------------|--------------|--------------|-------------|------
 0              | 2k           | 248          | 2           | 124
 1              | 4.5k         | 407          | 2           | 203
 2              | 7k           | 664          | 2           | 332
 3              | 9.5k         | 1077         | 2           | 538
 4              | 12k          | 1.7k         | 2           | 864
 5              | 14.5k        | 2.7k         | 2           | 1363
 6              | 17k          | 4.1k         | 2           | 2099
 7              | 19.5k        | 6.2k         | 2           | 3121
 8              | 22k          | 8.8k         | 2.21        | 4k
 9              | 24.5k        | 11.8k        | 2.96        | 4k
 10             | 27k          | 15k          | 3.74        | 4k
 11             | 29.5k        | 17.7k        | 4.44        | 4k
 12             | 32k          | 20k          | 5.01        | 4k
 13             | 34.5k        | 21.7k        | 5.43        | 4k
 14             | 37k          | 22.9k        | 5.73        | 4k
 15             | 39.5k        | 23.7k        | 5.92        | 4k
 16             | 42k          | 24.2k        | 6.04        | 4k
 17             | 44.5k        | 24.5k        | 6.12        | 4k
 22             | 57k          | 25k          | 6.23        | 4k



Adding energy above 32k results in diminishing returns for damage, which
will never get higher than 25k.

Overcharging will never reach an effective DPS higher than 4k, because of the
delays.


TODO:
  - Cap dmg at 500 to commanders
  - Decide building damage reduction/cap


Economy
-------

Removed all adjacency from Storage - Mass Extractor relationship

... Lots more changes incoming.




Guy's wording
_______


A minimum of 2,000 stored energy is required to fire an overcharge.

Firing an overcharge will consume all of your stored energy, up to a maximum of half your total energy storage capacity.
For example, you might have 24,000 total energy storage capacity because you have built four energy storage structures (each providing 5,000 on top of the standard 4,000 from the ACU).
If you currently have 15,000 energy in your energy bar, firing an overcharge will use 12,000 of that, leaving 3,000 in the bank.
If you choose to fire again whilst you have just 3,000 left, all of this will be consumed because 3,000 is less than half of your 24,000 storage capacity.

The more energy you spend on firing an overcharge, the more damage it deals.
This means that you can choose to either fire overcharges more frequently whilst you have less energy stored and deal smaller amounts of damage each time, or wait and build up your energy to fire a high-damage shot.
