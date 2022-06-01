


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/domain_module.dart';
import 'package:zarkony_task/feature/domain/entities/offers.dart';
import 'package:zarkony_task/feature/domain/usecases/get_offers.dart';
import 'package:zarkony_task/feature/presentation/state/state.dart';

final offerListVieModelStateNotifierProvider =
StateNotifierProvider.autoDispose<OfferListViewModel, State<List<Offer>>>((ref) {
  return OfferListViewModel(
    ref.watch(getOfferProvider),
  );
});

class OfferListViewModel extends StateNotifier<State<List<Offer>>>
{
  final GetOffers _getOffers;

  OfferListViewModel(
      this._getOffers,
      ) : super(const State.init()) {
    _getOfferList();
  }

  _getOfferList() async {
    state = const State.loading();
    final offerList = await _getOffers(NoParams());
    offerList.fold(
            (failure) => state = State.error(mapFailureToException(failure)),
            (list) => state = State.success(list)
    );
  }

  Offer getOfferByName(String name)
  {
    return state.data!.where((element) => element.name == name).first;
  }

}