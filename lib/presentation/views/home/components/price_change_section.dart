import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cripto/constants/app_assets.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:my_cripto/utils/sizing_config.dart';
import 'package:my_cripto/widgets/app_text.dart';
import 'package:my_cripto/widgets/gap.dart';

class PriceChangeSection extends ConsumerWidget {
  const PriceChangeSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(homeViewModelProvider);
    Container(
      height: 130,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).shadowColor,
          width: 1.5
        ),
        
      ),
      child: Column(
        children: [
          const Gap(20),
          Padding(padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding - 2),
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.btc_usd,
                width: 44,
                height: 24,
              ),
              const Gap(8),
              if(vm.currentInterval != null)...[
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      // AppText.heading5(vm.currentInterval.symbol ?? ""),
                      const Gap(10),
                    ],
                  ),
                )
              ]
            ],
          ),
          )
        ],
      ),
    );
    return const Placeholder();
  }
}