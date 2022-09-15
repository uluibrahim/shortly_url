import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';
import 'package:shortly_url/core/init/language/locale_keys.dart';

import '../../../core/constants/app/application_constants.dart';
import '../../../product/component/onboard_card.dart';
import '../viewmodel/on_board_viewmodel.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final TabController _tabController;
  late final OnBoardViewmodel _onBoardViewmodel;

  @override
  void initState() {
    super.initState();
    _onBoardViewmodel = OnBoardViewmodel();
    _pageController = PageController();
    _tabController = TabController(
        length: _onBoardViewmodel.onBoardModels.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _title,
            Expanded(child: _onboardList),
            TabPageSelector(controller: _tabController),
            _skipButton
          ],
        ),
      ),
    );
  }

  TextButton get _skipButton {
    return TextButton(
      onPressed: () {
        if (_tabController.length - 1 != _tabController.index) {
          _pageController.animateToPage(_tabController.index + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        }
      },
      child: Text(LocaleKeys.skip.tr()),
    );
  }

  PageView get _onboardList {
    return PageView.builder(
      onPageChanged: (value) {
        _tabController.index = value;
      },
      controller: _pageController,
      itemCount: _onBoardViewmodel.onBoardModels.length,
      itemBuilder: (context, index) {
        return Center(
          child: OnBoardCard(
            context: context,
            title: _onBoardViewmodel.onBoardModels[index].title,
            content: _onBoardViewmodel.onBoardModels[index].content,
            iconData: _onBoardViewmodel.onBoardModels[index].iconData,
          ),
        );
      },
    );
  }

  Text get _title {
    return Text(
      ApplicationConstants.appName,
      style: context.textTheme.headline3?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
