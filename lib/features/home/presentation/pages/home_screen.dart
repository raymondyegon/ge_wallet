import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_images.dart';
import 'package:ge_wallet/core/platform/size_config.dart';
import 'package:ge_wallet/features/home/presentation/widgets/home_action_list.dart';
import 'package:ge_wallet/features/home/presentation/widgets/home_view_options.dart';
import 'package:ge_wallet/features/home/presentation/widgets/wallet_selector_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return Column(
      children: [
        _homeTitle(context),
        spacer(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const WalletSelectorWidget(),
              spacer(),
              const HomeActionList(),
              spacer(),
              spacer(),
              const HomeViewOptions(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _homeTitle(BuildContext context) {
  final _sc = SizeConfig(context: context);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        tooltip: 'Notification',
        icon: const Icon(
          Icons.notifications_outlined,
          color: Colors.black,
        ),
      ),
      InkWell(
        onTap: () {},
        child: Image.asset(
          Appimage.user_icon,
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
          height: _sc.size25HeightScaled,
        ),
      ),
    ],
  );
}
