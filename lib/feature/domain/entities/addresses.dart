import 'package:equatable/equatable.dart';
class Address extends Equatable
{
  final String? addressName;
  final String? address;


  Address({this.addressName,this.address});

  @override
  // TODO: implement props
  List<Object?> get props => [addressName,address];

}