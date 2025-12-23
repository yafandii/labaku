import 'package:boilerplate/data/constant/app_assets.dart';
import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/data/constant/app_font.dart';
import 'package:boilerplate/data/constant/app_string.dart';
import 'package:boilerplate/data/models/grid_menu_model.dart';
import 'package:boilerplate/data/models/product_model.dart';
import 'package:boilerplate/injection.dart';
import 'package:boilerplate/presentation/home.dart/bloc/home_bloc.dart';
import 'package:boilerplate/presentation/home.dart/widget/item_grid_menu.dart';
import 'package:boilerplate/presentation/home.dart/widget/item_title_section.dart';
import 'package:boilerplate/presentation/widgets/field/base_text_input.dart';
import 'package:boilerplate/utils/utilities.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  final TextEditingController _searchController = TextEditingController();
  late List<GridMenuModel> menu;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _homeBloc = getIt<HomeBloc>();
    _homeBloc.add(HomeInitialEvent());
    menu =
        AppString.gridMenuItem.map((e) => GridMenuModel.fromJson(e)).toList();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listenWhen: (previous, current) =>
            previous.productStatus != current.productStatus ||
            previous.categories != current.categories ||
            previous.products != current.products,
        listener: (context, state) {
          if (state.productStatus == FormzSubmissionStatus.failure) {
            //show warning error
          }
        },
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: AppColor.backgroundColor,
              statusBarIconBrightness: Brightness.light,
            ),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 650,
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0,
                    title: Container(
                      color: AppColor.backgroundColor,
                    ),
                    titleSpacing: 0,
                    elevation: 0,
                    pinned: true,
                    collapsedHeight: kToolbarHeight * 1.7,
                    backgroundColor: AppColor.backgroundColor,
                    flexibleSpace: sectionSliverAppbar(state),
                  ),
                ];
              },
              body: sectionBody(state.products),
            ),
          );
        },
      ),
    );
  }

  Widget sectionBody(List<Product>? products) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .6,
      ),
      itemCount: products?.length ?? 0,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 160,
                width: 160,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColor.grayColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  products?[index].thumbnail ?? '',
                  height: 150,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                products?[index].title ?? '-',
                style: AppFont.text14Bold,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                //dollar
                "\$${products?[index].price ?? 0}",

                style: AppFont.text13Normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlexibleSpaceBar sectionSliverAppbar(HomeState state) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      title: Container(
        color: AppColor.backgroundColor,
        padding: const EdgeInsets.only(bottom: 0, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitleSection(title: "Most Popular", onTap: () {}),
            const SizedBox(height: 10),
            sectionFilterCategory(state),
            const SizedBox(height: 16),
          ],
        ),
      ),
      titlePadding: const EdgeInsets.only(top: 16),
      expandedTitleScale: 1,
      background: sectionTop(),
    );
  }

  SizedBox sectionFilterCategory(HomeState state) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => {
              _homeBloc.add(SelectedCategoriesCHangeEvent(index)),
              scrollController.animateTo(
                index * 120,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              )
            },
            child: Container(
              margin: EdgeInsets.only(
                  right: index == 9 ? 16 : 10, left: index == 0 ? 16 : 0),
              width: 120,
              decoration: BoxDecoration(
                color: index == state.selectedCategory
                    ? AppColor.primaryColor
                    : Colors.transparent,
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  state.categories[index].name ?? '-',
                  style: AppFont.text13Bold.copyWith(
                      color: index == state.selectedCategory
                          ? AppColor.backgroundColor
                          : AppColor.primaryColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column sectionTop() {
    return Column(
      children: [
        const SizedBox(height: 50),
        topHeader(),
        const SizedBox(height: 18),
        boxSearch(),
        const SizedBox(height: 18),
        ItemTitleSection(title: "Special Offer", onTap: () {}),
        const SizedBox(height: 10),
        sliderImage(),
        const SizedBox(height: 24),
        gridMenu(),
      ],
    );
  }

  Padding gridMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          8,
          (index) => ItemGridMenu(
            menu: menu[index],
            onTap: () {},
          ),
        ),
      ),
    );
  }

  Widget sliderImage() {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider(
              items: state.banners
                  .map((e) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: Image.asset(e).image,
                              fit: BoxFit.cover,
                            )),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 150.0,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(milliseconds: 6000),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  _homeBloc.add(CarouselIndexChangeEvent(index));
                },
              ),
            ),

            //indicator
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    alignment: Alignment.center,
                    height: 6,
                    margin: const EdgeInsets.only(bottom: 12),
                    width: 144,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          //next dibikin animasi smooth indicator
                          width: state.curentIndexCarousel == index ? 18 : 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            color: (AppColor.backgroundColor).withValues(
                                alpha: state.curentIndexCarousel == index
                                    ? 1
                                    : 0.6),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Padding boxSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BaseTextInput(
        textFieldController: _searchController,
        label: "search",
        prefixWidget: Container(
          height: 12,
          width: 12,
          padding: const EdgeInsets.all(12),
          child: LottieBuilder.asset(
            AppAssets.searchIcon,
            repeat: false,
            fit: BoxFit.cover,
          ),
        ),
        showIconPrefix: true,
        showIconSuffix: true,
        suffixWidget: InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          child: Container(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(AppAssets.filterIcon, height: 16)),
        ),
      ),
    );
  }

  Widget topHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(AppAssets.avatar).image,
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppUtils.greeting(),
                      style: AppFont.text13Normal,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "👋",
                      style: AppFont.text13Bold,
                    ).animate().shake(
                          duration: const Duration(milliseconds: 600),
                          offset: const Offset(3, -3),
                          hz: 5,
                        ),
                  ],
                ),
                Text(
                  "Ucup",
                  style: AppFont.text15Bold,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: LottieBuilder.asset(
              AppAssets.icNotification,
              repeat: false,
              height: 28,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              AppAssets.likeIcon,
              height: 20,
            ).animate().shake(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                  offset: const Offset(-3, 0),
                ),
          ),
        ],
      ),
    );
  }
}
