import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';
import 'package:ge_wallet/core/presentation/inputs/app_textfields.dart';

class TokenWidget extends StatefulWidget {
  const TokenWidget({Key? key}) : super(key: key);

  @override
  State<TokenWidget> createState() => _TokenWidgetState();
}

class _TokenWidgetState extends State<TokenWidget> {
  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchBar(context),
        spacer(),
      ],
    );
  }
}

Widget _searchBar(BuildContext context) {
  final _sc = SizeConfig(context: context);
  return Row(
    children: [
      Flexible(
        child: AppTextFields(
          hintText: 'Search',
          prefix: const Icon(Icons.search),
          fillColor: AppColors.lightGray.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            gapPadding: 0,
          ),
        ),
      ),
      SizedBox(width: _sc.heightScaledSize(15)),
      InkWell(
        onTap: () {},
        child: Icon(
          Icons.swap_vert_outlined,
          color: AppColors.lightGray,
        ),
      ),
    ],
  );
}
