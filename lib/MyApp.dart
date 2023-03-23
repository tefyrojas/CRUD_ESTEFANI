import 'package:crud_estefani/ui/contenido/crear.dart';
import 'package:crud_estefani/ui/contenido/listar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "crud cuentas",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const ListadoCuentas(),
      debugShowCheckedModeBanner: false,
    );
  }
}
