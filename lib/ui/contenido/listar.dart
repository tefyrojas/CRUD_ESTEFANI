// ignore_for_file: non_constant_identifier_names

import 'package:crud_estefani/ui/contenido/crear.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/modelos/cuentas.dart';

class ListadoCuentas extends StatefulWidget {
  const ListadoCuentas({super.key});

  @override
  State<ListadoCuentas> createState() => _ListadoCuentasState();
}

class _ListadoCuentasState extends State<ListadoCuentas> {
  final List<Cuentas> _cuentas = listadoCuentas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista De Cuentas"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _cuentas.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              EliminarCuenta(context, _cuentas[index]);
            },
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AdicionarCuentas(
                            gestionCuentas: _cuentas[index],
                          ))).then((resultado) {
                if (resultado != null) {
                  _cuentas[index] = resultado[0];
                  setState(() {});
                }
              });
            },
            leading: CircleAvatar(child: Text(_cuentas[index].codigo)),
            title: Text(_cuentas[index].nombre),
            trailing: CircleAvatar(
              radius: 30,
              child: Text(_cuentas[index].precio.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => AdicionarCuentas(
                        gestionCuentas:
                            Cuentas(codigo: "", nombre: "", precio: ""))))
            .then((resultado) {
          if (resultado != null) {
            _cuentas.addAll(resultado);

            setState(() {});
          }
        });
      }),
    );
  }

  EliminarCuenta(context, Cuentas EliminarCuenta) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: const Text("Eliminar Cuenta"),
                content: Text(
                    "Realmente desea eliminar la Cuenta:${EliminarCuenta.nombre}"),
                actions: [
                  TextButton(
                      onPressed: () {
                        _cuentas.remove(EliminarCuenta);
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Eliminar",
                          style: TextStyle(color: Colors.red))),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancela",
                          style: TextStyle(color: Colors.blue)))
                ]));
  }
}
