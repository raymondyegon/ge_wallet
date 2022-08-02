import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';

class HomeActionList extends StatefulWidget {
  const HomeActionList({Key? key}) : super(key: key);

  @override
  State<HomeActionList> createState() => _HomeActionListState();
}

class _HomeActionListState extends State<HomeActionList> {
  bool showBalance = true;

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return SizedBox(
      height: _sc.heightScaledSize(110),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          _actionItem(
            context: context,
            icon: Icon(
              Icons.qr_code_2_outlined,
              size: _sc.size25HeightScaled,
              color: Colors.white,
            ),
            backgroundColor: AppColors.strongBlue,
            title: 'Your Address',
            onTap: () {},
          ),
          _actionItem(
            context: context,
            icon: Icon(
              Icons.person_outline_outlined,
              size: _sc.size25HeightScaled,
            ),
            title: 'Aliases',
            onTap: () {},
          ),
          _actionItem(
            context: context,
            icon: Switch(
              value: showBalance,
              activeColor: Colors.white,
              activeTrackColor: AppColors.strongBlue,
              onChanged: (bool value) {
                setState(() {
                  showBalance = value;
                });
              },
            ),
            title: 'Balance',
            onTap: () {},
          ),
          _actionItem(
            context: context,
            icon: Icon(
              Icons.close_fullscreen_outlined,
              size: _sc.size25HeightScaled,
            ),
            title: 'Receive',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _actionItem({
  required BuildContext context,
  required Widget icon,
  required String title,
  required VoidCallback onTap,
  Color? backgroundColor,
}) {
  final _sc = SizeConfig(context: context);

  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: backgroundColor,
      child: Container(
        constraints: BoxConstraints(
          minWidth: _sc.heightScaledSize(140),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _sc.heightScaledSize(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            AutoSizeText(
              title,
              style: _sc.body1Theme.copyWith(
                color: AppColors.lightGray,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    ),
  );
}
