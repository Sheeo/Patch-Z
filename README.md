Patch-Z
=======

An ambitious patch for Supreme Commander: Forged Alliance.



Major Changes:

 - Overcharge feature for ACU's changed as follows:

   Minimum energy requirement for overcharge is 2.000 energy

   Overcharge will spend as much energy as possible, up to 50% of the total storage capacity available.

   Damage is scaled with the amount of energy spent with a formula roughly
   according to the following table:
   
    Energy Spent | Damage Dealt
    -------------|-------------
    2k           | 248
    4.5k         | 407
    7k           | 664
    9.5k         | 1077
    12k          | 1.7k
    14.5k        | 2.7k
    17k          | 4.1k
    19.5k        | 6.2k
    22k          | 8.8k
    24.5k        | 11.8k
    27k          | 15k
    29.5k        | 17.7k
    32k          | 20k
    34.5k        | 21.7k
    37k          | 22.9k
    39.5k        | 23.7k
    42k          | 24.2k
    44.5k        | 24.5k
    57k          | 25k

    Adding energy above 32k results in diminishing returns for damage, which
    will never get higher than 25k.


    TODO:
      - Cap dmg at 500 to commanders
      - Decide building damage reduction/cap



... Lots more changes incoming.
