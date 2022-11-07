import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/clients_cubit/clients_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/clients_cubit/clients_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/common/domain/entites/client_entity.dart';
import '../../../../core/common/widgets/drop_down_form_view.dart';
import '../../../../core/common/widgets/error_view.dart';
import '../../../../core/common/widgets/loading_view.dart';

class ClientPickerWidget extends StatelessWidget {
  final Function onChange;
  final ClientEntity?  selectedClient;

  const ClientPickerWidget({
    Key? key,
    required this.onChange,
     this.selectedClient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        return state.when(
          successFetchingData: (List<ClientEntity>? clientsList) {
            return DropDownFormView<ClientEntity>(
              errorMessage: "Choose_client".tr(),
              getLabel: (ClientEntity? type) => type?.name ?? "",
              options: clientsList,
              value: selectedClient,
              onChanged: (ClientEntity? clientEntity) {
                onChange(clientEntity);
              },
              onSaved: (ClientEntity? clientEntity) {},
            );
          },
          initial: () => const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(),
          ),
          loading: () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: LoadingView(
                loadingSize: 40,
              ),
            ),
          ),
          error: (ErrorModel? errorModel) => ErrorView(
            error: errorModel?.error?.message ?? "",
            onRefresh: () {
              BlocProvider.of<ClientsCubit>(context).tryGetClients();
            },
          ),
        );
      },
    );
  }
}
