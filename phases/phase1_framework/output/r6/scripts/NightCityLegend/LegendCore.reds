// Night City Legend — Phase 1 core framework
// Detects main-story completion (read-only vanilla facts) and sets custom
// fact `legend_mode_unlocked`. Never writes to vanilla quest facts.

public class LegendCore {
  public static func CustomUnlockFact() -> CName {
    return n"legend_mode_unlocked";
  }

  /// Public API for later phases. Returns true once Legend Mode has been unlocked.
  public static func IsLegendModeUnlocked() -> Bool {
    return LegendCore.IsLegendModeUnlockedGame(GetGameInstance());
  }

  public static func IsLegendModeUnlockedGame(game: GameInstance) -> Bool {
    return GameInstance.GetQuestsSystem(game).GetFact(LegendCore.CustomUnlockFact()) > 0;
  }

  /// Candidate vanilla ending / epilogue facts (OR). Names are assumptions —
  /// verify live via CET DumpEndingFacts or WolvenKit before Phase 2.
  /// See phases/phase1_framework/output/NOTES.md.
  public static func EndingCandidateFacts() -> array<CName> {
    let facts: array<CName>;
    ArrayPush(facts, n"q115_done");
    ArrayPush(facts, n"q116_done");
    ArrayPush(facts, n"q201_done");
    ArrayPush(facts, n"q202_done");
    ArrayPush(facts, n"q203_done");
    ArrayPush(facts, n"q204_done");
    ArrayPush(facts, n"epilogue_done");
    ArrayPush(facts, n"sq032_done");
    return facts;
  }

  public static func HasAnyEndingCompleted(game: GameInstance) -> Bool {
    let qs: ref<QuestsSystem> = GameInstance.GetQuestsSystem(game);
    let facts: array<CName> = LegendCore.EndingCandidateFacts();
    let i: Int32 = 0;
    while i < ArraySize(facts) {
      if qs.GetFact(facts[i]) > 0 {
        return true;
      };
      i += 1;
    };
    return false;
  }

  /// Sets only `legend_mode_unlocked`. Never writes vanilla facts.
  public static func TryUnlockLegendMode(game: GameInstance) -> Bool {
    if LegendCore.IsLegendModeUnlockedGame(game) {
      return true;
    };
    if !LegendCore.HasAnyEndingCompleted(game) {
      return false;
    };
    GameInstance.GetQuestsSystem(game).SetFact(LegendCore.CustomUnlockFact(), 1);
    return true;
  }
}

/// Session hook: re-evaluate unlock when the player attaches (load / new session).
public class LegendCoreSystem extends ScriptableSystem {
  private final func OnPlayerAttach(request: ref<PlayerAttachRequest>) -> Void {
    let game: GameInstance = this.GetGameInstance();
    if LegendCore.TryUnlockLegendMode(game) {
      LegendContact.OnLegendModeAvailable(game);
    };
  }

  public final func RefreshUnlock() -> Bool {
    let game: GameInstance = this.GetGameInstance();
    let unlocked: Bool = LegendCore.TryUnlockLegendMode(game);
    if unlocked {
      LegendContact.OnLegendModeAvailable(game);
    };
    return unlocked;
  }
}

/// Backup attach path if ScriptableSystem player-attach ordering differs by patch.
@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
  let result: Bool = wrappedMethod();
  let game: GameInstance = this.GetGame();
  if LegendCore.TryUnlockLegendMode(game) {
    LegendContact.OnLegendModeAvailable(game);
  };
  return result;
}
