import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../utils/colors.dart';

class PetaScreen extends StatefulWidget {
  const PetaScreen({super.key});

  @override
  _PetaScreenState createState() => _PetaScreenState();
}

class _PetaScreenState extends State<PetaScreen> {
  final MapController _mapController = MapController();
  final LatLng _center = LatLng(-6.147626392457103, 106.84612730753477);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta Lokasi'),
        backgroundColor: main1,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _center,
          zoom: 16.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
