# FE8U Modular Stat Getters

## Summary
Modular Stat Getters allows you to extend onto the existing stat getters by writing modifier routines either through ASM or *directly through EA*.

Supported Stats:
- HP (Max & Current), Power, Skill, Speed, Defense, Resistance, Luck
- Mov & Con (thanks to [Teq's Getters](http://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/38?u=stanh) (included))
- Aid
- Battle Stats (Attack, Defense, Hit, Avoid, Crit, Dodge, Lethality change) through integration with a Battle Calc Loop (ask your local wizard for more information).
- Anything really, since you can manually replace routines using the `rGetterWrapper` macro defined in `MSG/CoreDefinitions.event`.

**This also integrates well with [Circles' Skill System](http://feuniverse.us/t/fe8-skill-system-v1-0-110-skills-done-more-on-the-way/2312?u=stanh) by providing a simple Extention (see `MSG/Extentions/SkillSystem.event`)** (MSG is already included in the latest version of the Skill System)

## Quick Doc
Actually no, I'm lazy. Instead I'll open a thread on [FEU](http://feuniverse.us/) where I'll ask for stupid stat changing mechanics and post ways of implementing it with MSG, and hopefully it will provide example enough?

There is a doc out there, but there is a problem with, your honor. ***It is outdated.*** ~~I swear I'll put up an updated version :soon:~~

## Use it!
Take folder `MSG` and you probably want `StatGetters` aswell. Put those somewhere in your buildfile project, along with a file that should work the same way as `_Example.event` (that is: include `MSG/InstallCore.event`, `MSG/InstallHelpers.event` and the different stat getter definitions somewhere in free space).

**[For more information on how to use the buildfile method to build a GBAFE hack, check this guide.](https://tutorial.feuniverse.us)**
