# Phase 2.a — Raid Locations & Repopulation System

## Goal
Turn existing story locations (Arasaka Industrial Park warehouse, Arasaka Tower interior slice, Rennox/Biotechnica solar farms, Badlands caves) into repeatable raid sites with scaling enemy repopulation.

## AI Prompt
```
You are extending the "Night City Legend" Cyberpunk 2077 mod (built on REDscript + CET, using the LegendCore framework from Phase 1).

Deliverables:
1. A REDscript module `RaidManager` that:
   - Defines a `RaidDefinition` struct: raid ID, display name, map location reference (world position/area trigger), tier (Street/Corpo/Legend), cooldown duration (in-game hours), and associated enemy squad template ID.
   - Implements `EnterRaid(raidId: String)` that: checks cooldown via LegendCore state, triggers enemy squad spawn at the raid's location using existing NPC spawn/encounter system patterns, and starts the cooldown timer on entry.
   - Implements `IsRaidOnCooldown(raidId: String) -> Bool` and `GetRaidCooldownRemaining(raidId: String) -> Float`.
2. Four initial `RaidDefinition` entries as data (JSON or REDscript const array), one each for: Arasaka Industrial Park warehouse, Arasaka Tower interior slice, a Rennox/Biotechnica solar farm exterior, and a Badlands cave network near the Aldecaldos camp.
3. An enemy squad scaling function `ScaleSquadForTier(baseSquad, tier)` that applies the HP/damage multipliers defined in docs/DIFFICULTY_SCALING.md (Street 1.0x/1.0x, Corpo 1.6x/1.4x, Legend 2.2x/1.8x).
4. A CET debug command `/legend_raid_enter <raidId>` for testing raid entry without needing to physically travel in-game.

Output all code into `output/`, plus a `LOCATIONS.md` documenting exact in-game coordinates/area names used for each raid site (flag any that require live verification via WolvenKit map data).
```

## Acceptance Criteria
- All 4 raid sites can be entered via debug command and spawn scaled enemy squads.
- Cooldown correctly blocks re-entry until timer expires.
- Squad stats visibly differ across the 3 tiers when tested.
