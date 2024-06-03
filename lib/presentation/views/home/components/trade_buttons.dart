
import 'package:flutter/material.dart';
import 'package:my_cripto/widgets/app_text.dart';

class TradeButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 171,
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

        ),
        child: AppText.button(
          "",
          
        ),
      ),
    );
  }

}