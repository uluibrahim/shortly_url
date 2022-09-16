enum ServicePaths {
  shorten("/shorten"),
  base("https://api.shrtco.de/v2");

  final String path;
  const ServicePaths(this.path);
}
