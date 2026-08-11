# Phase 1 — Manual Test Checklist

Prerequisites: Cyberpunk 2077 with **REDscript** + **CET**, Phase 1 files installed from this `output/` tree. Use a **backup save**. Prefer one mid-story save and one post-ending save.

## (a) Legend Mode stays false during normal story

- [ ] Load a mid-story save (main job not finished; before / outside ending).
- [ ] Open CET console; run `LegendCore.DumpEndingFacts()`.
- [ ] Confirm ending candidates are `0` (or only unrelated noise) and `legend_mode_unlocked = 0`.
- [ ] Run `LegendCore.PrintStatus()` / hotkey **Night City Legend: Status**.
- [ ] Confirm unlock fact reports false.
- [ ] Confirm no “Ripperdoc's Ledger” availability notification fires on load.

## (b) Unlocks post-game (or via debug force)

**Path B1 — real ending save**

- [ ] Load a save after any main ending / returned open-world post-credits state.
- [ ] Run `LegendCore.DumpEndingFacts()`; note which candidates are `> 0`.
- [ ] Confirm `legend_mode_unlocked` becomes `1` after attach / refresh.
- [ ] Confirm one-shot notification: contact **The Ripperdoc's Ledger** is online.
- [ ] Reload the same save; confirm notification does **not** spam (`legend_ledger_intro_shown`).

**Path B2 — debug without ending**

- [ ] On a mid-story save, run `LegendCore.ForceUnlock()` or hotkey **Force Unlock**.
- [ ] Confirm only `legend_mode_unlocked` changes (dump facts again; vanilla candidates unchanged).
- [ ] Confirm Ledger gate would now pass (`IsLegendModeUnlocked` / status true).

## (c) Persistent CET state survives restart

- [ ] In CET console: `LegendCore.SetState("capacity_shard_count", 3)`.
- [ ] Optionally: `LegendCore.SetState("raid_cooldowns", { test_raid = 12345 })`.
- [ ] Run `LegendCore.PrintStatus()`; confirm values.
- [ ] Confirm `data/legend_state.json` exists under the CET mod folder and contains those keys.
- [ ] Fully quit the game (not just reload save).
- [ ] Relaunch, load any save, run `LegendCore.PrintStatus()` / `GetState()`.
- [ ] Confirm `capacity_shard_count` (and test cooldown) persisted across restart.

## (d) No vanilla quest state modified

- [ ] Before enabling the mod (or on a clean copy), note a few vanilla facts via CET (`GetFactStr` on active quest ids you care about).
- [ ] Play / load with the mod; use Force Unlock if needed.
- [ ] Re-check those vanilla facts — values must be unchanged.
- [ ] Confirm the only new facts set by the mod are `legend_mode_unlocked` and (after notify) `legend_ledger_intro_shown`.
- [ ] Uninstall mod scripts; load save — main story quests still progress normally (custom facts inert).

## Acceptance criteria mapping

| Criterion                                      | Checklist section |
|------------------------------------------------|-------------------|
| Legend Mode false during story                 | (a)               |
| Persistent CET state across restarts           | (c)               |
| No modification to vanilla save-critical quests| (d)               |
| Post-game / gated Ledger stub                  | (b)               |
