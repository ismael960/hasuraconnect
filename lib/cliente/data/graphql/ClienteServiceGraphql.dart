import 'dart:developer';

import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasuraconnect/cliente/graphql/Mutations.dart';
import 'package:hasuraconnect/cliente/graphql/Querys.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';
import 'package:hasuraconnect/util/GraphqlConfig.dart';

class ClienteServiceGraphql {
  HasuraConnect _client = Get.find<GraphqlConfig>().clientToQuery();

  Future<int?> insertCliente(Cliente cliente) async {
    try {
      var result =
          await _client.mutation(MutationsCliente.insertPersona, variables: {
        'object': cliente.toJsonGraphql(),
      });
      return result['data']['insert_res_partner_one']['id'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<int?> updateCliente(Cliente cliente) async {
    try {
      var result =
          await _client.mutation(MutationsCliente.updatePersona, variables: {
        'identificacion': cliente.identificacion,
        'object': cliente.toJsonGraphql(),
      });
      return result['data']['update_res_partner']['affected_rows'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<Cliente>?> getClientes() async {
    try {
      var result = await _client
          .query(QuerysCliente.getPersonas, variables: {'tipo': "cliente"});
      final List response = result['data']['res_partner'];
      log("$response");
      List<Cliente> clientes = [];
      for (var i = 0; i < response.length; i++) {
        clientes.add(Cliente.fromJson(response[i] as Map<String, dynamic>));
      }
      return clientes;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<int?> eliminarCliente(String identificacion) async {
    try {
      var result = await _client.mutation(MutationsCliente.eliminarPersona,
          variables: {'identificacion': identificacion});
      return result['data']['delete_res_partner']['affected_rows'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
