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

Firing an overcharge will consume all of your stored energy, up to a maximum of
half your total energy storage capacity.  For example, you might have 24,000
total energy storage capacity because you have built four energy storage
structures (each providing 5,000 on top of the standard 4,000 from the ACU).

If you currently have 15,000 energy in your energy bar, firing an overcharge
will use 12,000 of that, leaving 3,000 in the bank.

If you choose to fire again whilst you have just 3,000 left, all of this will
be consumed because 3,000 is less than half of your 24,000 storage capacity.

The more energy you spend on firing an overcharge, the more damage it deals.
This means that you can choose to either fire overcharges more frequently
whilst you have less energy stored and deal smaller amounts of damage each
time, or wait and build up your energy to fire a high-damage shot.

Overcharge is possible without any energy storage structures, but at this level
of energy the damage output is low.  The scale of increasing damage to energy
expended is non-uniform and there is a maximum possible damage of 25,000.
Damage output increases more than linearly when constructing each new energy
storage structure, up to about 10 structures.  Beyond 10 the returns in terms
of extra damage output begin to deminish, with no additional benefit beyond
around 20.  See the following table for some sample figures:


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



Overcharging will never reach an effective DPS higher than 4k, because of the
increase in reload time.


TODO:
  - Cap dmg at 500 to commanders
  - Decide building damage reduction/cap


Economy
-------

 - Mass Storage no longer provides mass production bonus to Mass Extractors.


Changes to come
===============

Bugfixes
--------

Changes in *italic* are -maybe- changes.

 - Atackmove for range units
   Currently, attackmove for units doesn't work in that units go too close before they start attacking

 - Atackmove from factory for engies
   Engies on attackmove from factory will have too high reclaim range

 - Check if it is possible to nerf manual reclaim/hack atackmove reclaim to be as efficient (no real bugfix)
   Make manual reclaim as efficient as attackmove

 - *Equalize tree groups & single trees reclaim time*

 - ACU dies if it gets loaded into a transport while turning

 - T3 massfab gives adjacency when turned off

 - Allow showing hotstats while watching replays


Smaller Changes
---------------

 - *Different shield overspill mechanism, if toggling shields to prevent it proves viable*

 - ACU TML Projectile HP reduction, AoE splash for Sera one
 - Factory rolloff time normalized for engineers
 - *Increase T2 factory upgrade cost by 5-20%*
 - Make T3 Arty a useful unit, if you only have one, check values, check if the reason it is useless is that it can’t break t2 shields, remove adjacency or rework it (add e cost for shots & pg lower it OR make pg lower rate of fire, e storage increase dmg i.e.)
 - *Repairing units cheaper*


UI Changes
----------

Hotbuild
--------

 - Mixed key for mass & energy storage 

 - Upgrade key takes engymod into account

 - Make ">", "<" and "|" keys bindable

 - Third bind on normal keys (qwerty) if no factory/builder is selected

 - Adjust the build factory hotkey for support factories (if there is no HQ, W will build HQ, otherwise most advanced support fac, add a new key for HQ only)

 - Fix idle airscout key (implement done solution)
 - Adjustable selection priority for selen, mobile shields & stealth, scouts, maybe AA. Either with new fire state, hold fire one, on assisting, or other.
 - Fix zooming height when double pressing control groups
 - Fix insta-zoom key not working while shift is pressed
 - Minimap on top of other UI elements
 - Complete new, cool, smaller UI
 - Grid where it is possible to build/drop ( incircle of X distance around mouse pointer)
 - *Automatic massfab throttling*
 - Minimap improvement with camera angle, map preview instead of cartographic view option, options to not display units/buildings etc.
 - Improved spread-attack, *introduce it for overcharge*
 - Fix the chain-upgrade problem of not updating UI symbols/apply it to the upgrade key too
 - Allow cyb t3 engys to build ed5 shields (need to copy the hack from engymod to have increased buildtime & cost for those)
 - Add ed2 -> ed5 shield button/key
 - Improve hotstats (zooming/set shown times, maybe more stats, maybe remove some useless stats or improve UI)
 - Improve transport loading process for big armies
 - Add some order to load units in transports from factory, without unloading them after
 - Maybe not include, but make anyway: sniping mod, that calculates how many of your selected units you need to kill the target in one pass (if all hit)
 - Along with new UI, show more infos for observer (meaningful mass income from all players i.e.)
 - Include first person view
 - Improve and include netlag adjustment
 - Include minimap fix


T3 Land & EXP
-------------
 - Percival, Brick
   Range 26 (starting value), speed 2.4
   DPS adjustment
 - Harbinger/Othuum
   -25% dps (starting value)
 - Titan, Loyalist
   No change, but should be more useful with nerf of 'main' t3 land
 - T4 buildtimes multiplied by 3 (starting value)
   If exps need a buff, buff supportive stats so using them in combination with t3 land is stronger



ECO
---

 - Factories add 100 mass storage, *1k energy storage*
 - Check if total mass output with full t3 eco is still enough to play the game, if not increase t3 mex output & cost
 - Check if the risk for going from full t2 mex to first t3 mex is too big, if yes decrease t3 mex cost 
 - Check if total mass output is still too much to make mapcontrol relevant, if yes decrease t3 mex output even further (12 maybe lowest possible value)
 - Rework t2 & t3 massfab efficiency (& maybe adjacency)
 - Nerf ACU RAS, check SCU RAS
 - Check if costs for very expensive things (gameender, nukes, t3 arty, EXPs) are not too high with the lower eco


AIR
---


 - Add/increase rolloff time for air / delay before production 
 - Nerf speed for t3 planes as much as possible, ASF speed 18 as start, scout 22
 - increase beam range on transports for easier loading 

Bomber:
Vertical drop, and solve all dropping problems that might come with it, maybe check vanilla supcom for reference.
Reduce cost and dmg (cost more than dmg), possibly reduce cost by 50% as start and 2/3 dmg. Consider changing the energy/mass/bt ratio if it seems useful.
Make them killable by (enough emouts of) flak BEFORE they drop a bomb due to hitbox/speed/flying height changes. Include shields in the calculation about how many bombers you’d need, and how much flak is appropriate for that. Juggle with the values so they don’t become too bad/too good vs mobile flak either (current power is about ok, hard to say how it will turn out with the eco changes though, will need a lot testing) If needed can adjust mobile flak slightly too (projectile speed, splash, speed..), but not too much to keep them as good vs gunships as now.
Check T4 bomber too
Change stationary flak values as much as needed, if changing bomber values is not enough 
Decrease stat. Flak range as much as possible, and make them as expensive as possible, while still being able to count the bombers before they drop. Scenario is to have flak around a nuke i.e. , not much forwarded flak that you’d need in all 4 direction (as that would need the flak to be 4 times cheaper, and thus getting OP in any other case) Consider at range nerf that they must still counter gunships aswell. Maybe range back to 44 for all of them as start. 
Similar for SAM, nerf range (44 as start), increase cost. Remove redundant AOE. Make them as expensive as possible, use t1/t2 AA turrents in relation to early game income as reference. 



MAYBE: 
Give ASF/Int two roles, one countering the other, the other countering all other planes. Really complicated, but would be great if possible. 
Role 1: Interceptor, speed high enough to catch all other planes (bomber gunships transports, scouts), losing bad to ASF
Role 2: ASF, slightly slower than the other planes, so not useful to intercept them reliably, but beating ASF mass for mass 
Question is: Will T1 or T3 plane be the ASF
If t1, it needs to still be decent against t1 bomber and t2 bomber & gunships, undermining it’s role 
If t3, the t1 plane will be able to catch t2 transports & t3 bomber, making it less attractive to go t3 
Both are not terrible, and should work, but its not optimal. T1 is kinda the current solution, except that you make Ints beat ASF. Would probably lead to giant inti-clusters aswell. 
In any case, speed of ASF would need to be slightly lower than as much as possible other planes, while Intie needs to be as slow as possible, while still being able to catch all others, to ensure the gap between ASF and intie is as low as possible. 
adjust swift winds and speed of all other planes accordingly  to that
can give Restorer role as very slow, but more powerfull ASF or “mobile SAM” or fancy name “AA-Gunship”
Restorer 18 air-to-ground dps
