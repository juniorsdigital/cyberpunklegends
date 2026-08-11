# Phase 1 — NOTES

## Assumptions (vanilla quest facts)

Ending detection in `LegendCore.reds` uses an **OR** across candidate facts. These names are **unverified assumptions** until confirmed with WolvenKit and/or a live CET dump on a post-ending save:

| Candidate fact   | Rationale                                      |
|------------------|------------------------------------------------|
| `q115_done`      | Nocturne Op55N1 (point-of-no-return hub)       |
| `q116_done`      | Devil / related ending path                    |
| `q201_done`      | Sun / Star / Temperance-family ending slots    |
| `q202_done`      | Alternate ending quest id (candidate)          |
| `q203_done`      | Alternate ending quest id (candidate)          |
| `q204_done`      | Alternate ending quest id (candidate)          |
| `epilogue_done`  | Generic epilogue completion name (candidate)   |
| `sq032_done`     | Chippin' In / Johnny path adjacency (weak)     |

**Custom facts written by this phase (only):**

- `legend_mode_unlocked` — set to `1` when any candidate is `> 0`
- `legend_ledger_intro_shown` — set to `1` after the one-shot Ledger notification

No vanilla facts are written. No `.quest` / `.questphase` archives are modified.

### How to verify

1. Load a **mid-story** save with CET + this mod.
2. Run `LegendCore.DumpEndingFacts()` or hotkey **Night City Legend: Dump Ending Facts**.
3. Confirm all candidates are `0` and `legend_mode_unlocked` is `0`.
4. Load a **post-ending** save (or finish any ending), dump again.
5. Note which candidate(s) flip to `> 0`. Update `EndingCandidateFacts()` in `LegendCore.reds` and `LegendCore.ENDING_CANDIDATE_FACTS` in `legend_core.lua` to the confirmed set; remove dead names.
6. Optional debug: `LegendCore.ForceUnlock()` sets **only** `legend_mode_unlocked` for plumbing tests without an ending save.

## CET persistent state

- Path: `bin/x64/plugins/cyber_engine_tweaks/mods/NightCityLegend/data/legend_state.json`
- Created on first CET `onInit` if missing.
- Survives game restarts; **not** stored in the CP2077 save file.
- Schema (v1): `version`, `raid_cooldowns`, `boss_defeat_counts`, `capacity_shard_count`, `ledger_intro_shown`
- API: `LegendCore.GetState()`, `LegendCore.SetState(key, value)`

## Fixer contact stub

“The Ripperdoc's Ledger” is **data-only** in Phase 1:

- REDscript metadata + `IsLedgerContactAvailable()` gated on `IsLegendModeUnlocked()`
- One-shot on-screen notification when unlock succeeds
- **Not** a real Journal/Phone contact yet (needs archive / Redmod / Phase 5 UI work)

## Install

Copy the contents of this `output/` folder into the Cyberpunk 2077 game root so that:

- `r6/scripts/NightCityLegend/*.reds` land under the game’s `r6/scripts/`
- `bin/x64/plugins/cyber_engine_tweaks/mods/NightCityLegend/` lands under CET’s `mods/`

Requires: REDscript runtime + Cyber Engine Tweaks.

## Save safety / uninstall

- Uninstall: delete the two trees above and optionally `data/legend_state.json`.
- Custom facts may remain in the save (`legend_mode_unlocked`, `legend_ledger_intro_shown`) but are inert without the mod.
- Vanilla quest progression is untouched.

## Known Phase 1 gaps

1. Exact ending fact names need live verification (see above).
2. No real phone contact / dialogue / contract board (Phases 2 and 5).
3. No raid/boss/loot logic (Phases 2–4).
4. On-screen notification styling may vary by game patch; treat as stub UX.
