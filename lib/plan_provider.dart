import 'package:flutter/material.dart';
import './models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _plan = Plan();

  PlanProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}