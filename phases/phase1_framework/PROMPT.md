# Phase 1.a — Core Framework

## Goal
Build the foundational REDscript/CET scaffolding that every later phase (raids, bosses, progression) will hook into. No raid or boss content yet — just the plumbing.

## AI Prompt (paste this to your coding assistant)
```
You are building the core framework for a Cyberpunk 2077 REDscript + CET mod called "Night City Legend."

Deliverables:
1. A REDscript module `LegendCore` that:
   - Detects main-story completion via existing quest fact checks (search for the game's ending-related quest facts, e.g. q001-related "MainQuestFinished" style facts) and sets a new custom quest fact `legend_mode_unlocked = true` once any ending completes.
   - Exposes a public static function `IsLegendModeUnlocked() -> Bool`.
   - Never writes to or overwrites any vanilla quest fact — only reads them.
2. A CET Lua module `legend_core.lua` that:
   - Registers a persistent Lua table (saved to a local JSON file, not the game save) to track custom mod state: raid cooldown timers, boss defeat counts, cyberware capacity shard count.
   - Exposes `LegendCore.GetState()` and `LegendCore.SetState(key, value)` functions other phases will call.
3. A new Fixer-style NPC contact stub (data-only, no dialogue yet) named "The Ripperdoc's Ledger" or similar, whose phone/call trigger only activates once `IsLegendModeUnlocked()` is true.
4. Write unit-style manual test steps (a markdown checklist) for verifying: (a) the flag only unlocks post-game, (b) the persistent state file survives a game restart, (c) no vanilla quest state is modified.

Output all code files into an `output/` folder alongside a short `NOTES.md` explaining any assumptions made about exact vanilla quest fact names (since these require live-game/WolvenKit verification).
```

## Acceptance Criteria
- Legend Mode flag correctly stays false during normal story playthrough.
- Persistent CET state file created and readable across game restarts.
- No modification to vanilla save-critical quest resources.
