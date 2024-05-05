import 'package:flutter/material.dart' show Widget;

class RouteModel {

  final String route;
  final String name;
  final Widget screen;

  RouteModel({
    required this.route, 
    required this.name, 
    required this.screen
  });

}