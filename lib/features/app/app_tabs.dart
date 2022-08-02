import 'package:flutter/material.dart';
import 'package:ge_wallet/core/presentation/page_margin.dart';
import 'package:ge_wallet/features/home/presentation/pages/home_screen.dart';
import 'package:ge_wallet/features/home/presentation/widgets/action_sheet.dart';

class AppTabs extends StatefulWidget {
  const AppTabs({Key? key}) : super(key: key);

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _pages = <Widget>[
      const HomeScreen(),
      Container(
        child: const Center(
          child: Text('exchange'),
        ),
      ),
      Container(
        child: const Center(
          child: Text('Home'),
        ),
      ),
      Container(
        child: const Center(
          child: Text('transactions'),
        ),
      ),
      Container(
        child: const Center(
          child: Text('settings'),
        ),
      ),
    ];

    return PageMargin(
      showBottomNav: true,
      selectedIndex: selectedIndex,
      backgroundColor: Colors.white,
      onNavItemTap: (int v) {
        if (v != 2) {
          setState(() {
            selectedIndex = v;
          });
        } else {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            enableDrag: true,
            useRootNavigator: true,
            backgroundColor: Colors.transparent,
            builder: (_) => const ActionSheet(),
          );
        }
      },
      child: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
    );
  }
}
