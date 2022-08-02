import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';

class WalletSelectorWidget extends StatelessWidget {
  const WalletSelectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Wallet',
          style: _sc.body1Theme.copyWith(
            color: AppColors.lightGray,
          ),
        ),
        Row(
          children: [
            AutoSizeText(
              'Mobile Team',
              style: _sc.h5Theme.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.swap_vert_outlined,
                color: AppColors.lightGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
