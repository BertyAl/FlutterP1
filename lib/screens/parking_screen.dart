import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project1/screens/parking_utils/selection_button_ui.dart';
import 'package:flutter_project1/screens/parking_utils/provider/selection_button_provider.dart';

class ParkingScreen extends StatelessWidget{
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectionButtonProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SelectionButtonPage(),
      ),
    );
  }
}
