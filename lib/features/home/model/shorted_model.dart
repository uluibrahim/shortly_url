import 'package:shortly_url/core/base/base_model.dart';

class ShortedModel extends BaseModel {
  ShortedModel({
    this.ok,
    this.result,
  });

  bool? ok;
  Result? result;
  @override
  fromJson(Map<String, dynamic> json) => ShortedModel(
        ok: json["ok"],
        result: Result.fromJson(json["result"]),
      );

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

class Result {
  Result({
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.originalLink,
    this.isCopied,
  });

  String? shortLink;
  String? fullShortLink;
  String? shortLink2;
  String? fullShortLink2;
  String? originalLink;
  bool? isCopied;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        shortLink: json["short_link"],
        fullShortLink: json["full_short_link"],
        shortLink2: json["short_link2"],
        fullShortLink2: json["full_short_link2"],
        originalLink: json["original_link"],
        isCopied: false,
      );
}
