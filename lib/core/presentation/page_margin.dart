import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';

import 'tap_outside_unfocus.dart';

class PageMargin extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool resizeToAvoidBottomInset;
  final bool showBottomNav;
  final bool showfloatingButton;
  final ValueChanged<int>? onNavItemTap;
  final Color? backgroundColor;
  final Widget? floatingButton;
  final int selectedIndex;
  final bool showAppBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const PageMargin({
    Key? key,
    required this.child,
    this.resizeToAvoidBottomInset = true,
    this.showBottomNav = false,
    this.showfloatingButton = false,
    this.onNavItemTap,
    this.backgroundColor,
    this.floatingButton,
    this.selectedIndex = -1,
    this.showAppBar = false,
    this.padding,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  _PageMarginState createState() => _PageMarginState();
}

class _PageMarginState extends State<PageMargin> {
  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    if (widget.showBottomNav && widget.selectedIndex == -1) {
      throw Exception("selectedIndex cannot be null when showing bottom nav");
    }
    if (widget.showBottomNav && widget.onNavItemTap == null) {
      throw Exception("onNavItemTap cannot be null when showing bottom nav");
    }

    return TapOutsideUnfocus(
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        backgroundColor: widget.backgroundColor,
        floatingActionButton: widget.floatingButton ?? Container(),
        floatingActionButtonLocation: widget.floatingActionButtonLocation ??
            FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: widget.showBottomNav
            ? BottomNavigationBar(
                currentIndex: widget.selectedIndex,
                onTap: (int val) {
                  widget.onNavItemTap!(val);
                },
                selectedItemColor: AppColors.strongBlue,
                unselectedItemColor: AppColors.lightGray,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                backgroundColor: Colors.white,
                selectedLabelStyle: _sc.body1Theme.copyWith(
                  color: AppColors.strongBlue,
                  inherit: true,
                ),
                unselectedLabelStyle: _sc.body1Theme.copyWith(
                  color: AppColors.mediumLightGray,
                  inherit: true,
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_balance_wallet_outlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.swap_horiz_outlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.sort_outlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                    ),
                  ),
                ],
              )
            : null,
        body: SafeArea(
          child: Padding(
            padding: widget.padding ??
                EdgeInsets.only(
                  left: _sc.heightScaledSize(20),
                  right: _sc.heightScaledSize(20),
                  top: _sc.heightScaledSize(5),
                ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
