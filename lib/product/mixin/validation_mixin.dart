mixin ValidationMixin {
  String? validateNullCheck(String? value) =>
      (value != null && value.isNotEmpty) ? null : "Please add a linkk here";
}
