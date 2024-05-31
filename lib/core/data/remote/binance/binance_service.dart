
import 'dart:convert';

import 'package:my_cripto/core/data/remote/binance/binance_interface_imp.dart';
import 'package:my_cripto/utils/app_logger.dart';
import 'package:web_socket_channel/src/channel.dart';

class BinanceServiceImpl implements BinanceService{
  final _networkClient="";
  final _logger= appLogger(BinanceServiceImpl);
  
  @override
  WebSocketChannel establishSocketConnection({required String symbol, required String interval}) {
      final channel=WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws'));

      channel.sink.add(jsonEncode({
            'method': 'SUBSCRIBE',
          'params': ['$symbol@kline_$interval'],
          'id': 1
      }));

      channel.sink.add(
        jsonEncode({
          'method': 'SUBSCRIBE',
          'params': ['$symbol@depth'],
          'id': 1
        })
      );

 return channel;
      
    
  }

  @override
  Future<List<void>> getCandles({required String symbol, required String interval, int? endTime}) {
    // TODO: implement getCandles
    throw UnimplementedError();
  }

}