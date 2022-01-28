import 'package:flutter/material.dart';
import './models/data_layer.dart';
import 'controllers/plan_controller.dart';

class PlanProvider extends InheritedWidget {
  //final _plan = Plan();
  final _plans = <Plan>[];
  final _controller = PlanController();

  PlanProvider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static PlanController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>()!;
    return provider._controller;
  }
}