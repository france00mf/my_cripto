import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class BottomSheetSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).shadowColor,
          width: 1.5,
        ),
      ),
           child: Padding(
        padding: EdgeInsets.only(bottom: SizingConfig.defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TradeButton(
              type: TradeType.Buy,
              onPressed: () => displayBottomSheet(context, TradeType.Buy),
            ),
            TradeButton(
              type: TradeType.Sell,
              onPressed: () => displayBottomSheet(context, TradeType.Sell),
            )
          ],
        ),
      ),

    );
  }

}