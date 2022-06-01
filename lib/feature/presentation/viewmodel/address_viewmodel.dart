import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/domain_module.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/domain/usecases/get_addreses.dart';
import 'package:zarkony_task/feature/presentation/state/state.dart';


final addressListVieModelStateNotifierProvider =
StateNotifierProvider.autoDispose<AddressListViewModel, State<List<Address>>>((ref) {
  return AddressListViewModel(
    ref.watch(getAddressesProvider),
  );
});

class AddressListViewModel extends StateNotifier<State<List<Address>>>
{
  final GetAddresses _getAddresses;

  AddressListViewModel(
      this._getAddresses,
      ) : super(const State.init()) {
    _getAddressList();
  }

  _getAddressList() async {
      state = const State.loading();
      final addressList = await _getAddresses(NoParams());
      addressList.fold(
              (failure) => state = State.error(mapFailureToException(failure)),
              (list) => state = State.success(list)
      );
  }

  Address getAddressByName(String name)
  {
    return state.data!.where((element) => element.addressName == name).first;
  }

}