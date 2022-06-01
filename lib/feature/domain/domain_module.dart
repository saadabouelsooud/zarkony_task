import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/feature/data/data_module.dart';
import 'package:zarkony_task/feature/domain/usecases/get_addreses.dart';
import 'package:zarkony_task/feature/domain/usecases/get_address_by_name.dart';
import 'package:zarkony_task/feature/domain/usecases/get_categories.dart';
import 'package:zarkony_task/feature/domain/usecases/get_deals.dart';
import 'package:zarkony_task/feature/domain/usecases/get_offers.dart';

final getAddressesProvider =
Provider<GetAddresses>((ref) => GetAddresses(ref.watch(addressRepositoryProvider)));

final getCategoryProvider =
Provider<GetCategories>((ref) => GetCategories(ref.watch(categoryRepositoryProvider)));

final getDealProvider =
Provider<GetDeals>((ref) => GetDeals(ref.watch(dealRepositoryProvider)));

final getOfferProvider =
Provider<GetOffers>((ref) => GetOffers(ref.watch(offerRepositoryProvider)));
