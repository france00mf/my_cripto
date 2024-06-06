import 'package:flutter/material.dart';
import 'package:my_cripto/widgets/app_text.dart';

import '../../utils/utils.dart';




enum TradeType {
  Buy,
  Sell,
}

extension TradeTypeExtension on TradeType {
  bool get isSell => this == TradeType.Sell;
  bool get isBuy => this == TradeType.Buy;
}

class TradeButton extends StatelessWidget {
  final TradeType type;
  final void Function()? onPressed;
  const TradeButton({
    Key? key,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 171,
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: type.isBuy ? AppColors.green : AppColors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: AppText.button(
          type.isBuy ? "Buy" : "Sell",
          color: Colors.white,
        ),
      ),
    );
  }
}
