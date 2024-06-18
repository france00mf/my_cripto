import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';

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
    child: Container(),
    );
  }

}