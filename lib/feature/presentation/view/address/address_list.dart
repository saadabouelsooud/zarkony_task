

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/presentation/view/address/address_item.dart';
import 'package:zarkony_task/feature/presentation/viewmodel/address_viewmodel.dart';

class AddressHorizontalList extends StatelessWidget
{
  final _addressProvider = addressListVieModelStateNotifierProvider;

  Widget _buildAddressListContainerWidget(final BuildContext context, final List<Address> addressList) {
    return _buildAddressListWidget(context, addressList);
  }

  Widget _buildAddressListWidget(final BuildContext context, final List<Address> addressList) {
    if (addressList.length == 0) {
      return const Center(child: Text('No Address'));
    } else {
      return SafeArea(child: SizedBox(
        width: double.infinity,
        height: 120,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemCount: addressList.length,
            itemBuilder: (BuildContext ctx, index) {
              return AddressItem(addressList.elementAt(index));
            }),
      ));
    }
  }
  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, watch, _) {
          return watch(_addressProvider).maybeWhen(
            success: (content) => _buildAddressListContainerWidget(context, content),
            error: (_) => _buildErrorWidget(),
            orElse: () => const Expanded(child: Center(child: CircularProgressIndicator())),
          );
        }
    );
  }

}