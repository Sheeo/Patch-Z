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

Rate of fire increased to once every two seconds.


A minimum of 2,000 stored energy is required to fire an overcharge.

Firing an overcharge will consume all of your stored energy, up to a maximum of half your total energy storage capacity.
For example, you might have 24,000 total energy storage capacity because you have built four energy storage structures (each providing 5,000 on top of the standard 4,000 from the ACU).
If you currently have 15,000 energy in your energy bar, firing an overcharge will use 12,000 of that, leaving 3,000 in the bank.
If you choose to fire again whilst you have just 3,000 left, all of this will be consumed because 3,000 is less than half of your 24,000 storage capacity.

The more energy you spend on firing an overcharge, the more damage it deals.
This means that you can choose to either fire overcharges more frequently whilst you have less energy stored and deal smaller amounts of damage each time, or wait and build up your energy to fire a high-damage shot.

Overcharge is possible without any energy storage structures, but at this level of energy the damage output is low.
The scale of increasing damage to energy expended is non-uniform and there is a maximum possible damage of 25,000.
Damage output increases more than linearly when constructing each new energy storage structure, up to about 10 structures.
Beyond 10 the returns in terms of extra damage output begin to deminish, with no additional benefit beyond around 20.
See the following table for some sample figures:


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
 8              | 22k          | 8.8k         | 2.214648089 | 4k
 9              | 24.5k        | 11.8k        | 2.968880079 | 4k
 10             | 27k          | 15k          | 3.741797874 | 4k
 11             | 29.5k        | 17.7k        | 4.443434388 | 4k
 12             | 32k          | 20k          | 5.013649299 | 4k
 13             | 34.5k        | 21.7k        | 5.436822031 | 4k
 14             | 37k          | 22.9k        | 5.730170643 | 4k
 15             | 39.5k        | 23.7k        | 5.924040228 | 4k
 16             | 42k          | 24.2k        | 6.048153344 | 4k
 17             | 44.5k        | 24.5k        | 6.125998088 | 4k
 22             | 57k          | 25k          | 6.239632493 | 4k



Overcharging will never reach an effective DPS higher than 4k, because of the
delays.


TODO:
  - Cap dmg at 500 to commanders
  - Decide building damage reduction/cap


Economy
-------

Removed all adjacency from Storage - Mass Extractor relationship

... Lots more changes incoming.
