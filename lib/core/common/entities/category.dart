// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String title;
  final String svgCode;
  const Category({
    required this.id,
    required this.title,
    required this.svgCode,
  });
  
  @override
  List<Object?> get props => [id, title, svgCode];

}
