import 'dart:convert';

class OptionResponseModel {
  int? cod_productopadre;
  int? cod_producto;
  String? nom_producto;
  String? ico_producto;

  List? secciones;

  OptionResponseModel(
      {this.cod_productopadre,
      this.cod_producto,
      this.nom_producto,
      this.ico_producto,
      this.secciones});

  OptionResponseModel.fromJson(Map<String, dynamic> json) {
    cod_productopadre = json['cod_productopadre'];
    cod_producto = json['cod_producto'];
    nom_producto = json['nom_producto'];
    ico_producto = json['ico_producto'];
    secciones = json['secciones'];
  }
}
