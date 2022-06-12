
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workout/mylocation.dart';
import 'package:workout/pages/floatingpage.dart';
import 'package:workout/pages/upperpage.dart';
import 'package:workout/pages/days.dart';
class OurBody extends StatefulWidget {
  const OurBody({Key? key}) : super(key: key);

  @override
  State<OurBody> createState() => _OurBodyState();
}

class _OurBodyState extends State<OurBody> {
  String location='Null,press button';
  String Address='Search';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition();
  }
  Future<void>GetAddressFromLatLong(Position position)async{
    List<Placemark> placemarker= await placemarkFromCoordinates(
        position.latitude, position.longitude);
    print(placemarker);
    Placemark place=placemarker[0];
    Address="${place.thoroughfare}";
    setState(() {

    });
  }
  double a=2,b=1;
  dynamic myData;
  Color mainColor = Color(0xff7f1019);
  Color textColor = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () async {
            Position position=await _determinePosition();
            location="lat= ${position.latitude},long=${position.longitude}";
            GetAddressFromLatLong(position);
            a=position.latitude;
            b=position.longitude;
            setState(() {
            });
            MaterialPageRoute(builder: (context)=>Mylocation(a, b));
          }, icon:Icon(Icons.location_on)),

            IconButton(onPressed: () async {
              dynamic x = ImagePicker();
              dynamic y = await x.getImage(source: ImageSource.camera);

              setState(() {
                if (y != null) myData = File(y.path);
              });
            }, icon:Icon(Icons.camera, size: 30,color: mainColor,)),
            IconButton(onPressed: () async {
              dynamic a = ImagePicker();
              dynamic b = await a.getImage(source: ImageSource.gallery);
              setState(() {
                if (b != null) myData = File(b.path);
              });
            }, icon:Icon(Icons.browse_gallery, size: 30,color: mainColor,))

          ],
          elevation: 0,
          flexibleSpace: const UpperPage(),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: const FloatingPage(),
            preferredSize:
            Size.fromHeight((MediaQuery.of(context).size.height / 2) - 40),
          ),
        ),
        body: const Day());
  }
}