

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cripto/constants/app_assets.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:my_cripto/utils/sizing_config.dart';
import 'package:my_cripto/widgets/app_text.dart';
import 'package:my_cripto/widgets/gap.dart';

class OrderBookSection extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModelProvider);
    return Column(
      children: [
               Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: context.isDarkMode
                          ? const Color(0xff353945)
                          : const Color(0xffCFD3D8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.select_1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        // color: Color(0xffCFD3D8),
                        ),
                    child: SvgPicture.asset(
                      AppAssets.select_2,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: const BoxDecoration(
                        // color: Color(0xffCFD3D8),
                        ),
                    child: SvgPicture.asset(
                      AppAssets.select_3,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? const Color(0xff353945)
                      : const Color(0xffCFD3D8),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    AppText.caption(
                      '10',
                    ),
                    const Gap(5),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}