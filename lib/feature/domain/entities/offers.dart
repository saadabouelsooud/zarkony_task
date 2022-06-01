import 'package:equatable/equatable.dart';

class Offer extends Equatable
{
  final String? name;
  final String? availableUntil;
  final double? originalPrice;
  final double? discountPrice;


  Offer({this.name, this.availableUntil,this.originalPrice,this.discountPrice});

  @override
  // TODO: implement props
  List<Object?> get props => [name,availableUntil,originalPrice,discountPrice];

}