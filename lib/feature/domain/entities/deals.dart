import 'package:equatable/equatable.dart';

class Deal extends Equatable
{
  final String? name;
  final String? pieces;
  final String? minutesAway;
  final int? originalPrice;
  final int? discountPrice;
  final bool? isFavourite;
  final String? colorHex;


  Deal({this.name, this.pieces,this.minutesAway,this.originalPrice,this.discountPrice,this.isFavourite,this.colorHex});

  @override
  // TODO: implement props
  List<Object?> get props => [name,pieces,minutesAway,originalPrice,discountPrice,isFavourite,colorHex];

}