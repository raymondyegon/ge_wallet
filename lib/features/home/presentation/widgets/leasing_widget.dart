import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_wallet/core/platform/app_colors.dart';
import 'package:ge_wallet/core/platform/size_config.dart';
import 'package:ge_wallet/core/presentation/app_button.dart';

class LeasingWidget extends StatelessWidget {
  const LeasingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leaseHeader(context),
        spacer(),
        Card(
          margin: EdgeInsets.zero,
          child: ListTile(
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            title: AutoSizeText(
              'View history',
              style: _sc.h6Theme.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: _sc.size15HeightScaled,
            ),
          ),
        ),
        spacer(),
        _otherLeases(
          context: context,
          title: 'Active now (2)',
        ),
      ],
    );
  }
}

Widget _leaseHeader(BuildContext context) {
  final _sc = SizeConfig(context: context);

  Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

  return Card(
    elevation: 2,
    margin: EdgeInsets.zero,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(_sc.heightScaledSize(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spacer(),
          AutoSizeText(
            'Available Balance',
            style: _sc.body1Theme.copyWith(
              color: AppColors.lightGray,
            ),
          ),
          AutoSizeText(
            '105.005',
            style: _sc.h6Theme.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          spacer(),
          _progressBar(context),
          spacer(),
          spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                '1 435.0223',
                style: _sc.body1Theme.copyWith(
                    // color: AppColors.lightGray,
                    ),
              ),
              const Spacer(),
              AutoSizeText(
                'Leased ',
                style: _sc.body1Theme.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              Icon(
                Icons.circle,
                size: _sc.heightScaledSize(10),
                color: AppColors.strongBlue,
              ),
            ],
          ),
          Divider(
            thickness: 0.8,
            color: AppColors.lightGray,
          ),
          spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                '1 540.0223',
                style: _sc.body1Theme.copyWith(
                    // color: AppColors.lightGray,
                    ),
              ),
              const Spacer(),
              AutoSizeText(
                'Total ',
                style: _sc.body1Theme.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              Icon(
                Icons.circle,
                size: _sc.heightScaledSize(10),
                color: AppColors.lightGray,
              ),
            ],
          ),
          Divider(
            thickness: 0.8,
            color: AppColors.lightGray,
          ),
          spacer(),
          AppButton(
            onTap: () {},
            width: double.infinity,
            label: 'Start Lease',
            fontColor: AppColors.strongBlue,
            isDisabled: false,
            color: AppColors.strongBlue.withOpacity(0.2),
          ),
          spacer(),
        ],
      ),
    ),
  );
}

Widget _progressBar(BuildContext context) {
  final _sc = SizeConfig(context: context);

  return Container(
    height: _sc.heightScaledSize(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    width: _sc.screenWidth,
    child: Stack(
      children: [
        Container(
          width: _sc.screenWidth,
          decoration: BoxDecoration(
            color: AppColors.strongBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Container(
          width: _sc.screenWidth * 0.7,
          decoration: BoxDecoration(
            color: AppColors.strongBlue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    ),
  );
}

Widget _otherLeases({
  required BuildContext context,
  required String title,
}) {
  final _sc = SizeConfig(context: context);

  return Theme(
    data: Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    ),
    child: ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      collapsedIconColor: AppColors.mediumLightGray,
      iconColor: AppColors.mediumLightGray,
      title: AutoSizeText(
        '$title',
        style: _sc.body1Theme.copyWith(
          color: AppColors.mediumLightGray,
        ),
      ),
    ),
  );
}
