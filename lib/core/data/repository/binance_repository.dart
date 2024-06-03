
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cripto/core/data/model/symbol_response_model.dart';
import 'package:my_cripto/core/data/remote/binance/binance_interface_imp.dart';
import 'package:web_socket_channel/src/channel.dart';

class BinanceRepositoryImp implements BinanceInterface{
  final BinanceService _binanceService;
  BinanceRepositoryImp(this._binanceService);
  
  @override
  WebSocketChannel establishSocketConnection({required String symbol, required String interval}) {
    return _binanceService.establishSocketConnection(
      interval: interval,
      symbol: symbol,
    );
  }

  @override
  Future<List<Candle>> getCandles({required String symbol, required String interval, int? endTime}) {
    return _binanceService.getCandles(
      symbol: symbol,
      interval: interval,
    );
  }
  
  @override
  Future<List<void>> getSymbols() {
    return _binanceService.getSymbols();
  }

  final binanceRepositoryProvider = Provider<BinanceRepository>((ref){
    return BinanceRepositoryImp(ref.read(binanceServiceProvider));
  });
  
}