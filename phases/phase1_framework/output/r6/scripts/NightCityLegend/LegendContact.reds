// Night City Legend — Phase 1 Fixer contact stub (data-only, no dialogue).
// Phone/call availability is gated on LegendCore.IsLegendModeUnlocked().

public class LegendContact {
  public static func ContactId() -> CName {
    return n"ncl_ripperdocs_ledger";
  }

  public static func DisplayName() -> String {
    return "The Ripperdoc's Ledger";
  }

  public static func JournalBlurb() -> String {
    return "Encrypted fixer channel for Legend Mode contracts. Raids and boss gigs unlock once the main story is done.";
  }

  /// Phone/call trigger gate — true only after Legend Mode unlock.
  public static func IsLedgerContactAvailable() -> Bool {
    return LegendCore.IsLegendModeUnlocked();
  }

  public static func IsLedgerContactAvailableGame(game: GameInstance) -> Bool {
    return LegendCore.IsLegendModeUnlockedGame(game);
  }

  /// One-shot on-screen notice that the Ledger channel is available.
  /// Dedup via custom fact `legend_ledger_intro_shown` (CET also tracks ledger_intro_shown).
  public static func OnLegendModeAvailable(game: GameInstance) -> Void {
    if !LegendContact.IsLedgerContactAvailableGame(game) {
      return;
    };
    let qs: ref<QuestsSystem> = GameInstance.GetQuestsSystem(game);
    if qs.GetFact(n"legend_ledger_intro_shown") > 0 {
      return;
    };
    qs.SetFact(n"legend_ledger_intro_shown", 1);
    LegendContact.ShowAvailableNotification(game);
  }

  private static func ShowAvailableNotification(game: GameInstance) -> Void {
    let message: SimpleScreenMessage;
    message.isShown = true;
    message.message = "New contact: The Ripperdoc's Ledger — Legend Mode contracts are online.";
    message.duration = 6.0;
    message.isInstant = true;
    let blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(game).Get(GetAllBlackboardDefs().UI_Notifications);
    if IsDefined(blackboard) {
      blackboard.SetVariant(GetAllBlackboardDefs().UI_Notifications.OnscreenMessage, ToVariant(message), true);
    };
  }
}
