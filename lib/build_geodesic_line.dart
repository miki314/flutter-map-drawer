import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Polyline buildGeodesicLine(LatLng start, LatLng end, {
  int steps = 100,
  LengthUnit unit = LengthUnit.Kilometer
  }) {
  final Distance distance = Distance();
  final double totalDistance = distance(start, end);
  final double bearing = distance.bearing(start, end);

  final List<LatLng> points = List.generate(steps + 1, (i) {
    final double fraction = i / steps;
    final double d = totalDistance * fraction;
    return distance.offset(start, d, bearing);
  });

  return Polyline(
    points: points,
    strokeWidth: 3,
    color: Colors.blue
    );
}