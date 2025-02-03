import 'package:arobaze/colors.dart';
import 'package:arobaze/screens/tabs/message.dart';
import 'package:arobaze/screens/tabs/profile.dart';
import 'package:arobaze/screens/tabs/swipe.dart';
import 'package:arobaze/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  Color primaryColor = AppColors.primary1;

  Color colorChat = AppColors.darkGray;
  Color colorHome = AppColors.primary1;
  Color colorProfile = AppColors.darkGray;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);

    _handleTabSelection();
  }

  Future<void> _handleTabSelection() async {
    primaryColor = await getGlobalColor();

    setState(() {
      // Update the color of the icons
      switch (_tabController.index) {
        case 0:
          colorChat = primaryColor;
          colorHome = AppColors.darkGray;
          colorProfile = AppColors.darkGray;
          break;
        case 1:
          colorChat = AppColors.darkGray;
          colorHome = primaryColor;
          colorProfile = AppColors.darkGray;
          break;
        case 2:
          colorChat = AppColors.darkGray;
          colorHome = AppColors.darkGray;
          colorProfile = primaryColor;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              const MessageTab(),
              const SwipeTab(),
              ProfileTab(callback: _handleTabSelection),
            ],
          ),
          bottomNavigationBar: TabBar(
            splashBorderRadius: BorderRadius.circular(0),
            dividerColor: AppColors.transparant,
            indicatorColor: AppColors.transparant,
            unselectedLabelColor: AppColors.white,
            labelColor: AppColors.primary1,
            overlayColor: MaterialStateProperty.all(AppColors.transparant),
            padding: const EdgeInsets.symmetric(horizontal: 40).add(const EdgeInsets.only(bottom: 10)),
            isScrollable: false,
            controller: _tabController,
            tabs: [
              Tab(icon: SvgPicture.asset(
                'assets/images/icons/Chat.svg',
                colorFilter: ColorFilter.mode(colorChat, BlendMode.srcIn),
                semanticsLabel: 'Meetzup Logo',
                height: 32,
              )),
              Tab(icon: SvgPicture.asset(
                'assets/images/logo/Logo.svg',
                colorFilter: ColorFilter.mode(colorHome, BlendMode.srcIn),
                semanticsLabel: 'Meetzup Logo',
                height: 46,
              )),
              Tab(icon: SvgPicture.asset(
                'assets/images/icons/Profile.svg',
                colorFilter: ColorFilter.mode(colorProfile, BlendMode.srcIn),
                semanticsLabel: 'Meetzup Logo',
                height: 32,
              )),
            ],
          ),
        ),
      ),
    );
  }
}