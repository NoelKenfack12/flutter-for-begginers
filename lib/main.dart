import 'package:flutter/material.dart';
import 'package:notes/plan_provider.dart';
import 'package:notes/views/plan_creator_screen.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: PlanCreatorScreen(),
      ),
    );
  }
}