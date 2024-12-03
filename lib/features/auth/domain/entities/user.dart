class User {
  String? id;
  String? name;
  String? password;
  String email;
  bool verified;

  User(
      {this.id,
      this.name,
      this.password,
      required this.email,
      this.verified = false});
}
