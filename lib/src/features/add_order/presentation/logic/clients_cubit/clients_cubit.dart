import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/clients_cubit/clients_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../../core/common/domain/entites/client_entity.dart';
import '../../../domain/use_cases/get_clients.dart';

class ClientsCubit extends Cubit<ClientsState> {
  final GetClients getClients;

  ClientsCubit({required this.getClients})
      : super(const ClientsState.initial());

  Future<void> tryGetClients() async {
    emit(const ClientsState.loading());

    final result = await getClients();

    result.fold(
      (ErrorModel error) => emit(ClientsState.error(error)),
      (List<ClientEntity> ordersList) => emit(
        ClientsState.successFetchingData(clientsList: ordersList),
      ),
    );
  }
}
