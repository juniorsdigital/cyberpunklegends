# Phase 5.a — UI, Art & Audio (Extra Work Track)

## Goal
Cover the non-programming work required to make Legend Mode feel integrated: UI screens, minor set-dressing art, and audio cues. This phase is partially "out of scope" for a pure coding AI and is meant to produce specs/briefs a human artist or an image-generation tool can execute against, plus the CET UI code that renders them.

## AI Prompt
```
You are producing the UI/art/audio specification and CET UI implementation for the "Night City Legend" Cyberpunk 2077 mod.

Deliverables:
1. A CET Lua UI module `legend_ui.lua` implementing:
   - A "Legend Mode" hub menu (list of unlocked raids, cooldown timers, boss defeat counts) styled to match CP2077's existing Fixer/Gig contract UI conventions.
   - A boss health bar with phase-indicator segments (visually splitting HP bar into phase sections).
   - A cooldown timer HUD element for raids on cooldown.
2. An `ART_BRIEF.md` describing, for a human artist or AI image tool, the minor environment set-dressing needed to signal "raid mode" at each of the 4 raid sites (e.g., warning lights, barricades, loot beacon glow) — described precisely enough to hand to a concept artist.
3. A CET Lua/VFX module `static_bleed.lua` implementing the "Static Bleed" cosmetic cyberpsychosis effect (see docs/DIFFICULTY_SCALING.md): a sporadic screen-space overlay + ambient audio swap to a different existing map location's visuals/sound (desert, solar farm, cave), lasting a few seconds, with zero effect on player position or combat stats. Trigger frequency must scale with the player's active Overclock Strain stack count (Phase 4), and must never fire during boss phase transitions or active combat input windows.
4. An `AUDIO_BRIEF.md` describing needed audio: boss intro stinger, raid ambient loop per tier, victory/loot fanfare — noting where reusing existing CP2077 audio stems is acceptable vs. where new composition is needed.
5. Flag explicitly in `NOTES.md` which of these UI elements are blocked on native CP2077 UI limitations (e.g., level cap display beyond 60) requiring deeper CET patching per Phase 4's notes.

Output all code into `output/`, briefs into the phase root.
```

## Acceptance Criteria
- Hub menu renders and lists all 4 raids with live cooldown state pulled from LegendCore.
- Boss health bar correctly segments by phase count from BossEncounterController data.
- Static Bleed effect is purely cosmetic (verified: no position change, no stat change) and never fires during combat or boss transitions.
- Art/audio briefs are specific enough to hand to a non-technical artist without further clarification.
