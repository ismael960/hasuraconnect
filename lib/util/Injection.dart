
import 'package:get/get.dart';
import 'package:hasuraconnect/cliente/controller/ClienteController.dart';
import 'package:hasuraconnect/cliente/data/graphql/ClienteServiceGraphql.dart';
import 'package:hasuraconnect/cliente/repository/ClienteRepository.dart';
import 'package:hasuraconnect/util/GraphqlConfig.dart';

class Injection {
  static void init() {
    //Cliente
    Get.lazyPut(() => GraphqlConfig());

    //Servicios
    Get.lazyPut(() => ClienteServiceGraphql());

    //Repositorios
    Get.lazyPut(() => ClienteRepository());

    //Controladores Globales
    //Get.lazyPut(() => ClienteController());
  }
}
