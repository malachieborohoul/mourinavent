



class Auth0IdToken {
  final String nickname;
  final String name;
  final String email;
  final String picture;
  final String updatedAt;
  final String iss;
  final String sub;
  final String aud;
  final int iat;
  final int exp;
  final int? authTime;

  Auth0IdToken(
      {required this.nickname,
      required this.name,
      required this.email,
      required this.picture,
      required this.updatedAt,
      required this.iss,
      required this.sub,
      required this.aud,
      required this.iat,
      required this.exp,
      required this.authTime});

  
}
