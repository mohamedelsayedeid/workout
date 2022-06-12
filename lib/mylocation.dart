import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mylocation extends StatelessWidget {
  double lat,long;
  Mylocation(this.lat,this.long);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(elevation: 0.0,backgroundColor: Colors.white,),backgroundColor: Colors.white,
      body:GoogleMap(
        onMapCreated: (controller){},
        initialCameraPosition: CameraPosition(target: LatLng(lat,long),
            zoom: 10.0),
      ) ,);
  }
}
