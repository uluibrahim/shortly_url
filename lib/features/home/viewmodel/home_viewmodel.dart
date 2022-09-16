import 'package:flutter/material.dart';
import 'package:shortly_url/features/home/service/home_service.dart';

import '../../../product/enum/view_state.dart';
import '../model/shorted_model.dart';

class HomeViewmodel with ChangeNotifier implements HomeService {
  final HomeService _service = HomeService.instance;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode get autovalidateMode => _autovalidateMode;
  set autovalidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }


  List<ShortedModel>? shortedLinkList;

  _addLink(ShortedModel value) {
    shortedLinkList ??= [];
    shortedLinkList!.add(value);
  }

  removeLink(int index) {
    shortedLinkList!.removeAt(index);
  }

  coppyLink() {}

  @override
  Future shortenLink(String originalLink) async {
    try {
      state = ViewState.busy;
      ShortedModel? model = await _service.shortenLink(originalLink);
      if (model != null) {
        _addLink(model);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = ViewState.idle;
    }
  }
}
