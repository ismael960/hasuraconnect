import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/model/Cliente.dart';
import 'package:hasuraconnect/cliente/repository/ClienteRepository.dart';
import 'package:hasuraconnect/cliente/ui/widgets/DialogWidget.dart';

class ClienteController extends GetxController {
  List<String> tiposIdentificacion = ['Seleccionar', 'RUC', 'Cedula'];
  bool _loading = true;

  bool get loading => _loading;

  List<Cliente> clientes = [];

  //dependencia
  ClienteRepository _clienteRepository = Get.find<ClienteRepository>();

  //form
  final formKeyCliente = GlobalKey<FormState>();

  init() async {
    this.clientes = (await _clienteRepository.getClientes())!;
    _loading = false;
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  insertCliente(Cliente cliente) async {
    cliente.displayName = cliente.name;
    cliente.tipoIdentificacion = 'cedula';
    cliente.tipo = 'cliente';
    if ((await _clienteRepository.insertCliente(cliente))! > 0) {
      this.clientes.add(cliente);
      update();
      Get.back();
      mostrarDialogDobleWidget(Get.context!, 'Creado con exito');
    } else {
      mostrarDialogSimpleWidget(Get.context!, "Vuelve a intentar mas tarde");
    }
  }

  updateCliente(Cliente cliente) async {
    if ((await _clienteRepository.updateCliente(cliente))! > 0) {
      this.clientes.forEach((element) {
        if (element.identificacion == cliente.identificacion) {
          element = cliente;
        }
      });
      update();
      Get.back();
      mostrarDialogDobleWidget(Get.context!, 'Actualizado con exito');
    } else {
      mostrarDialogSimpleWidget(Get.context!, "Vuelve a intentar mas tarde");
    }
  }

  eliminarCliente(String identificacion) async {
    if ((await _clienteRepository.eliminarCliente(identificacion))! > 0) {
      this
          .clientes
          .removeWhere((element) => element.identificacion == identificacion);
      update();
      Get.back();
      mostrarDialogDobleWidget(Get.context!, 'Eliminado con exito');
    } else {
      mostrarDialogSimpleWidget(Get.context!, "Vuelve a intentar mas tarde");
    }
  }
}
