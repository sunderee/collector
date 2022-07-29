import 'package:collector/ui/screens/components/molecules/bottom_bar.dart';
import 'package:collector/ui/screens/components/pages/history.page.dart';
import 'package:collector/ui/screens/components/pages/home.page.dart';
import 'package:collector/ui/screens/components/pages/settings.page.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Duration _animationDuration = Duration(milliseconds: 150);
  static const Curve _animationCurve = Curves.linear;

  final _pageController = PageController();

  int _currentIndex = 0;

  List<String> get _appBarTitles => [
        context.locale.bottomBarLabelHome,
        context.locale.bottomBarLabelHistory,
        context.locale.bottomBarLabelSettings,
      ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(() => setState(
            () => _currentIndex = _pageController.page?.toInt() ?? 0,
          ));
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_currentIndex]),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          HistoryPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        onPageSelected: (int page) {
          _pageController.animateToPage(
            page,
            duration: _animationDuration,
            curve: _animationCurve,
          );
        },
      ),
    );
  }
}
