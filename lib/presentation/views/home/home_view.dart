
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cripto/constants/app_assets.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/presentation/views/home/components/bottom_sheet_section.dart';
import 'package:my_cripto/presentation/views/home/components/candle_sticks_section.dart';
import 'package:my_cripto/presentation/views/home/components/order_book_section.dart';
import 'package:my_cripto/presentation/views/home/components/price_change_section.dart';
import 'package:my_cripto/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:my_cripto/widgets/app_text.dart';
import 'package:my_cripto/widgets/gap.dart';

import '../../../utils/utils.dart';

final drawerItems = [
  'Exchange',
  'Wallets',
  'Roqqu Hub',
  'Log out',
];

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with TickerProviderStateMixin{
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late final TabController _tabController;

  @override
  void initState(){
    _tabController= TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final vm= ref.watch(homeViewModelProvider);
        ref.read(homeViewModelProvider).getSymbols().then((value){
            if(vm.currentSymbol != null ) {

              ref.read(homeViewModelProvider).getCandles(vm.currentSymbol!, vm.currentInterval).then((value){

                if(vm.candleTicker == null) {
                  vm.initializeWebSocket(
                    interval: vm.currentInterval,
                    symbol: vm.currentSymbol!.symbol
                  );
                }
              });
            }
        });
    });
    super.initState();
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      endDrawer: Stack(
        children: [
          Positioned(
            top: 65,
            right: 10,
            child: Container(
              height: context.isDarkMode ? 208 : 256,
              width: 214,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).shadowColor,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Gap.h10,
                  context.isDarkMode
                      ? const SizedBox.shrink()
                      : Container(
                          height: 45,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.blackTint,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: TextField(
                            style: bodyStyle1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.only(left: 12, top: 8),
                              hintText: "Search",
                              hintStyle: bodyStyle1,
                              suffixIcon: const Icon(
                                CupertinoIcons.search,
                                color: AppColors.blackTint,
                              ),
                            ),
                          ),
                        ),
                  ...drawerItems.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      child: AppText.body1(e),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(63),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).shadowColor,
                width: 1.5,
              ),
            ),
          ),
          child: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: SvgPicture.asset(
              AppAssets.company_logo,
              color: context.isDarkMode ? Colors.white : null,
            ),
            actions: [
              Row(
                children: [
                  Image.asset(AppAssets.avatar),
                  Gap.w16,
                  SvgPicture.asset(AppAssets.internet),
                  Gap.w16,
                  InkWell(
                    onTap: () {
                      if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                        _scaffoldKey.currentState?.closeEndDrawer();
                      }   else {
                        _scaffoldKey.currentState?.openEndDrawer();
                      }
                    },
                    child:
                     SvgPicture.asset(AppAssets.menu),

                  )
                ],
              ),
              Gap.w14,
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               const PriceChangeSection(),
               
              Gap.h8,



 
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                    color: Theme.of(context).shadowColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: TabBar(
                  controller: _tabController,
                  padding: const EdgeInsets.all(2),
                  labelStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                    fontSize: 13
                  ),
                  tabs: [
                    DecoratedBox(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: AppText.body2('Charts'),
                    ),
                    DecoratedBox(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AppText.body2("OderBook"),
                    ),
                    DecoratedBox(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AppText.body2("Recent Trades"),
                    )
                  ],
                ),
              ),

                   SizedBox(
                      height: 550,
                      child: TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const CandleSticksSection(),
                           OrderBookSection(),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.all(20),
                            child: AppText.heading5(
                              'Recent Trades',
                            ),
                          ),
                          // Container(),
                          // Container()
                        ],
                      ),
                    ),

                          Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                    color: Theme.of(context).shadowColor,
                    width: 1.5,
                  ),
                ),
                child: const TradesSection(),
                // child: Container(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomSheetSection(),
    );
  }
}
