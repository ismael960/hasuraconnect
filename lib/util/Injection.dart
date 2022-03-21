import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/controller/ClienteController.dart';
import 'package:hasuraconnect/cliente/data/ClienteServiceFirebase.dart';
import 'package:hasuraconnect/cliente/data/ClienteServiceGraphql.dart';
import 'package:hasuraconnect/cliente/repository/ClienteRepository.dart';
import 'package:hasuraconnect/util/GraphqlConfig.dart';

class Injection {
  static void init() {
    //Cliente graphql
    Get.lazyPut(() => GraphqlConfig());

    //Serviciodfgdf
    Get.lazyPut(() => ClienteServiceGraphql());
    //Get.lazyPut(() => ClienteServiceFirebase());

    //Repositorio
    Get.lazyPut(() => ClienteRepository());

    //Controlador
    Get.lazyPut(() => ClienteController());
  }
}
