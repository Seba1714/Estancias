import 'package:card_points/Screens/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Models/ProductosModel/Productos.dart';
import '../../Utils/HttpService.dart';
import 'package:intl/intl.dart';


class MisPuntosPage extends StatefulWidget {
  const MisPuntosPage({
    super.key,
    //required this.activarBuscador
  });
  //final bool activarBuscador;
  @override
  State<MisPuntosPage> createState() => _MisPuntosPageState();
}

class _MisPuntosPageState extends State<MisPuntosPage> {
  late List<NovedadesModel> products;
  HttpService httpService = HttpService();
  bool activarBuscador = false;
  @override
  void initState() {
    super.initState();
    products = [
      NovedadesModel(id: 1,titulo: 'Bandolera',descripcion: 'Bandolera' ,valorPuntos: 45000,imagepath: 'assets/Bandolera/imagen_1.jpg'),
      NovedadesModel(id: 2,titulo: 'Cinturon' ,descripcion: 'Cinturon'  ,valorPuntos: 17000,imagepath: 'assets/Cinturon/imagen_1.jpg'),
      NovedadesModel(id: 3,titulo: 'Pantalon' ,descripcion: 'Pantalon'  ,valorPuntos: 70000,imagepath:'assets/Pantalon/imagen_1.jpg'),
      NovedadesModel(id: 4,titulo: 'Camisa'   ,descripcion: 'Camisa'    ,valorPuntos: 58000,imagepath: 'assets/Camisa/imagen_1.jpg')
    ];// Initialize products
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;


    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
            child: Image.asset('assets/logo_estancias.png')
        ),
        backgroundColor: Color(0XFFF6F6EE),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_outlined, color: Colors.black),
          onTap: () {
            Navigator.of(context).pushNamed('/Canjes');
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          //padding: EdgeInsets.symmetric(vertical: 15),
          width: ancho,
          //height: altura,
          color: Color(0XFFF6F6EE),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoWidget(
                  activarBuscador: activarBuscador,
                  OnTap:(){
                    if(activarBuscador == false){
                      setState(() {
                        activarBuscador = true;
                      });
                    }else{
                      setState(() {
                        activarBuscador = false;
                      });
                    }
                  }
              )
              ,
              // Ajuste para el GridView.builder
              Expanded(
                //constraints: BoxConstraints(maxHeight: altura,minHeight: altura * 0.5),
                   //height: MediaQuery.of(context).size.height * 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                       mainAxisSpacing: 150,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        //padding: EdgeInsets.all(20),
                        //itemCount: products!.length,
                        children: products.map((item)=>
                            GestureDetector(
                              onTap: (){

                                // Abrir Tarjeta

                                showDialog(context: context, builder: (BuildContext context ){
                                  return Center(
                                    child: Container(
                                      width: ancho * 0.75,
                                      height: altura * 0.58,
                                      color: Colors.grey,
                                      child: Stack(
                                        children: [
                                          Container(
                                              width: ancho * 0.75,
                                              height: altura * 0.58,
                                              child: Image.asset(
                                                  item.imagepath!,
                                                  fit: BoxFit.contain
                                              )
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: FadeAnimation(

                                              0.5,Container(
                                              height: altura * 0.15,
                                              width: ancho * 0.75,
                                              padding: EdgeInsets.all(8),

                                              decoration: const BoxDecoration(
                                                  color: Colors.white
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              item.titulo!,
                                                              style:  GoogleFonts.raleway(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 20
                                                              )
                                                          ),
                                                          Text(
                                                              item.descripcion!,
                                                              style:  GoogleFonts.raleway(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 15
                                                              )
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              item.valorPuntos.toString(),
                                                              style:  GoogleFonts.raleway(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 20
                                                              )
                                                          ),

                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 10),
                                                    padding: EdgeInsets.all(5),
                                                    width: ancho,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black),
                                                        color: Colors.white
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: (){},
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/coin.png',
                                                            fit: BoxFit.scaleDown,
                                                            color: Colors.black,
                                                          ),
                                                          Text(
                                                              'Cambiar Puntos',
                                                              style:  GoogleFonts.raleway(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 18
                                                              )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }, // Termina Abrir Tarjeta

                              // Tarjeta Principal

                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                height: altura,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        alignment: Alignment.center,
                                        item.imagepath!,
                                        height: altura * 0.33,
                                        fit: BoxFit.fill
                                    ),

                                    // Texto Tarjeta Principal
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            item.titulo!,
                                            textAlign: TextAlign.start,
                                            style:  GoogleFonts.raleway(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20
                                            )
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                formatAsPrice(item.valorPuntos!),
                                                textAlign: TextAlign.start,
                                                style:  GoogleFonts.plusJakartaSans(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15
                                                )
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 18),
                                              margin: EdgeInsets.only(left: 20),
                                              color: Colors.red,
                                              child: Text('Puntos',
                                                  textAlign: TextAlign.start,
                                                  style:  GoogleFonts.raleway(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                        ).toList()
                      ),
                      SizedBox(height: 150)
                    ],
                  ),
                ))],
          ),
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.OnTap,
    required this.activarBuscador
  });
  final bool activarBuscador ;
  final OnTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Image.asset('assets/coin.png',
                        width: 60, height: 60),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 5,
                        child: Text('Mis Puntos',
                            style: GoogleFonts.raleway(fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.1)),
                      ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left:8,top: 10),
                             child: Text(formatAsPrice(2000),
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 50,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )),
                           )
                         ],
                       ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15,top: 30),
                child: GestureDetector(
                    onTap: OnTap,
                    child: SizedBox(child: Icon(Icons.search, color: Colors.black), height: 40,width: 40)
                ),
              )
            ],
          ),
          Visibility(
            visible: activarBuscador,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: TextFormField(
                style: GoogleFonts.raleway(color: Colors.black),
                decoration: InputDecoration(
                  //border: Border.all(color: Colors.black),
                  hintText: 'Buscar',
                  hintStyle: GoogleFonts.raleway(color: Colors.black),
                  border:  OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

String formatAsPrice(double amount) {
  final formatter = NumberFormat('#,##0', 'es_US');
  final formattedAmount = formatter.format(amount);

  // Reemplaza las comas por puntos y viceversa
  final replacedAmount = formattedAmount.replaceAll('.', '#').replaceAll(',', '.').replaceAll('#', ',');

  return '$replacedAmount';  // Agrega un $ al inicio
}