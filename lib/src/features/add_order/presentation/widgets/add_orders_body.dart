import 'package:aljomaih_assessment/src/core/common/data/models/order_model/order_model.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/widgets/text_view.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/add_order_cubit/add_order_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/widgets/date_picker.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/widgets/products_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/data/models/client_model/client_model.dart';
import '../../../../core/common/widgets/button_view.dart';
import 'clients_picker_widget.dart';

class AddOrdersBody extends StatefulWidget {
  const AddOrdersBody({Key? key}) : super(key: key);

  @override
  State<AddOrdersBody> createState() => _AddOrdersBodyState();
}

class _AddOrdersBodyState extends State<AddOrdersBody> {
  ClientEntity? selectedClient;
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextView(
              text: 'Client',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            ClientPickerWidget(
              onChange: (ClientEntity clientEntity) {
                setState(() {
                  selectedClient = clientEntity;
                });
              },
              selectedClient: selectedClient,
            ),
            const SizedBox(
              height: 20,
            ),
            TextView(
              text: 'Order date',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            DatePicker(
              selectedDate ?? '',
              onSelectionChanged: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
                visible: selectedDate != null && selectedClient != null,
                child: ProductsList(
                  selectedData: selectedDate ?? '',
                  clientModel: ClientModel(
                    id: selectedClient?.id,
                    name: selectedClient?.name,
                    address: selectedClient?.address,
                    phone: selectedClient?.phone,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
