import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cripto/constants/app_assets.dart';
import 'package:my_cripto/core/data/model/dto_models/stream_value_dto.dart';
import 'package:my_cripto/extensions/double_extension.dart';
import 'package:my_cripto/presentation/views/home/components/time_frame_section.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:my_cripto/utils/app_colors.dart';
import 'package:my_cripto/widgets/app_text.dart';
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
    return Column(
      children: [
        const Gap(7),
        TimerFrameSection(
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
            child: Candlesticks(
              key: Key(vm.currentSymbol!.symbol + vm.currentInterval),
              candles: vm.candles,
              onLoadMoreCandles: (){
                return vm.loadMoreCandles(StreamValueDTO(symbol: vm.currentSymbol!, interval: vm.currentInterval.toLowerCase()));
              },
              actions: [
              ToolBarAction(
                  // width: 40,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SvgPicture.asset(
                      AppAssets.rounded_arrow_down,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),

                ToolBarAction(
                  width: 60,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: AppText.caption(
                      vm.currentSymbol!.symbol,
                      fontSize: 11,
                      color: AppColors.blackTint2,
                    ),
                  ),
                ),
                if(vm.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          AppText.body2(
                            'O ',
                            fontSize: 11,
                            color: AppColors.blackTint2,
                          ),
                          AppText.body2(
                            vm.candleTicker?.candle.open.formatValue() ?? "-",
                            fontSize: 11,
                            color: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                
                if (vm.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          AppText.body2(
                            'H ',
                            fontSize: 11,
                            color: AppColors.blackTint2,
                          ),
                          AppText.body2(
                            vm.candleTicker?.candle.high.formatValue() ?? "-",
                            fontSize: 11,
                            color: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (vm.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          AppText.body2(
                            'L ',
                            fontSize: 11,
                            color: AppColors.blackTint2,
                          ),
                          AppText.body2(
                            vm.candleTicker?.candle.low.formatValue() ?? "-",
                            fontSize: 11,
                            color: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                  ),


              ],
              
            ),
          )
      ],
    );
  }
  
}

