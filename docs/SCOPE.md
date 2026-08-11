# Scope Breakdown

## Full Scope (core deliverable — code-buildable via REDscript/CET)

### 1. Post-Game Trigger & Hub
- Detect main-job completion (any ending) via quest fact flags.
- Unlock a "Legend Mode" fixer contact (new NPC or repurposed Wakako/Regina call) that offers raid/boss contracts.
- Persistent save-safe flag system so Legend Mode content doesn't touch main story quest states.

### 2. Raid System
- Instance/reset logic for reusing existing map locations (Arasaka Industrial Park warehouse, Arasaka Tower interior slices, Rennox/Biotechnica solar farms, Badlands caves near Aldecaldos camp).
- Enemy repopulation script: re-spawns NCPD/Arasaka/Maelstrom-tier squads with scaling stat blocks on raid entry.
- Cooldown/reset timer (real-time or in-game-days based) so raids are repeatable, not one-time.
- Loot table hooks tied to raid completion (see Progression doc).

### 3. Boss Encounters
- 3-5 unique named bosses with custom stat blocks, ability sets, and phase-based mechanics (not just palette-swapped enemies).
- One signature "Adam Smasher rematch" encounter as the flagship fight, gated behind the hardest raid tier.
- Boss AI behavior trees using existing CP2077 AI framework nodes where possible (extend, don't rebuild from scratch).
- Scripted intro/outro barks and unique death animations reused from base game where licensing/asset access allows.

### 4. Loot & Drop Tables
- Rarity tiers (Epic/Legendary/Boss-exclusive "Iconic+") with weighted drop tables per boss.
- Boss-exclusive crafting materials/components that feed into the cyberware-cap and level-cap unlock system.

### 5. Difficulty Scaling
- Tiered raid difficulty (Street / Corpo / Legend) with enemy level, HP, and damage multipliers.
- Player-level-aware scaling so raids stay relevant at level 50+ and beyond any modded cap increase.

## Slightly Out of Scope (flagged by user as extended ambition — still documented, lower priority)

### A. Cyberware Capacity Expansion (Incremental Points + Bonus Slot Types)
- Boss-exclusive drops that raise cyberware capacity by fixed increments (not full removal — full removal breaks build balance).
- **Bonus slot system ("Edgerunner Overclock" mechanic, inspired by David Martinez in Cyberpunk: Edgerunners)**: rather than just more capacity points, boss-exclusive Legendary/Iconic+ drops can unlock an *additional equip slot in a cyberware category the player already has filled* (e.g., a second Frontal Cortex or second Circulatory System slot), letting a single build run multiple cyberware pieces of the same type simultaneously — mirroring how David stacked multiple cyberware types beyond safe limits.
- This should be rare, boss-locked, and capped (e.g., max +1 bonus slot per category, +2-3 categories total) so it stays an aspirational "legend-tier" reward rather than a default respec option.
- Narrative framing: these items are lore-flavored as unstable, Arasaka/Militech black-market cyberware overrides — thematically tying into Edgerunners' "your body isn't meant to hold this much chrome" tension, and should carry a diegetic risk/cost (see Balance note below).
- Requires: new item category ("Slot Override Shard") + capacity-modifier hook + a slot-count modifier hook into the existing cyberware limit/slot system (two separate stat/system hooks, not one).

### B. Level Cap Increase
- Extending level cap beyond 50/60 requires new XP curve tables and perk point rebalancing.
- Risk: existing perk trees were balanced for capped totals; raising cap needs new perk points or diminishing-return tuning to avoid trivializing content.

### C. Cross-Speccing at Higher Power
- Reworking attribute point costs at higher levels so multi-tree "hybrid" builds (e.g., full Netrunner + full Solo) become viable without being mandatory.

## Extra Work Needed (non-programming — art, modeling, UI, audio)

| Category | Work Needed | Notes |
|---|---|---|
| 3D/Character Art | New boss silhouettes/armor variants if not reusing base-game assets | Can reuse Adam Smasher's existing model/rig for the rematch to reduce scope |
| Environment Art | Minor set-dressing changes to signal "raid mode" (barricades, warning lights, loot beacons) | Reuses existing map geometry — no new levels needed |
| UI/UX | New Legend Mode hub menu, raid selection screen, boss health bar/phase indicators, cooldown timers | Must match CP2077's Fixer/Gig UI style |
| Audio | New boss intro stingers, raid ambient loops, victory/loot fanfare | Can reuse base game stems where narratively appropriate |
| VFX | Boss phase-transition effects, loot beacon glow, raid entry portal/transition | Moderate effort — CET supports particle system hooks |
| VFX | "Static Bleed" cosmetic cyberpsychosis screen-swap effect (view/audio only, no position/stat change) triggered by max chrome stacking | Screen-space overlay + ambient audio bus swap; moderate effort |
| Localization | English-only for v1; other languages optional later | Out of scope for v1 |
| Voice/Barks | New boss taunt lines (optional) — can ship without voice using text-only barks | Cut for MVP if budget-constrained |
