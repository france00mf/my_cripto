import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/utils/app_colors.dart';
import 'package:my_cripto/widgets/app_text.dart';

class TradeBottomSheet extends StatefulWidget {
  const TradeBottomSheet({super.key});

  @override
  State<TradeBottomSheet> createState() => _TradeBottomSheetState();
}

class _TradeBottomSheetState extends State<TradeBottomSheet> {
  final List<String> options = [
    'Limit',
    'Market',
    'Stop-Limit',
  ];

  String selectedOption = 'Limit';
  int selectedValue = 0;
  final _limitPriceController = TextEditingController();
  final _amountController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       padding: const EdgeInsets.fromLTRB(30, 34, 30, 15),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CupertinoSlidingSegmentedControl(children: {
                  0: Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: Center(child: AppText.body1('Buy'),),
                  ),
                  1: Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: AppText.body1('Sell'),
                    ),
                  )
                }, onValueChanged: (buttonSelection){
                  setState(() {
                    selectedValue=buttonSelection!;
                  });
                },
                backgroundColor: context.isDarkMode ?
 const Color(0xff21262C)
                        : AppColors.white,
                        padding: EdgeInsets.all(3),
                        groupValue: selectedValue,
                )
              ],
            ),
          )
        ],
       ),
    );
  }
}