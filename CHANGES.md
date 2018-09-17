Changes from MSG2 to MG3:

- Name change from Modular Stat Getters to simply Modular Getters
- Routine pointers are no longer thumb by default. You need to manually set the thumb bit! (Or, even better, use lyn!)
- Filename reorganization: InstallCore -> Core.event & StatGetters.event
- LOCATIONS OF MOV & CON GETTERS HAVE CHANGED! From 019224 and 019284 to 019228 and 0191E8 respectively (see MSG/StatGetters.event)
  - This makes MG3 currently incompatible with current Skill System/MSS, because of it (MSS) having those locations hardcoded
