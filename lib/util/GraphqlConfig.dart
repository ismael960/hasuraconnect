import 'package:hasura_connect/hasura_connect.dart';

class GraphqlConfig{

  static String servidor = 'https://dev.ups.edu.ec/hasura/v1/graphql';
  static String socket = 'ws://dev.ups.edu.ec/hasura/v1/graphql';

  HasuraConnect clientToQuery() {
    return HasuraConnect(servidor, headers: {
      'content-type': 'application/json',
      'x-hasura-admin-secret': 'Pedir el secret para probar',
      //'Authorization': 'Bearer Tz4VYgurHpF.G1O25xpZuK5vN13WCra_GuSw98mqe49JeNT8vLJlck8910cZ-RcC'
    });
  }

}