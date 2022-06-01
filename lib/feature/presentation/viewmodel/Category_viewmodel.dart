
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/domain_module.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';
import 'package:zarkony_task/feature/domain/usecases/get_categories.dart';
import 'package:zarkony_task/feature/presentation/state/state.dart';

final categoryListVieModelStateNotifierProvider =
StateNotifierProvider.autoDispose<CategoryListViewModel, State<List<Category>>>((ref) {
  return CategoryListViewModel(
    ref.watch(getCategoryProvider),
  );
});

class CategoryListViewModel extends StateNotifier<State<List<Category>>>
{
  final GetCategories _getCategories;

  CategoryListViewModel(
      this._getCategories,
      ) : super(const State.init()) {
    _getCategoryList();
  }

  _getCategoryList() async {
    state = const State.loading();
    final addressList = await _getCategories(NoParams());
    addressList.fold(
            (failure) => state = State.error(mapFailureToException(failure)),
            (list) => state = State.success(list)
    );
  }

  Category getCategoryByName(String name)
  {
    return state.data!.where((element) => element.name == name).first;
  }


}