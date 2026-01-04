import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labaku/data/constant/app_assets.dart';
import 'package:labaku/data/constant/app_color.dart';
import 'package:labaku/data/constant/app_font.dart';
import 'package:labaku/injection.dart';
import 'package:labaku/presentation/home.dart/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:labaku/utils/formatter/currency_formatter.dart';
import 'package:labaku/utils/formatter/date_formatter.dart';
// import 'package:labaku/utils/formatter/date_formatter.dart';
import 'package:labaku/utils/formatter/number_formatter.dart';
import 'package:labaku/utils/utilities.dart';
import 'package:lottie/lottie.dart';

part 'widget/item_greeting.dart';
part 'widget/section_balance.dart';
part 'widget/section_tab_view.dart';
part 'widget/section_summary.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeBloc _homeBloc;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _homeBloc = getIt<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: _homeBloc,
          buildWhen: (p, c) => p.activeTabIndex != c.activeTabIndex,
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: kToolbarHeight),
                ),
                const GreetingHeader(
                  name: "Toko Lancar Barokah",
                ),
                const SizedBox(height: 16),
                buildTabBar(state),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SectionTabView(
                      title: 'Harian',
                    ),
                    SectionTabView(
                      title: 'Mingguan',
                    ),
                    SectionTabView(
                      title: 'Bulanan',
                    ),
                  ],
                ))
              ],
            );
          },
        ));
  }

  Container buildTabBar(HomeState state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColor.whiteSmoke.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(12)),
      child: DefaultTabController(
          length: _tabController.length,
          child: Column(children: [
            TabBar(
                controller: _tabController,
                padding: EdgeInsets.zero,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                labelColor: AppColor.primaryColor,
                dividerHeight: 0,
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: (index) => _homeBloc.add(ChangeIndexEvent(index)),
                tabs: [
                  _buildItemTabBar(
                    fixedTabIndex: 0,
                    activeIndex: state.activeTabIndex,
                    label: "Harian",
                  ),
                  _buildItemTabBar(
                    fixedTabIndex: 1,
                    activeIndex: state.activeTabIndex,
                    label: "Mingguan",
                  ),
                  _buildItemTabBar(
                    fixedTabIndex: 2,
                    activeIndex: state.activeTabIndex,
                    label: "Bulanan",
                  ),
                ])
          ])),
    );
  }

  Tab _buildItemTabBar(
      {required int fixedTabIndex,
      required int activeIndex,
      required String label}) {
    return Tab(
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: activeIndex == fixedTabIndex
              ? AppColor.primaryBlue.withValues(alpha: .95)
              : Colors.transparent
            ..withValues(alpha: .5),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: activeIndex == fixedTabIndex
              ? AppFont.text13Bold.copyWith(color: AppColor.backgroundColor)
              : AppFont.text12Normal.copyWith(
                  color: AppColor.primaryBlue,
                ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
