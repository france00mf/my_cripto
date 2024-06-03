import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/foundation.dart';
import 'package:my_cripto/core/data/model/candle_stick_ticker_model.dart';
import 'package:my_cripto/core/data/model/order_book_model.dart';
import 'package:my_cripto/core/data/model/symbol_response_model.dart';
import 'package:my_cripto/utils/app_logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'viewmodel_state.dart';

class BaseViewModel extends ChangeNotifier {
  late final _logger = appLogger(BaseViewModel);
  AppLogger get logger => _logger;

    int _selectedInterval = 0;
  int get selectedInterval => _selectedInterval;
  List<SymbolResponseModel> _symbols = [];
  List<SymbolResponseModel> get symbols => _symbols;
  WebSocketChannel? _channel;
  WebSocketChannel? get channel => _channel;


    List<Candle> _candles = [];
  List<Candle> get candles => _candles;
  String _currentInterval = "1H";
  String get currentInterval => _currentInterval;
  SymbolResponseModel? _currentSymbol;
  SymbolResponseModel? get currentSymbol => _currentSymbol;
  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  int _bottomTabIndex = 0;
  int get bottomTabIndex => _bottomTabIndex;

    CandleTickerModel? _candleTicker;
  CandleTickerModel? get candleTicker => _candleTicker;
  OrderBook? _orderBooks;
  OrderBook? get orderBooks => _orderBooks;


   setBottomTabIndex(int index) {
    _bottomTabIndex = index;
    notifyListeners();
  }

  setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  setInterval(String interval) {
    _currentInterval = interval;
    notifyListeners();
  }

    setCurrentSymbol(SymbolResponseModel v) {
    _currentSymbol = v;
    notifyListeners();
  }



}