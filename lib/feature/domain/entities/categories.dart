import 'package:equatable/equatable.dart';
class Category extends Equatable
{
  final String? name;
  final String? colorHex;


  Category({this.name,this.colorHex});

  @override
  // TODO: implement props
  List<Object?> get props => [name,colorHex];

}