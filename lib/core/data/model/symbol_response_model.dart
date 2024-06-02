
import 'dart:convert';

class SymbolResponseModel{
  final String symbol;
  final String price;
  SymbolResponseModel( {required this.symbol,required this.price,});

  factory SymbolResponseModel.fromJson(String source)=> SymbolResponseModel.fromMap(json.decode(source) as Map <String, dynamic>);

  factory SymbolResponseModel.fromMap(Map<String, dynamic> map){
    return SymbolResponseModel(symbol: map["symbol"] as String, price: map["price"] as String);
  }
}