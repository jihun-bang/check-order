enum RouteList {
  landing('/'),
  tableRegistration('/table-registration'),
  home('/home');

  const RouteList(this.path);

  final String path;
}
