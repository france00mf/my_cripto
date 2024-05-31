

import 'package:web_socket_channel/web_socket_channel.dart';

abstract class BinanceInterface {
  Future<List<void>> getCandles({
    required String symbol,
    required String interval,
    int? endTime,
  });

  WebSocketChannel establishSocketConnection({
    required String symbol,
    required String interval,
  });
}

abstract class BinanceService implements BinanceInterface {}


