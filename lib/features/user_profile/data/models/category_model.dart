import 'dart:convert';

import 'package:rinavent/core/common/entities/category.dart';


class CategoryModel extends Category {
  CategoryModel( {required super.id,  required super.title, required super.svgCode, });
  
  
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'svgCode': svgCode,
      
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '' ,
      title: map['title'] ?? '',
      svgCode: map['svg_code'] ?? '',
      
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CategoryModel copyWith({
    String? id,
    String? title,
    String? svgCode,

  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      svgCode: svgCode ?? this.svgCode, 

    );
  }
}
