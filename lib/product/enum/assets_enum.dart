enum AssetsEnum {
  illustration("illustration");

  String toPng() => 'assets/images/$name.png';
  String toJpg() => 'assets/images/$name.jpg';
  String toGif() => 'assets/gif/$name.gif';
  String toSvg() => 'assets/svg/$name.svg';

  final String name;
  const AssetsEnum(this.name);
}
