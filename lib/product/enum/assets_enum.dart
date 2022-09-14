enum AssetsEnum {
  example("example");

  String toPng() => 'assets/images/$name.png';
  String toJpg() => 'assets/images/$name.jpg';
  String toGif() => 'assets/gif/$name.gif';

  final String name;
  const AssetsEnum(this.name);
}
