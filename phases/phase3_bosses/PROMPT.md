# Phase 3.a — Boss Encounters (incl. Adam Smasher Rematch)

## Goal
Add 3-5 named boss encounters gated behind raid tiers, including a flagship Adam Smasher rematch, each with distinct mechanics and drop tables.

## AI Prompt
```
You are extending the "Night City Legend" Cyberpunk 2077 mod. RaidManager (Phase 2) and LegendCore (Phase 1) already exist.

Deliverables:
1. A REDscript module `BossEncounterController` that:
   - Defines a `BossDefinition` struct: boss ID, display name, base NPC template to extend (reuse existing game NPC classes/models where possible, e.g. reuse Adam Smasher's existing combat template for the rematch), phase count, phase-transition HP thresholds, and linked RaidDefinition ID.
   - Implements phase-transition logic: at each HP threshold, trigger a stat/ability change (e.g., new attack pattern, temporary invulnerability window, adds spawning in).
   - Implements `OnBossDefeated(bossId)` that increments a defeat counter in LegendCore state and calls the loot resolver (Phase 4 dependency — stub the call for now).
2. 3-5 `BossDefinition` entries:
   - "Adam Smasher — Second Verse" (flagship, gated to Legend-tier Arasaka Tower raid, 3 phases).
   - 2-4 additional original named bosses of your design (corpo security chief, cyberpsycho warlord, rogue AI construct, etc.) distributed across the other raid sites.
3. A short design doc per boss (`BOSS_DESIGNS.md`) describing mechanics, phase behavior, and thematic justification for why they appear in that location post-game.
4. Flag clearly in `NOTES.md` any boss AI behaviors that likely require reusing/remixing existing base-game AI presets rather than fully custom trees (per docs/RISK_AND_LIMITS.md).

Output all code into `output/`.
```

## Acceptance Criteria
- Each boss has at least 2 distinct combat phases with observable mechanic changes.
- Adam Smasher rematch is clearly the hardest, gated behind Legend-tier raid only.
- Defeat correctly increments counters for later loot/progression hooks.
