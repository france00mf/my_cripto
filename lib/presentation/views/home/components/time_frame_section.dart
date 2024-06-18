import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:my_cripto/utils/app_colors.dart';
import 'package:my_cripto/widgets/app_text.dart';
import 'package:my_cripto/widgets/gap.dart';

class TimerFrameSection extends ConsumerWidget{

  final Function(String) onSelected;

  TimerFrameSection({super.key, required this.onSelected});

  final List<String> timeframes = [
    '1H',
    '2H',
    '4H',
    '1D',
    '1W',
    '1M',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModelProvider);

    return Padding(padding: const EdgeInsets.only(left: 16),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      children: [
        AppText.body1('Time',
        color: context.isDarkMode ? AppColors.white : AppColors.blackTint2,
        ),
        Gap.w4,
        ...timeframes.map((e) => 
        InkWell(
          onTap: (){
            onSelected.call(e);
            vm.setInterval(e);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(
              vertical: 6
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: vm.currentInterval == e ? context.isDarkMode  ? const Color(0xff555C63)
                            : const Color(0xffCFD3D8)
                        : Colors.transparent,
            ),
            child: Center(
              child: AppText.body1(
                e, 
            
                      color: context.isDarkMode
                          ? AppColors.white
                          : AppColors.blackTint2,
              ),
            ),
          ),
        )
        )
      ],
    )),
    );
  }

}