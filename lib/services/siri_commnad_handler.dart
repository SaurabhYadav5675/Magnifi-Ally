import 'package:magnifi_ally/services/siri_srvice.dart';

class CommandHandler {
  final SiriService _service = SiriService();

  Future<String> handleBalanceIntent() async {
    double balance = await _service.fetchBalance();
    return 'Your balance is \$${balance.toStringAsFixed(2)}';
  }
}
