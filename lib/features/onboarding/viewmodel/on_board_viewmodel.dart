import 'package:flutter/material.dart';
import 'package:shortly_url/features/onboarding/model/on_board_model.dart';

class OnBoardViewmodel {
  late final List<OnBoardModel> onBoardModels;
  OnBoardViewmodel() {
    _createOnBoardModelList;
  }

  get _createOnBoardModelList {
    onBoardModels = [
      OnBoardModel(
        content: "Paste the original link",
        title: "Paste",
        iconData: Icons.link_outlined,
      ),
      OnBoardModel(
        content: "Create new short link",
        title: "Create",
        iconData: Icons.link_outlined,
      ),
      OnBoardModel(
        content: "Copy and use the newly created link",
        title: "Coppy",
        iconData: Icons.link_outlined,
      ),
    ];
  }
}
