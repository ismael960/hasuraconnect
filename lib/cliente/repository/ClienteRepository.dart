import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/data/ClienteServiceFirebase.dart';
import 'package:hasuraconnect/cliente/data/ClienteServiceGraphql.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';

class ClienteRepository {
  ClienteServiceGraphql _clienteServiceGraphql =
      Get.find<ClienteServiceGraphql>();

  Future<int?> insertCliente(Cliente cliente) async {
     await _clienteServiceGraphql.insertCliente(cliente);
  }

  Future<int?> updateCliente(Cliente cliente) async {
    return await _clienteServiceGraphql.updateCliente(cliente);
  }

  Future<List<Cliente>?> getClientes() async {
    return await _clienteServiceGraphql.getClientes();
  }

  Future<int?> eliminarCliente(String identificacion) async {
    return await _clienteServiceGraphql.eliminarCliente(identificacion);
  }
}
