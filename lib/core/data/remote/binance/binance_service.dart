
import 'package:my_cripto/core/data/remote/binance/binance_interface_imp.dart';
import 'package:my_cripto/utils/app_logger.dart';
import 'package:web_socket_channel/src/channel.dart';

class BinanceServiceImpl implements BinanceService{
  final _networkClient="";
  final _logger= appLogger(BinanceServiceImpl);
  @override
  WebSocketChannel establishSocketConnection({required String symbol, required String interval}) {
      final channer=WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws'));
throw UnimplementedError();
      
    
  }

  @override
  Future<List<void>> getCandles({required String symbol, required String interval, int? endTime}) {
    // TODO: implement getCandles
    throw UnimplementedError();
  }

}