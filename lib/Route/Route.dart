import 'package:flutter/material.dart';
import '../Screens/Canje/Canjes.dart';
import '../Screens/MisPuntos/MisPuntos.dart';

final tipo = Null;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/MisPuntos':
        return MaterialPageRoute(
          builder: (_) => MisPuntosPage(),
        );
      case '/Canjes':
        return MaterialPageRoute(
          builder: (_) => CanjesPage(),
        );

    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('error')),
      );
    });
  }
}
