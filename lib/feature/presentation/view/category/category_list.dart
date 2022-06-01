

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';
import 'package:zarkony_task/feature/presentation/view/category/category_item.dart';
import 'package:zarkony_task/feature/presentation/viewmodel/Category_viewmodel.dart';

class CategoriesHorizontalList extends StatelessWidget
{
  final _categoryProvider = categoryListVieModelStateNotifierProvider;

  Widget _buildCategoryListContainerWidget(final BuildContext context, final List<Category> categoryList) {
    return _buildCategoryListWidget(context, categoryList);
  }

  Widget _buildCategoryListWidget(BuildContext context, List<Category> categoryList) {
    if (categoryList.length == 0) {
      return const Center(child: Text('No Category'));
    }
    else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Explore by Category",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("See All (${categoryList.length})")
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 150,
              margin:
              const EdgeInsets.only(top: 4),
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 30);
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length ,
                  itemBuilder: (BuildContext context, int index) {
                    {
                      return CategoryListItem(categoryList.elementAt(index));
                    }
                  }),
            )
          ],
        ),
      );
    }
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }



  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      return watch(_categoryProvider).maybeWhen(
        success: (content) => _buildCategoryListContainerWidget(context, content),
        error: (_) => _buildErrorWidget(),
        orElse: () => const Expanded(child: Center(child: CircularProgressIndicator())),
      );
    });
  }


}
