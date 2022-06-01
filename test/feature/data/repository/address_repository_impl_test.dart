
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zarkony_task/core/network/network_info.dart';
import 'package:zarkony_task/feature/data/datasources/address/address_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/address/address_remote_data_source.dart';
import 'package:zarkony_task/feature/data/models/address_model.dart';
import 'package:zarkony_task/feature/data/repositories/address_repository_impl.dart';

class MockRemoteDataSource extends Mock implements AddressRemoteDataSource{}

class MockLocalDataSource extends Mock implements AddressLocalDataSource{}

class MockNetworkInfo extends Mock implements NetworkInfo{}


void main()
{
  AddressRepositoryImpl? repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo? mockNetworkInfo;


  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AddressRepositoryImpl(remoteDataSource: mockRemoteDataSource, localDataSource: mockLocalDataSource,networkInfo: mockNetworkInfo);
  });

  group("get address", (){
    final addressName = "Home Address";
    final address = "Nozha, Gesr elswis, Cairo Egypt";
    final homeAddress = AddressModel(addressName: addressName,address: address);

    test("should check if the device is online", () async {
      // arrange
      when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);

      // act
      repository!.getAddressByName(addressName);

      // assert
      verify(mockNetworkInfo!.isConnected);
    });

  });

}