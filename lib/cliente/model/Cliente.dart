import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  Cliente({
    this.id,
    this.name,
    this.displayName,
    this.street,
    this.street2,
    this.city,
    this.email,
    this.phone,
    this.identificacion,
    this.tipoIdentificacion,
    this.tipo,
    // this.partnerLatitude,
    // this.partnerLongitude,
  });

  int? id;
  String? name;
  String? displayName;
  String? street;
  String? street2;
  String? email;
  String? phone;
  String? city;
  String? identificacion;
  String? tipoIdentificacion;
  String? tipo;

  // String? partnerLatitude;
  // String? partnerLongitude;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        name: json["name"],
        displayName: json["display_name"],
        street: json["street"],
        street2: json["street2"].toString(),
        city: json["city"].toString(),
        email: json["email"],
        phone: json["phone"],
        identificacion: json["identificacion"],
        tipoIdentificacion: json["tipo_identificacion"],
        tipo: json["tipo"],
        // partnerLatitude: json["partner_latitude"].toString(),
        // partnerLongitude: json["partner_longitude"].toString(),
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "name": name,
        "company_id": 1,
        "display_name": displayName,
        "street": street,
        "street2": street2,
        "zip": "010111",
        "city": city,
        "partner_latitude": 0.00,
        "partner_longitude": 0.00,
        "email": email,
        "phone": phone,
        "identificacion": identificacion,
        "tipo_identificacion": tipoIdentificacion,
        "tipo": tipo,
      };

  Map<String, dynamic> toJsonGraphql() => {
        "name": name,
        "display_name": displayName,
        "street": street,
        "street2": street2,
        "city": city,
        "email": email,
        "phone": phone,
        "identificacion": identificacion,
        "tipo_identificacion": tipoIdentificacion,
        "tipo": tipo,
      };

  setTipoIdentificacion(String tipo) {
    tipo == 'Cedula' ? this.tipoIdentificacion = 'cedula' : this.tipoIdentificacion = 'RUC';
  }

  String getTipoIdentificacion() {
    String ti;
    this.tipoIdentificacion == 'cedula' ? ti = 'Cedula' : ti = 'RUC';
    return ti;
  }
}
