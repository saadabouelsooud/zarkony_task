

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/domain_module.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';
import 'package:zarkony_task/feature/domain/usecases/get_deals.dart';
import 'package:zarkony_task/feature/domain/usecases/update_deal.dart';
import 'package:zarkony_task/feature/presentation/state/state.dart';

final dealListVieModelStateNotifierProvider =
StateNotifierProvider.autoDispose<DealListViewModel, State<List<Deal>>>((ref) {
  return DealListViewModel(
    ref.watch(getDealProvider),
  );
});

class DealListViewModel extends StateNotifier<State<List<Deal>>>
{
  final GetDeals _getDeales;

  DealListViewModel(
      this._getDeales,
      ) : super(const State.init()) {
    _getDealList();
  }

  _getDealList() async {
    state = const State.loading();
    final dealList = await _getDeales(NoParams());
    dealList.fold(
            (failure) => state = State.error(mapFailureToException(failure)),
            (list) => state = State.success(list)
    );
  }

  Deal getDealByName(String name)
  {
    return state.data!.where((element) => element.name == name).first;
  }

  // updateDeal(final Deal newDeal) async {
  //   try {
  //     await _updateTodoUseCase.execute(
  //       newTodo.id,
  //       newTodo.title,
  //       newTodo.description,
  //       newTodo.isCompleted,
  //       newTodo.dueDate,
  //     );
  //     state = State.success(state.data!.updateTodo(newTodo));
  //   } on Exception catch (e) {
  //     state = State.error(e);
  //   }
  // }

}