import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cripto/core/data/repository/binance_repository.dart';
import 'package:my_cripto/presentation/states/base_viewmodel.dart';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/foundation.dart';
import 'package:my_cripto/core/data/model/candle_stick_ticker_model.dart';
import 'package:my_cripto/core/data/model/order_book_model.dart';
import 'package:my_cripto/core/data/model/symbol_response_model.dart';
import 'package:my_cripto/presentation/states/viewmodel_state.dart';
import 'package:my_cripto/utils/app_logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/errors/errors.dart';

class HomeViewModel extends BaseViewModel{
  final Ref ref;
  HomeViewModel(this.ref);
  final _logger = appLogger(HomeViewModel);
  
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

   setSelectedInterval(int index) {
    _selectedInterval = index;
    notifyListeners();
  }

  setCandleTicker(CandleTickerModel candleT) {
    _candleTicker = candleT;
    notifyListeners();
  }

  setOrderBook(OrderBook data) {
    _orderBooks = data;
    notifyListeners();
  }

    Future<void> getSymbols() async {
    _logger.d("Getting Symbols.....");
    try {
      changeState(const ViewModelState.busy());
      final result = await ref.read(binanceRepositoryProvider).getSymbols();
      changeState(const ViewModelState.idle());
      _symbols = result;
      _logger.d("Symbols Length ===> ${_symbols.length}");
      if (_symbols.isNotEmpty) {
        _currentSymbol = _symbols[11];
      }
      notifyListeners();
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
      _logger.e(e.message);
    } catch (e) {
      _logger.e(e.toString());
      final err =
          AppError("unknown error", "an error occurred, please try again.");
      changeState(ViewModelState.error(err));
    }
  }

  getCandles(
    SymbolResponseModel symbol, String interval
  )async{
    _logger.d("Gettin Candles .....");
    try{
      changeState(const ViewModelState.busy());
      final result = await ref.read(binanceRepositoryProvider).getCandles(symbol: symbol.symbol, interval: interval.toLowerCase());

      _candles = result;
      _logger.d("Candles length -> ${_candles.length}");
      changeState(const ViewModelState.idle());
    }on Failure catch (e) {
        changeState(ViewModelState.error(e));
        _logger.e(e.message);
    }
    catch(e){
      _logger.e(e.toString());
      final err = AppError("Erro disconhecido", "Tente novamente");
      changeState(ViewModelState.error(err));
    }
  }


  
}


final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>(
  (ref)=> HomeViewModel(ref)
);