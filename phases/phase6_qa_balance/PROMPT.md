# Phase 6.a — QA, Balance Pass & Compatibility Check

## Goal
Validate the full stack (Phases 1-5) works together, catch balance issues from cap increases, and check compatibility against the current game patch version.

## AI Prompt
```
You are running QA and balance validation for the completed "Night City Legend" Cyberpunk 2077 mod (Phases 1-5 already built).

Deliverables:
1. A `QA_CHECKLIST.md` covering: raid entry/exit/cooldown correctness, boss phase transitions firing correctly, loot table drop rates matching design intent over N simulated encounters, cyberware capacity cap not exceeding configured max, level cap XP curve producing intended pacing (estimate hours-to-level for 60-70 range).
2. A balance report `BALANCE_REPORT.md` analyzing: does the +8 cyberware capacity bonus combined with level 70 perk points make builds trivially powerful against Legend-tier raids? Recommend specific numeric adjustments if simulated/estimated results suggest imbalance.
3. A `COMPATIBILITY.md` noting current game version tested against, known REDscript/CET API version dependencies, and a re-test procedure to run after future CDPR patches.
4. A consolidated `KNOWN_ISSUES.md` aggregating any NOTES.md flags raised in Phases 1-5 (unverified quest fact names, AI behavior reuse limitations, UI patching gaps) into one prioritized backlog.

Output all files into `output/`.
```

## Acceptance Criteria
- Checklist covers all prior phases' acceptance criteria in one consolidated pass.
- Balance report gives concrete numeric recommendations, not vague statements.
- Known issues backlog is prioritized (blocker / major / minor).
