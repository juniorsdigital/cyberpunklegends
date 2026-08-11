# Night City Legend — Post-Game Repeatable Content Mod
### For Cyberpunk 2077 (REDscript + Cyber Engine Tweaks / CET)

## Problem Statement
After finishing the main story and side content, Cyberpunk 2077 has no meaningful repeatable endgame. NCPD scanner hustles don't respawn, there are no boss fights, and there's nothing to "cement your legend" once the story ends.

## Solution Summary
Add a repeatable, scaling endgame system built on:
1. **Raids** — instanced, replayable high-difficulty encounters set in existing story locations (Arasaka Tower, Arasaka Industrial Park warehouse, Rennox/Biotechnica solar farms, Badlands caves).
2. **Bosses** — unique named enemies (e.g., a rematch-style Adam Smasher encounter) with real mechanics, drop tables, and scaling difficulty tiers.
3. **Loot & Progression Loop** — boss-exclusive drops that incrementally lift the cyberware capacity cap and raise the level cap, enabling deeper cross-spec builds.
4. **Repeat Structure** — cooldown/reset system so raids and bosses can be farmed like a live-service loop, without breaking main story state.

This repo is organized as a **prompt-driven build plan**: every phase folder contains a `PROMPT.md` that can be handed directly to an AI coding assistant (or used as a human dev brief) to execute that phase in isolation.

## Repo Structure
```
cyberpunklegends/
├── README.md                  <- this file
├── docs/
│   ├── SCOPE.md               <- full / slight-out-of-scope / extra-work breakdown
│   ├── TECH_STACK.md          <- REDscript + CET architecture notes
│   ├── RISK_AND_LIMITS.md     <- known modding limitations, legal/EULA notes
│   └── DIFFICULTY_SCALING.md  <- scaling math for enemies/loot/level cap
└── phases/
    ├── phase1_framework/PROMPT.md
    ├── phase2_raids/PROMPT.md
    ├── phase3_bosses/PROMPT.md
    ├── phase4_progression/PROMPT.md
    ├── phase5_assets_ui/PROMPT.md
    └── phase6_qa_balance/PROMPT.md
```

## How to Use This Repo
1. Read `docs/SCOPE.md` first to understand what's in-scope, slightly-out-of-scope, and what needs non-code work (art/3D/UI).
2. Work phases in order — each phase's `PROMPT.md` is self-contained and can be pasted into an AI assistant (Cursor, GitHub Copilot Chat, Claude, etc.) or given to a human contributor.
3. Each phase produces its own deliverables (scripts, JSON configs, docs) inside that phase folder — commit those outputs back into the folder as `output/`.
4. Phase 6 (QA/Balance) should be re-run after every content addition (new raid, new boss).

## Disclaimer
CD Projekt Red's EULA permits non-commercial mods for personal use distributed for free; this mod must never be sold, must not include ripped/pirated third-party assets, and should credit CDPR IP appropriately. Always test on a backup save.
