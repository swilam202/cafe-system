class Users {
  int? id;
  String? name;
  String? username;
  String? password;
  int? permissions;

  Users({
    this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.permissions,
  });
}
