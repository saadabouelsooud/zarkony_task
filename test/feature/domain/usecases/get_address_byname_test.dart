import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/domain/repositories/address_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zarkony_task/feature/domain/usecases/get_address_by_name.dart';

class MockAddressRepository extends Mock implements AddressRepository
{

}
void main()
{
  GetAddressByName? usecase;
  MockAddressRepository? mockAddressRepository;


  setUp((){
    mockAddressRepository = MockAddressRepository();
    usecase = GetAddressByName(mockAddressRepository!);
  });

  final addressName = "Home Address";
  final address = "Nozha, Gesr elswis, Cairo Egypt";
  final homeAddress = Address(addressName: addressName,address: address);


  test("get address by name", () async{
    // arrange
    when(mockAddressRepository!.getAddressByName(addressName)).
    thenAnswer((_) async => Right(homeAddress));

    // act
    // final result = await usecase!(addressName);
    // final result = await usecase!.call(addressName);
    final result = await usecase!(Params(addressName: addressName));

    // assert
    expect(result, Right(homeAddress));
    verify(mockAddressRepository!.getAddressByName("Office"));
    verifyNoMoreInteractions(mockAddressRepository);

  });
}