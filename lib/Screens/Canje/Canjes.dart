import 'package:flutter/material.dart';
import '../../Utils/HttpService.dart';

class CanjesPage extends StatefulWidget {
  CanjesPage({super.key});

  @override
  State<CanjesPage> createState() => _CanjesPageState();
}

class _CanjesPageState extends State<CanjesPage> {

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_outlined, color: Colors.white),
            onTap: () {
             // setProducts(); // Llamada al método antes de cambiar de página
              Navigator.of(context).pushNamed('/MisPuntos');
            },
          ),
        ),
        // Aquí puedes agregar el contenido del body si es necesario
      ),
    );
  }
}
