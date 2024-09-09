import 'dart:convert';

import 'package:rinavent/core/common/entities/user.dart';


class UserModel extends User {
  UserModel( {required super.id, required super.email, required super.name, required super.updatedAt, });
  
  
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '' ,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
     DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email, 
      updatedAt:updatedAt ?? this.updatedAt,
    );
  }
}
