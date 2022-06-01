


import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/core/network/network_info.dart';
import 'package:zarkony_task/feature/data/datasources/address/address_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/address/address_remote_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/category/category_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/category/category_remote_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/deal/deal_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/deal/deal_remote_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/offer/offer_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/offer/offer_remote_data_source.dart';
import 'package:zarkony_task/feature/data/repositories/address_repository_impl.dart';
import 'package:zarkony_task/feature/data/repositories/category_repository_impl.dart';
import 'package:zarkony_task/feature/data/repositories/deal_repository_impl.dart';
import 'package:zarkony_task/feature/data/repositories/offers_repository_impl.dart';
import 'package:zarkony_task/feature/domain/repositories/address_repository.dart';
import 'package:zarkony_task/feature/domain/repositories/category_repository.dart';
import 'package:zarkony_task/feature/domain/repositories/deal_repository.dart';
import 'package:zarkony_task/feature/domain/repositories/offer_repository.dart';


final addressLocalDataSourceProvider = Provider<AddressLocalDataSource>((_) => AddressLocalDataSourceImpl());
final addressRemoteDataSourceProvider = Provider<AddressRemoteDataSource>((_) => AddressRemoteDataSourceImpl());

final categoryLocalDataSourceProvider = Provider<CategoryLocalDataSource>((_) => CategoryLocalDataSourceImpl());
final categoryRemoteDataSourceProvider = Provider<CategoryRemoteDataSource>((_) => CategoryRemoteDataSourceImpl());

final dealLocalDataSourceProvider = Provider<DealLocalDataSource>((_) => DealLocalDataSourceImpl());
final dealRemoteDataSourceProvider = Provider<DealRemoteDataSource>((_) => DealRemoteDataSourceImpl());


final offerLocalDataSourceProvider = Provider<OfferLocalDataSource>((_) => OfferLocalDataSourceImpl());
final offerRemoteDataSourceProvider = Provider<OfferRemoteDataSource>((_) => OfferRemoteDataSourceImpl());

final networkInfoProvider = Provider<NetworkInfo>((_) => NetworkInfoImpl(DataConnectionChecker()));

final addressRepositoryProvider =
Provider<AddressRepository>((ref) => AddressRepositoryImpl(remoteDataSource: ref.watch(addressRemoteDataSourceProvider),localDataSource: ref.watch(addressLocalDataSourceProvider),networkInfo: ref.watch(networkInfoProvider)));

final categoryRepositoryProvider =
Provider<CategoryRepository>((ref) => CategoryRepositoryImpl(remoteDataSource: ref.watch(categoryRemoteDataSourceProvider),localDataSource: ref.watch(categoryLocalDataSourceProvider),networkInfo: ref.watch(networkInfoProvider)));

final dealRepositoryProvider =
Provider<DealRepository>((ref) => DealRepositoryImpl(remoteDataSource: ref.watch(dealRemoteDataSourceProvider),localDataSource: ref.watch(dealLocalDataSourceProvider),networkInfo: ref.watch(networkInfoProvider)));

final offerRepositoryProvider =
Provider<OfferRepository>((ref) => OfferRepositoryImpl(remoteDataSource: ref.watch(offerRemoteDataSourceProvider),localDataSource: ref.watch(offerLocalDataSourceProvider),networkInfo: ref.watch(networkInfoProvider)));
