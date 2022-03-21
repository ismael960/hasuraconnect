class MutationsCliente {
  static String insertPersona = r"""
    mutation insertPersona ($object: res_partner_insert_input!){
      insert_res_partner_one(object: $object){
        id
      }
    }
  """;

  static String updatePersona = r"""
    mutation updatePersona($identificacion: String, $object: res_partner_set_input) {
      update_res_partner(where: {identificacion: {_eq: $identificacion}}, _set: $object) {
        affected_rows
      }
    }
  """;

  static String eliminarPersona = r"""
    mutation eliminarCliente($identificacion: String) {
      delete_res_partner(where: {identificacion: {_eq: $identificacion}}) {
        affected_rows
      }
    }
  """;
}
