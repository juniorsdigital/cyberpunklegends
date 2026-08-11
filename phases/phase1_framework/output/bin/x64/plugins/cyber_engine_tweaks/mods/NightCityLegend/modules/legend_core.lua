-- Night City Legend — CET persistent state module (Phase 1)
-- Saves mod state to local JSON (not the game save).

local LegendCore = {}

local DEFAULT_STATE = {
  version = 1,
  raid_cooldowns = {},
  boss_defeat_counts = {},
  capacity_shard_count = 0,
  ledger_intro_shown = false,
}

local state = nil
local statePath = nil

local function deepCopy(tbl)
  if type(tbl) ~= "table" then
    return tbl
  end
  local out = {}
  for k, v in pairs(tbl) do
    out[k] = deepCopy(v)
  end
  return out
end

local function mergeDefaults(loaded)
  local merged = deepCopy(DEFAULT_STATE)
  if type(loaded) ~= "table" then
    return merged
  end
  for k, v in pairs(loaded) do
    merged[k] = v
  end
  if type(merged.raid_cooldowns) ~= "table" then
    merged.raid_cooldowns = {}
  end
  if type(merged.boss_defeat_counts) ~= "table" then
    merged.boss_defeat_counts = {}
  end
  if type(merged.capacity_shard_count) ~= "number" then
    merged.capacity_shard_count = 0
  end
  if merged.ledger_intro_shown == nil then
    merged.ledger_intro_shown = false
  end
  merged.version = merged.version or 1
  return merged
end

function LegendCore.Init(modPath)
  statePath = (modPath or "") .. "/data/legend_state.json"
  LegendCore.Load()
end

function LegendCore.GetStatePath()
  return statePath
end

function LegendCore.Load()
  state = deepCopy(DEFAULT_STATE)
  if not statePath then
    return state
  end
  local file = io.open(statePath, "r")
  if not file then
    LegendCore.Save()
    return state
  end
  local raw = file:read("*a")
  file:close()
  if not raw or raw == "" then
    LegendCore.Save()
    return state
  end
  local ok, decoded = pcall(function()
    return json.decode(raw)
  end)
  if ok and type(decoded) == "table" then
    state = mergeDefaults(decoded)
  else
    print("[NightCityLegend] Failed to decode legend_state.json; using defaults.")
    state = deepCopy(DEFAULT_STATE)
  end
  return state
end

function LegendCore.Save()
  if not statePath then
    return false
  end
  if not state then
    state = deepCopy(DEFAULT_STATE)
  end
  local file = io.open(statePath, "w")
  if not file then
    print("[NightCityLegend] Could not write " .. tostring(statePath))
    return false
  end
  file:write(json.encode(state))
  file:close()
  return true
end

--- Returns a deep copy of the full persistent state table.
function LegendCore.GetState()
  if not state then
    LegendCore.Load()
  end
  return deepCopy(state)
end

--- Sets a top-level state key and persists immediately.
function LegendCore.SetState(key, value)
  if type(key) ~= "string" or key == "" then
    print("[NightCityLegend] SetState requires a non-empty string key.")
    return false
  end
  if not state then
    LegendCore.Load()
  end
  state[key] = value
  return LegendCore.Save()
end

function LegendCore.IsLegendModeUnlockedFact()
  local qs = Game.GetQuestsSystem()
  if not qs then
    return false
  end
  local value = qs:GetFactStr("legend_mode_unlocked")
  return value ~= nil and value > 0
end

--- Candidate vanilla facts (must stay in sync with LegendCore.reds / NOTES.md).
LegendCore.ENDING_CANDIDATE_FACTS = {
  "q115_done",
  "q116_done",
  "q201_done",
  "q202_done",
  "q203_done",
  "q204_done",
  "epilogue_done",
  "sq032_done",
}

function LegendCore.DumpEndingFacts()
  local qs = Game.GetQuestsSystem()
  if not qs then
    print("[NightCityLegend] QuestsSystem unavailable.")
    return
  end
  print("[NightCityLegend] === Ending candidate facts (read-only) ===")
  for _, name in ipairs(LegendCore.ENDING_CANDIDATE_FACTS) do
    local value = qs:GetFactStr(name)
    print(string.format("  %s = %s", name, tostring(value)))
  end
  local unlock = qs:GetFactStr("legend_mode_unlocked")
  local intro = qs:GetFactStr("legend_ledger_intro_shown")
  print(string.format("  legend_mode_unlocked = %s", tostring(unlock)))
  print(string.format("  legend_ledger_intro_shown = %s", tostring(intro)))
  print("[NightCityLegend] === end dump ===")
end

function LegendCore.PrintStatus()
  local unlocked = LegendCore.IsLegendModeUnlockedFact()
  local s = LegendCore.GetState()
  print("[NightCityLegend] Legend Mode unlocked fact: " .. tostring(unlocked))
  print("[NightCityLegend] capacity_shard_count: " .. tostring(s.capacity_shard_count))
  print("[NightCityLegend] ledger_intro_shown (CET): " .. tostring(s.ledger_intro_shown))
  local raidCount = 0
  for _ in pairs(s.raid_cooldowns or {}) do
    raidCount = raidCount + 1
  end
  local bossCount = 0
  for _ in pairs(s.boss_defeat_counts or {}) do
    bossCount = bossCount + 1
  end
  print("[NightCityLegend] raid_cooldowns entries: " .. tostring(raidCount))
  print("[NightCityLegend] boss_defeat_counts entries: " .. tostring(bossCount))
  print("[NightCityLegend] state file: " .. tostring(statePath))
end

--- Debug: set custom unlock fact only (never touches vanilla ending facts).
function LegendCore.ForceUnlock()
  local qs = Game.GetQuestsSystem()
  if not qs then
    print("[NightCityLegend] QuestsSystem unavailable.")
    return false
  end
  qs:SetFactStr("legend_mode_unlocked", 1)
  print("[NightCityLegend] Set legend_mode_unlocked = 1 (custom fact only).")
  return true
end

return LegendCore
