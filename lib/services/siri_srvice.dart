

class SiriService {
  Future<double> fetchBalance() async {
    await Future.delayed(const Duration(seconds: 1));
    return 1234.56;
  }

  Future<void> registerShortcut() async {
   /* final FlutterShortcuts flutterShortcuts = FlutterShortcuts();
    flutterShortcuts.initialize(debug: true);

    flutterShortcuts.setShortcutItems(shortcutItems: [
      const ShortcutItem(
        id: 'show_balance',
        shortLabel: 'Show My Balance',
        longLabel: 'Show my bank balance',
        icon: 'icon.png',
        action: 'show_balance', // This should match the intent definition
      )
    ]);*/
  }
}
