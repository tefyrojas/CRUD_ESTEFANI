import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/modelos/cuentas.dart';

class AdicionarCuentas extends StatefulWidget {
  final Cuentas gestionCuentas;

  const AdicionarCuentas({super.key, required this.gestionCuentas});

  @override
  State<AdicionarCuentas> createState() => _AdicionarCuentasState();
}

class _AdicionarCuentasState extends State<AdicionarCuentas> {
  final List<Cuentas> addCuentas = [];

  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlCodigo = TextEditingController();
  TextEditingController controlPrecio = TextEditingController();
  @override
  void initState() {
    controlNombre.text = widget.gestionCuentas.nombre;
    controlCodigo.text = widget.gestionCuentas.codigo;
    controlPrecio.text = widget.gestionCuentas.precio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cuentas"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: controlNombre,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Nombre"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: controlCodigo,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Codigo"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: controlPrecio,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Precio"),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  addCuentas.add(Cuentas(
                      nombre: controlNombre.text,
                      codigo: controlCodigo.text,
                      precio: controlPrecio.text));
                  Navigator.pop(context, addCuentas);
                },
                child: const Text("Agregar Cuentas"))
          ],
        ));
  }
}
