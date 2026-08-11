-- Night City Legend — CET entry point (Phase 1)
-- Registers persistent LegendCore state and debug helpers for later phases.

local LegendCore = require("modules/legend_core")

-- CET resolves relative io paths against this mod's folder.
local MOD_ROOT = "."

registerForEvent("onInit", function()
  LegendCore.Init(MOD_ROOT)
  -- Global aliases for other CET modules / console use (Phase 2+).
  NightCityLegend = NightCityLegend or {}
  NightCityLegend.LegendCore = LegendCore
  NightCityLegend.RunCommand = function(cmd)
    local key = tostring(cmd or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if key == "/legend_status" then
      LegendCore.PrintStatus()
      return true
    elseif key == "/legend_dump_facts" then
      LegendCore.DumpEndingFacts()
      return true
    elseif key == "/legend_force_unlock" then
      LegendCore.ForceUnlock()
      LegendCore.SetState("ledger_intro_shown", false)
      return true
    end
    print("[NightCityLegend] Unknown command: " .. key)
    print("[NightCityLegend] Available: /legend_status /legend_dump_facts /legend_force_unlock")
    return false
  end
  _G.LegendCore = LegendCore
  print("[NightCityLegend] Phase 1 framework loaded.")
  print("[NightCityLegend] Console: LegendCore.PrintStatus() | DumpEndingFacts() | ForceUnlock()")
  print("[NightCityLegend] Or: NightCityLegend.RunCommand(\"/legend_status\")")
end)

registerForEvent("onShutdown", function()
  if LegendCore and LegendCore.Save then
    LegendCore.Save()
  end
end)

registerHotkey("ncl_legend_status", "Night City Legend: Status", function()
  LegendCore.PrintStatus()
end)

registerHotkey("ncl_legend_dump_facts", "Night City Legend: Dump Ending Facts", function()
  LegendCore.DumpEndingFacts()
end)

registerHotkey("ncl_legend_force_unlock", "Night City Legend: Force Unlock (debug)", function()
  LegendCore.ForceUnlock()
  LegendCore.SetState("ledger_intro_shown", false)
end)

print("[NightCityLegend] init.lua parsed.")
