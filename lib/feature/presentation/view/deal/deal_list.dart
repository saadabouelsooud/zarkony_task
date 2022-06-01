

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';
import 'package:zarkony_task/feature/presentation/view/deal/deal_item.dart';
import 'package:zarkony_task/feature/presentation/viewmodel/deal_viewmodel.dart';


class DealHorizontalList extends StatelessWidget
{
  final _dealProvider = dealListVieModelStateNotifierProvider;

  Widget _buildDealListContainerWidget(final BuildContext context, final List<Deal> dealList) {
    return _buildDealListWidget(context, dealList);
  }

  Widget _buildDealListWidget(final BuildContext context, final List<Deal> dealList) {
    if (dealList.length == 0) {
      return const Center(child: Text('No Deal'));
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Deals of the day",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(),
            Container(
              height: 150,
              margin:
              const EdgeInsets.only(top: 4),
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20);
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2 ,
                  itemBuilder: (BuildContext context, int index) {
                    {
                      return DealListItem(dealList.elementAt(index));
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
    return Consumer(
        builder: (context, watch, _) {
          return watch(_dealProvider).maybeWhen(
            success: (content) => _buildDealListContainerWidget(context, content),
            error: (_) => _buildErrorWidget(),
            orElse: () => const Expanded(child: Center(child: CircularProgressIndicator())),
          );
        }
    );
  }

}