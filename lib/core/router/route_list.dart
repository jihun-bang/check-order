enum RouteList {
  home('/'),
  landing('landing'),
  tableRegistration('/table-registration'),
  tablePassword('table-password');

  const RouteList(this.path);

  final String path;
}
