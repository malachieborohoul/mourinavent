import 'dart:convert';

import 'package:rinavent/core/common/entities/user.dart';


class UserModel extends User {
  UserModel( {required super.id, required super.email, required super.name, required super.updatedAt, required super.gender, required super.age, required super.phoneNumber, required super.countryCode, });
  
  
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'age': age,
      'phone_number': phoneNumber,
      'country_code': countryCode,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '' ,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      countryCode: map['country_code'] ?? '',
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
    String? gender,
    String? phoneNumber,
    String? countryCode,
    int? age,
     DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email, 
      gender: email ?? this.gender, 
      age: age ?? this.age, 
      phoneNumber: phoneNumber ?? this.phoneNumber, 
      countryCode: countryCode ?? this.countryCode, 
      updatedAt:updatedAt ?? this.updatedAt,
    );
  }
}
