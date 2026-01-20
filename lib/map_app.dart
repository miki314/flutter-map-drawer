import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_api_comparison/build_geodesic_line.dart';
import 'package:map_api_comparison/longitude_latitude_inputs.dart';

class MapApp extends StatefulWidget {
  const MapApp({super.key});

  @override
  State<StatefulWidget> createState() => MapAppState();
}

class MapAppState extends State<MapApp> {
  final MapController mapController = MapController();
  final List<double?> longitude = [null, null];
  final List<double?> latitude = [null, null];

  void _updateLongitude(int index, String value) {
    setState(() {
      longitude[index] = double.tryParse(value);
    });
  }

  void _updateLatitude(int index, String value) {
    setState(() {
      latitude[index] = double.tryParse(value);
    });
  }

  bool _hasTwoPoints() => longitude[0] != null && longitude[1] !=null && latitude[0] != null && latitude[1] != null;

  List<Marker> _buildMarkers() {
    final List<Marker> result = [];

    for(int i = 0; i<2; i++) {
      final lat = latitude[i];
      final lon = longitude[i];

      if(lat != null && lon != null) {
        result.add(
          Marker(
            point: LatLng(lat, lon),
            width: 40,
            height: 40,
            child: const Icon(
              Icons.location_pin,
              color: Colors.red,
            )
          )
        );
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Map app"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(50.28863577721454, 18.678016382351290),
              minZoom: 0,
              maxZoom: 100,
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),

              MarkerLayer(markers: _buildMarkers()),

              if(_hasTwoPoints())
              PolylineLayer(polylines: [buildGeodesicLine(LatLng(latitude[0] ?? 0, longitude[0] ?? 0), LatLng(latitude[1] ?? 0, longitude[1] ?? 0))]),
            ],
          ),

          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              child: LongitudeLatitudeInputs(
                onLongitude1changed: (value) => _updateLongitude(0, value),
                onLongitude2changed: (value) => _updateLongitude(1, value),
                onLatitude1changed: (value) => _updateLatitude(0, value),
                onLatitude2changed: (value) => _updateLatitude(1, value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
