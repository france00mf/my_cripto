
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cripto/constants/app_assets.dart';
import 'package:my_cripto/extensions/context_extension.dart';
import 'package:my_cripto/widgets/app_text.dart';
import 'package:my_cripto/widgets/gap.dart';

import '../../utils/utils.dart';

final drawerItems = [
  'Exchange',
  'Wallets',
  'Roqqu Hub',
  'Log out',
];

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
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
                            // color: Colors.blue,
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
                      } else {
                        _scaffoldKey.currentState?.openEndDrawer();
                      }
                    },
                    child: SvgPicture.asset(AppAssets.menu),
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
              // Gap.h8,
       

              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                    color: Theme.of(context).shadowColor,
                    width: 1.5,
                  ),
                ),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
