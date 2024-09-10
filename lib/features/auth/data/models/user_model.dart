import 'dart:convert';

import 'package:rinavent/core/common/entities/user.dart';


class UserModel extends User {
  UserModel( {required super.id, required super.email, required super.name, required super.updatedAt, required super.sex, required super.age, });
  
  
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'sex': sex,
      'age': age,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '' ,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      sex: map['sex'] ?? '',
      age: map['age'] ?? 0,
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
    String? sex,
    int? age,
     DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email, 
      sex: email ?? this.sex, 
      age: age ?? this.age, 
      updatedAt:updatedAt ?? this.updatedAt,
    );
  }
}
