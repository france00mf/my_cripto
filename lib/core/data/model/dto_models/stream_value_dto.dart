
import 'package:my_cripto/core/data/model/symbol_response_model.dart';

class StreamValueDTO{
  late SymbolResponseModel symbol;
  late String interval;

  StreamValueDTO({
    required this.symbol,
    required this.interval
  });
}