# Difficulty & Loot Scaling Model

## Raid Tiers
| Tier | Recommended Player Level | Enemy Level Multiplier | HP Multiplier | Damage Multiplier | Loot Rarity Floor |
|---|---|---|---|---|---|
| Street | 30-40 | 1.0x | 1.0x | 1.0x | Rare |
| Corpo | 40-50 | 1.3x | 1.6x | 1.4x | Epic |
| Legend | 50+ | 1.6x | 2.2x | 1.8x | Legendary / Iconic+ |

## Boss Scaling Formula (proposed)
For a boss encounter at tier T with player level L:

\( \text{BossHP} = \text{BaseHP} \times (1 + 0.08 \times \max(0, L - 50)) \times \text{TierMultiplier}(T) \)

\( \text{BossDamage} = \text{BaseDamage} \times (1 + 0.05 \times \max(0, L - 50)) \times \text{TierMultiplier}(T) \)

This keeps early raids (level 30-50) untouched by the scaling term, and only ramps difficulty for characters that push past the current vanilla soft cap — directly supporting the "cross-spec at higher power" goal without punishing normal-level players.

## Cyberware Capacity Unlock Curve (incremental, not full removal)
- Each unique boss-exclusive "Capacity Shard" drop grants +1 Cyberware Capacity point, stacking additively.
- Recommend hard-capping total bonus at +8 to +10 above vanilla max to preserve build tension while allowing deeper cross-speccing.

## Bonus Slot System ("Edgerunner Overclock")
- Separate from raw capacity points: rare boss-exclusive "Slot Override Shard" drops (Legend-tier raids only) grant one additional equip slot in a single cyberware category (e.g., a second Frontal Cortex slot), letting a build run two pieces of the same cyberware type at once.
- Cap: max +1 bonus slot per category, max 2-3 categories total per character — this is a legend-tier flex build option, not a universal respec tool.
- Recommend gating each Slot Override Shard behind a *unique, non-repeatable* boss first-kill (not the repeatable farm loot pool) so bonus slots stay a badge of "legend" status rather than something farmed to trivialize builds.
- Optional flavor mechanic: each active bonus slot could apply a small stacking "Overclock Strain" debuff (e.g., -2% max HP or a Humanity/cyberpsychosis-adjacent stat cost per active bonus slot) to preserve risk/reward tension, echoing Edgerunners' theme that stacking too much chrome has a cost.

## "Static Bleed" — Cosmetic Cyberpsychosis Effect
- A sporadic, purely cosmetic debuff that triggers only once a player is at or near maxed-out cyberware capacity/bonus slots (i.e., a byproduct of the Overclock Strain stacking above a threshold).
- Effect: briefly swaps the player's camera/screen view to a different ambient location already present on the map (e.g., Badlands desert, a solar farm, a cave interior) for a few seconds, then snaps back — the player's actual in-world position never changes, only what they see/hear.
- Purely visual/audio (screen-space overlay + swapped ambient audio bus), not a debuff to combat stats — no fairness or difficulty implications, no location swap risk. Should never trigger during scripted boss phase transitions or in the middle of active combat inputs to avoid feeling like a bug.
- Trigger logic: random chance per time interval, scaling with total active bonus slots/Overclock Strain stacks — zero chance at 0 stacks, low chance at 1-2 stacks, noticeably more frequent only at max stacks.
- Thematic goal: mirrors David's hallucination/cyberpsychosis moments in Edgerunners without being a true "taint" mechanic — it's a flavor/immersion effect for legend-tier chrome stacking, not a punishment system.

## Level Cap Extension
- Propose extending from vanilla 60 to 70, with new perk points awarded every 2 levels past 60 (half the vanilla rate) to slow power creep.
- New XP curve should scale non-linearly (steeper past level 60) so the extension takes meaningful repeatable-raid grinding, not a quick farm.
