class User {
  final String id;
  final String name;
  final String email;
  final String password;
  String profileImagePath;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.profileImagePath = 'assets/default_profile.png', // Default value
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '', // Default to an empty string if null
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      profileImagePath: json['profile_image_path'] ?? 'assets/default_profile.png', // Default image if null
    );
  }
}
