import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LongitudeLatitudeInputs extends StatelessWidget{
  final ValueChanged<String> onLongitude1changed, onLongitude2changed, onLatitude1changed, onLatitude2changed;
  const LongitudeLatitudeInputs({
    super.key,
    required this.onLongitude1changed,
    required this.onLongitude2changed,
    required this.onLatitude1changed,
    required this.onLatitude2changed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
Row(
  children: [
    Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Point 1 longitude',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.\-]"))
        ],
        onChanged: onLongitude1changed,
      ),
    ),
    const SizedBox(width: 8),
    Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Point 2 longitude',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.\-]"))
        ],
        onChanged: onLongitude2changed,
      ),
    ),
  ],
),

Row(
  children: [
    Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Point 1 latitude',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.\-]"))
        ],
        onChanged: onLatitude1changed,
      ),
    ),
    const SizedBox(width: 8),
    Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Point 2 latitude',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.\-]"))
        ],
        onChanged: onLatitude2changed,
      ),
    ),
  ],
),

    ],);
  }
}