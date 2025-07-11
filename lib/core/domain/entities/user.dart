class User {
  final String id;
  final String name;
  final String email;
  final String gender;
  final int age;
  final String phoneNumber;
  final String countryCode;
  final String avatar;
  final DateTime updatedAt;

  User( {
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.countryCode,
    required this.avatar,
    required this.updatedAt,
  });
}
