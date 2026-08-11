# Phase 4.a — Loot Tables, Cyberware Cap & Level Cap Progression

## Goal
Wire boss defeats into loot drops, incremental cyberware-capacity increases, and an extended level cap with rebalanced XP/perk curve.

## AI Prompt
```
You are extending the "Night City Legend" Cyberpunk 2077 mod. LegendCore, RaidManager, and BossEncounterController already exist.

Deliverables:
1. A REDscript module `LootResolver` that:
   - Defines weighted drop tables per boss ID (Epic/Legendary/Iconic+ tiers), consistent with docs/DIFFICULTY_SCALING.md loot rarity floors per raid tier.
   - Implements `ResolveBossLoot(bossId) -> Array<ItemID>` called from BossEncounterController.OnBossDefeated.
   - Includes a new item category "Capacity Shard" (boss-exclusive, non-sellable) that, when consumed via a new crafting-bench-style interaction, grants +1 Cyberware Capacity via a stat modifier, capped at a configurable max bonus (default +8, see DIFFICULTY_SCALING.md).
   - Includes a second new item category "Slot Override Shard" (unique, non-repeatable — tied to a boss's FIRST kill only, not the repeatable loot pool) that grants +1 bonus equip slot in a single specified cyberware category (e.g., a second Frontal Cortex slot), capped at +1 per category and 2-3 categories total per character. This is the "Edgerunner Overclock" mechanic — inspired by David Martinez stacking multiple cyberware pieces in Cyberpunk: Edgerunners.
   - Optionally implement an "Overclock Strain" stacking debuff (small max-HP or stat penalty) applied per active bonus slot, to preserve build-balance tension.
2. A REDscript module `LevelCapExtension` that:
   - Raises level cap from vanilla 60 to a configurable value (default 70).
   - Implements a new XP curve for levels 61-70 that scales non-linearly steeper than vanilla (per docs/DIFFICULTY_SCALING.md).
   - Awards 1 perk point every 2 levels past 60 instead of every level, to slow power creep.
3. A CET Lua debug UI panel showing: current cyberware capacity bonus, boss defeat counts, and current level cap status — for testing/QA purposes.
4. `PROGRESSION_NOTES.md` documenting exact stat modifier IDs/hooks used and any UI elements (XP bar, perk screen) likely needing further CET patching to correctly display the extended cap (flag for Phase 5 UI work).

Output all code into `output/`.
```

## Acceptance Criteria
- Boss defeats produce loot matching defined tables and rarity floors.
- Capacity Shards correctly increment cyberware capacity up to the configured cap.
- Level cap extension allows leveling past 60 with correctly slowed perk point gain.
