import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/ui/screens/components/molecules/bottom_bar.dart';
import 'package:collector/ui/screens/components/pages/history.page.dart';
import 'package:collector/ui/screens/components/pages/home.page.dart';
import 'package:collector/ui/screens/components/pages/settings.page.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Duration _animationDuration = Duration(milliseconds: 150);
  static const Curve _animationCurve = Curves.linear;

  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MeasurementCubit>(context)
          .retrieveMeasurements(context.locale.error);
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
        title: Text(context.locale.appName),
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
