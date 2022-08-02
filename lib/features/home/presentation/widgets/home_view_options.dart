import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';

import 'token_widget.dart';

class HomeViewOptions extends StatefulWidget {
  const HomeViewOptions({Key? key}) : super(key: key);

  @override
  State<HomeViewOptions> createState() => _HomeViewOptionsState();
}

class _HomeViewOptionsState extends State<HomeViewOptions> {
  bool isTokenActive = true;

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _title(
              label: 'Token',
              isActive: isTokenActive,
              context: context,
              onTap: () {
                if (!isTokenActive) {
                  setState(() {
                    isTokenActive = !isTokenActive;
                  });
                }
              },
            ),
            SizedBox(width: _sc.heightScaledSize(15)),
            _title(
              label: 'Leasing',
              isActive: !isTokenActive,
              context: context,
              onTap: () {
                if (isTokenActive) {
                  setState(() {
                    isTokenActive = !isTokenActive;
                  });
                }
              },
            ),
          ],
        ),
        spacer(),
        const TokenWidget(),
      ],
    );
  }
}

Widget _title({
  required String label,
  required bool isActive,
  required BuildContext context,
  required VoidCallback onTap,
}) {
  final _sc = SizeConfig(context: context);

  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          label,
          style: _sc.body1Theme.copyWith(
            color: isActive ? Colors.black : AppColors.lightGray,
          ),
        ),
        Container(
          width: _sc.size15HeightScaled,
          height: _sc.heightScaledSize(3),
          decoration: BoxDecoration(
            color: isActive ? AppColors.strongBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    ),
  );
}
