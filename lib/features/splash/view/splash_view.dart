import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortly_url/core/constants/app/application_constants.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';
import 'package:shortly_url/core/init/language/locale_keys.dart';
import 'package:shortly_url/product/enum/assets_enum.dart';

import '../../../core/component/button/custom_elevated_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ApplicationConstants.appName,
                style: context.textTheme.headline3
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(AssetsEnum.illustration.toSvg()),
              Text(
                LocaleKeys.moreThanJustShorterLinks.tr(),
                style: context.textTheme.headline5
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 36),
                textAlign: TextAlign.center,
              ),
              Text(
                LocaleKeys.makeLinks.tr(),
                style: context.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              CustomElevatedButton(
                text: LocaleKeys.start.tr(),
                context: context,
                ontap: () {
                  // context.router.navigate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
