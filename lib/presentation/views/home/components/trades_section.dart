
import 'package:flutter/cupertino.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/utils/app_colors.dart';

class TradesSection extends StatefulWidget {
  const TradesSection({super.key});

  @override
  State<TradesSection> createState() => _TradesSectionState();
}


class _TradesSectionState extends State<TradesSection> {
  ValueNotifier<int> selectedValueNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: CupertinoSlidingSegmentedControl<int>(
              backgroundColor: context.isDarkMode
              ? AppColors.black.withOpacity(.16)
              : Color(0xffF1F1F1),
              thumbColor: context.isDarkMode
                 ? const Color(0xff21262C)
                        : AppColors.white,
              padding: EdgeInsets.all(3)
            )
          )
        ],
      ),
    );
  }

}

