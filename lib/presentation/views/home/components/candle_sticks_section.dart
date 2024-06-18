import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:my_cripto/utils/app_colors.dart';
import 'package:my_cripto/widgets/gap.dart';

class CandleSticksSection extends ConsumerStatefulWidget {
  const CandleSticksSection({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CandleSticksSectionState();
}



class _CandleSticksSectionState extends ConsumerState<CandleSticksSection> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(homeViewModelProvider);
    // TODO: implement build
    throw Column(
      children: [
        const Gap(7),
        TimeFrameSection(
          onSelected: (frame){
            vm.setInterval(frame);
            if(vm.currentSymbol != null){
              ref.read(homeViewModelProvider).getCandles(vm.currentSymbol!, vm.currentInterval).then(
                (_candles){
                  vm.initializeWebSocket(symbol: vm.currentSymbol!.symbol, interval: vm.currentInterval);
                }
              );
            }
          }
        ),
        const Gap(15),
        Divider(
          color: AppColors.blackTint.withOpacity(.1),
          thickness: 1,
        ),
              Divider(
          color: AppColors.blackTint.withOpacity(.1),
          thickness: 1,
        ),
        if(vm.candles.isNotEmpty)
          SizedBox(
            height: 400,
            width: double.infinity,
            child: CandlesSticks(
              key: Key(vm.currentSymbol!.symbol + vm.currentInterval),
              
            ),
          )
      ],
    );
  }
  
}