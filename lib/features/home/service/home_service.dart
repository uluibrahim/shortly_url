import 'package:shortly_url/core/init/network/network_manager.dart';
import 'package:shortly_url/features/home/model/shorted_model.dart';
import 'package:shortly_url/product/enum/service_paths.dart';

import 'i_home_service.dart';

class HomeService extends IHomeService {
  static HomeService? _instance;
  static get instance => _instance ??= HomeService._init();
  HomeService._init();

  @override
  Future shortenLink(String originalLink) async {
    NetworkManager.instance?.dioGet(
      ServicePaths.shorten.path,
      queryParameters: {"url": originalLink},
      model: ShortedModel(),
    );
  }
}
