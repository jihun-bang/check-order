enum RouteList {
  home('/'),
  landing('/landing'),
  signIn('/sign-in'),
  tableRegistration('/table-registration'),
  tablePassword('/table-password'),
  admin('/admin');

  const RouteList(this.path);

  final String path;
}
