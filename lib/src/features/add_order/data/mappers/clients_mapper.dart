import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';

import '../models/clients_response_model.dart';


class  ClientsMapper  {
  final List<ClientsResponseModel>?  clientsList;

  ClientsMapper({this.clientsList});
  List<ClientEntity> toListClientsEntity(){
    final List<ClientEntity> clientsEntity =
    List<ClientEntity>.generate(
        clientsList?.length ?? 0 ,
            (int index) {
          final ClientsResponseModel? item =
          clientsList?[index];
          return ClientEntity(
            id: item?.id,
            name: item?.name,
            address: item?.address,
            phone: item?.phone,
          );
        });

    return clientsEntity;
  }



}