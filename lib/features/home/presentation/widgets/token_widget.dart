import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';
import 'package:ge_wallet/core/presentation/app_circular_image.dart';
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
        _buildTokenList(context),
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

Widget _buildTokenList(BuildContext context) {
  final _sc = SizeConfig(context: context);

  Widget spacer() => SizedBox(height: _sc.heightScaledSize(10));

  return Column(
    children: [
      _tokentile(
        context: context,
        title: 'Waves',
        amount: '5.004',
        backgroundColor: Colors.white,
        logo: Icon(
          Icons.diamond_outlined,
          color: AppColors.strongBlue,
        ),
      ),
      spacer(),
      _tokentile(
        context: context,
        title: 'Pigeon',
        amount: '144235.004',
        backgroundColor: AppColors.mediumDarkGray,
        logo: Text(
          'P',
          style: _sc.h6Theme.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      spacer(),
      _tokentile(
        context: context,
        title: 'US Dollar',
        amount: '395.004',
        backgroundColor: Colors.green,
        logo: const Icon(
          Icons.attach_money_outlined,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget _tokentile({
  required BuildContext context,
  required String title,
  required String amount,
  required Color backgroundColor,
  required Widget logo,
}) {
  final _sc = SizeConfig(context: context);

  return Card(
    elevation: 2,
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: _sc.heightScaledSize(8)),
      minVerticalPadding: 0,
      leading: AppCircularImage(
        imageUrl: '',
        imageType: ImageType.networkImage,
        radius: 20,
        backgroundColor: backgroundColor,
        fallbackWidget: logo,
        floaterWidget: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(_sc.heightScaledSize(1)),
          child: Icon(
            Icons.code,
            color: Colors.black,
            size: _sc.heightScaledSize(16),
            // size:,
          ),
        ),
      ),
      title: AutoSizeText(
        '$title',
        style: _sc.body1Theme.copyWith(
          color: AppColors.mediumLightGray,
        ),
      ),
      subtitle: AutoSizeText(
        '$amount',
        style: _sc.h6Theme.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
