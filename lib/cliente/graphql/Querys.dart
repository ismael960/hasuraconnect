class QuerysCliente{
  static String getPersonas = r""" 
    query getPersonas ($tipo: String) {
      res_partner(where: {tipo: {_eq: $tipo}}, limit: 10) {
        id
        name
        display_name
        street
        street2
        city
        email
        phone
        identificacion
        tipo_identificacion
        tipo
      }
    }
  """;
}