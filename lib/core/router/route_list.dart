enum RouteList {
  home('/'),
  landing('landing'),
  tableRegistration('/table-registration'),
  tablePassword('table-password'),
  admin('admin');

  const RouteList(this.path);

  final String path;
}
