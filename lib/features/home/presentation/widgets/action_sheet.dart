import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';

class ActionSheet extends StatelessWidget {
  const ActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return Container(
      height: _sc.screenHeight * 0.5,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: _sc.heightScaledSize(20),
        right: _sc.heightScaledSize(20),
        bottom: _sc.heightScaledSize(25),
        top: _sc.heightScaledSize(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: _sc.size45HeightScaled,
              height: _sc.heightScaledSize(7),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          const Spacer(),
          _itemTile(
            color: Colors.orange,
            context: context,
            title: 'Send',
            icon: Icons.arrow_circle_up,
          ),
          spacer(),
          _itemTile(
            color: Colors.green,
            context: context,
            title: 'Receive',
            icon: Icons.arrow_circle_down,
          ),
          spacer(),
          _itemTile(
            color: Colors.purple,
            context: context,
            title: 'Exchange',
            icon: Icons.change_circle_outlined,
          ),
          spacer(),
          _itemTile(
            color: Colors.blue,
            context: context,
            title: 'QR Scan',
            subtitle: 'Invoice, addresses',
            icon: Icons.qr_code_scanner_outlined,
          ),
          spacer(),
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: 'Close',
              icon: const Icon(
                Icons.disabled_by_default_outlined,
              ),
            ),
          ),
          spacer(),
        ],
      ),
    );
  }
}

Widget _itemTile({
  required BuildContext context,
  required String title,
  required Color color,
  required IconData icon,
  String? subtitle,
}) {
  final _sc = SizeConfig(context: context);

  return ListTile(
    contentPadding: EdgeInsets.zero,
    minVerticalPadding: 0,
    minLeadingWidth: 0,
    leading: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.2),
      ),
      padding: EdgeInsets.all(_sc.heightScaledSize(10)),
      child: Icon(
        icon,
        color: color,
        size: _sc.size25HeightScaled,
      ),
    ),
    title: AutoSizeText(
      '$title',
      style: _sc.h6Theme.copyWith(
        color: Colors.black,
      ),
    ),
    subtitle: subtitle == null
        ? null
        : const AutoSizeText(
            'Invoice, addresses',
          ),
  );
}
