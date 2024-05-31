
import 'package:my_cripto/core/data/remote/binance/binance_interface_imp.dart';
import 'package:web_socket_channel/src/channel.dart';

class BinanceRepositoryImp implements BinanceInterface{
  @override
  WebSocketChannel establishSocketConnection({required String symbol, required String interval}) {
    // TODO: implement establishSocketConnection
    throw UnimplementedError();
  }

  @override
  Future<List<void>> getCandles({required String symbol, required String interval, int? endTime}) {
    // TODO: implement getCandles
    throw UnimplementedError();
  }
  
}