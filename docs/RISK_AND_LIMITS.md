# Known Risks & Modding Limitations

## Technical Limits
- **No true instancing engine**: CP2077 wasn't built with dungeon-instance tech (unlike an MMO). "Raids" here are scripted re-population/reset events on existing open-world geography, not separate instanced copies — two players can't run the same raid simultaneously in different states (single-player only anyway, so this is fine).
- **AI behavior trees are data-driven but not fully exposed**: complex new boss "phases" may require reusing/remixing existing boss AI presets (e.g., from Adam Smasher, Sasquatch, Oda) rather than building entirely novel behavior trees from scratch.
- **Level cap extension has hard-coded UI elements** (XP bar, perk point caps) that may require additional CET UI patching beyond REDscript alone.
- **Cyberware capacity is tied to Cyberware Capacity stat** — incremental increases are feasible via stat modifiers, but full removal risks breaking the game's core build-tension design and may cause perk/attribute interactions to behave unpredictably at extreme values.

## Legal / Distribution
- Must comply with CDPR's mod policy: free distribution only, no resale, no monetized Patreon-gated releases, credit base assets appropriately.
- Do not redistribute ripped assets from other games; only reuse CP2077's own shipped assets via legitimate modding tools (WolvenKit) for personal/derivative mod use.

## Maintenance Risk
- CDPR/Phantom Liberty patches can break REDscript hooks; each phase should include a compatibility-check step against current game version before public release.

## Balance Risk
- Level cap / cyberware cap increases risk trivializing existing endgame builds; must be incremental and gated behind repeatable-but-non-trivial content to preserve challenge.
