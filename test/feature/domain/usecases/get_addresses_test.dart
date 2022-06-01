import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/domain/repositories/address_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zarkony_task/feature/domain/usecases/get_addreses.dart';

class MockAddressRepository extends Mock implements AddressRepository
{

}
void main()
{
  GetAddresses? usecase;
  MockAddressRepository? mockAddressRepository;


  setUp((){
    mockAddressRepository = MockAddressRepository();
    usecase = GetAddresses(mockAddressRepository!);
  });

  final addressName = "Home Address";
  final address = "Nozha, Gesr elswis, Cairo Egypt";
  final homeAddress = Address(addressName: addressName,address: address);

  final addressName2 = "office Address";
  final address2 = "Heliopolis, Cairo Egypt";
  final officeAddress = Address(addressName: addressName2,address: address2);

  final addresses = [homeAddress,officeAddress];


  test("get addresses", () async{
    // arrange
    when(mockAddressRepository!.getAddresses()).
    thenAnswer((_) async => Right(addresses));

    // act
    // final result = await usecase!(addressName);
    // final result = await usecase!.call(addressName);
    final result = await usecase!(NoParams());

    // assert
    expect(result, Right(addresses));
    verify(mockAddressRepository!.getAddresses());
    verifyNoMoreInteractions(mockAddressRepository);

  });
}