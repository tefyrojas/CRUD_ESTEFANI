class Cuentas {
  var nombre;
  var codigo;
  var precio;

  Cuentas({this.nombre, this.codigo, this.precio});
}

List<Cuentas> listadoCuentas = [
  Cuentas(nombre: "neflix", codigo: "01", precio: "12000"),
  Cuentas(nombre: "hbo", codigo: "02", precio: "8000"),
  Cuentas(nombre: "disney", codigo: "03", precio: "8000"),
  Cuentas(nombre: "amazon prime", codigo: "04", precio: "9000"),
];
