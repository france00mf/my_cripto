
import 'package:flutter/cupertino.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/utils/app_colors.dart';
import 'package:my_cripto/widgets/app_text.dart';
import 'package:my_cripto/widgets/gap.dart';

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
              padding: EdgeInsets.all(3),
              groupValue: selectedValueNotifier.value,
              children: {
                0: Container(
                        width: 150,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: AppText.body1(
                          'Open Orders',
                        ),
                      ),
                ),
                1: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: AppText.body1(
                          'Positions',
                        ),
                      ),
                    ),
                    2: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: AppText.body1(
                          'Order History',
                        ),
                      ),
                    ),
                          3: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: AppText.body1(
                          'Trade History',
                        ),
                      ),
                    ),
              },
              onValueChanged: (value){
                selectedValueNotifier.value = value!;
              },
            )
          ),

          ValueListenableBuilder(
          valueListenable: selectedValueNotifier,
          builder: (context, value, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(30),
                  AppText.heading5(
                    'No Open Orders',
                  ),
                  const Gap(5),
                  SizedBox(
                    width: 280,
                    child: AppText.body1(
                      'This is orders without importancs',
                      textAlign: TextAlign.center,
                      color: context.isDarkMode
                          ? AppColors.blackTint
                          : AppColors.blackTint2,
                      height: 2,
                    ),
                  )
                ],
              ),
            );
          },
        ),

        ],
      ),
    );
  }

}

