import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shortly_url/core/component/button/custom_elevated_button.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';
import 'package:shortly_url/core/init/language/locale_keys.dart';
import 'package:shortly_url/features/home/viewmodel/home_viewmodel.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../product/enum/assets_enum.dart';
import '../../../product/mixin/validation_mixin.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<HomeViewmodel>(context, listen: false);
        return Scaffold(
          appBar: AppBar(
            title: viewmodel.shortedLinkList?.isNotEmpty ?? false
                ? Text(
                    LocaleKeys.yourLinkHistory.tr(),
                    style: context.textTheme.titleLarge,
                  )
                : Text(
                    ApplicationConstants.appName,
                    style: context.textTheme.headline3
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 73,
                child: _started,
              ),
              Expanded(
                flex: 27,
                child: _formAndShortenButton(viewmodel),
              ),
            ],
          ),
        );
      },
    );
  }

  Column get _started {
    return Column(
      children: [
        SvgPicture.asset(AssetsEnum.illustration.toSvg()),
        Text(
          LocaleKeys.letsGetStarted.tr(),
          style: context.textTheme.headline5
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 36),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          LocaleKeys.pasteYourFirstLink.tr(),
          style: context.textTheme.headline6
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _formAndShortenButton(HomeViewmodel viewmodel) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Container(
            width: context.width,
            decoration: BoxDecoration(
              color: Colors.indigo.shade900,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: context.width * 0.6,
              height: (context.height * 0.27) / 1.7,
              decoration: BoxDecoration(
                color: Colors.indigo.shade300,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(150)),
              ),
            ),
          ),
          SizedBox(
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: context.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: (value) => validateNullCheck(value),
                    controller: _textEditingController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: context.paddingLow,
                        hintText: LocaleKeys.shortenALinkHere.tr()),
                  ),
                ),
                CustomElevatedButton(
                  ontap: () async {
                    await _shortenOperation(viewmodel);
                  },
                  text: LocaleKeys.shortenIt.tr(),
                  context: context,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _shortenOperation(HomeViewmodel viewmodel) async {
    viewmodel.autovalidateMode = AutovalidateMode.always;
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      viewmodel.autovalidateMode = AutovalidateMode.disabled;
      // await viewmodel.shortenLink(_textEditingController.text);
    }
  }
}
