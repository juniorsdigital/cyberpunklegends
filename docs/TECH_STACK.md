# Technical Stack & Architecture

## Core Tools
- **REDscript** — primary scripting language for gameplay logic (quest facts, entity spawning, item defs, stat hooks). Compiles against game's native class hierarchy (redscript compiler by jac3km4).
- **Cyber Engine Tweaks (CET)** — Lua-based runtime hooking layer for UI overlays, hotkeys, debug consoles, and anything REDscript can't reach directly (native function calls, live inspection).
- **WolvenKit** — for unpacking/inspecting base game archives (.archive) to identify reusable meshes, quest phases, and NPC templates for raid locations and boss models.
- **Redmod (CDPR CLI tool)** — for packaging quest-like content (new NPCs, scenes) if REDscript alone is insufficient for scene-based boss intros.

## Architecture Overview
```
[Legend Mode Fixer NPC] --dialogue--> [Contract Board (CET UI)]
        |
        v
[Raid Instance Manager (REDscript)] -- spawns --> [Scaled Enemy Squads]
        |                                              |
        v                                              v
[Boss Encounter Controller] <---------------- [Difficulty Scaler]
        |
        v
[Loot Table Resolver] --> [Inventory/Item System] --> [Cyberware Cap Modifier]
                                                       [Level Cap / XP Curve Extension]
```

## Key Hook Points in Base Game
- `gameuiPopupsManager` / `QuestTrackerGameController` — for contract/quest board UI injection.
- `ScriptedPuppet` / `NPCPuppet` — base classes to extend for boss AI and custom stat blocks.
- `StatsSystem` and `StatModifierGroup` — for scaling enemy stats per raid tier and applying cyberware-cap increments.
- `LootManager` / `lootStruct` tables — for defining boss-exclusive drop tables.
- Quest fact system (`GetFact` / `SetFact` via `QuestsSystem`) — for tracking main-story completion and raid cooldown states without touching original quest resources.

## Save Compatibility Principle
All new state must live in **new custom quest facts and CET persistent Lua tables** — never overwrite or hook into vanilla quest phase resources directly, to minimize save-corruption risk and preserve uninstall safety.
