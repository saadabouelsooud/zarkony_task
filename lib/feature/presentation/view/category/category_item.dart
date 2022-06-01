

import 'package:flutter/material.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';

class CategoryListItem extends StatelessWidget
{
  final Category category;
  CategoryListItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(int.parse(category.colorHex!)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: 100,
          child: Text(
            category.name!,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold,color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

}