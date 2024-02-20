import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/core/maps/base/widget_view.dart';
import 'package:ourESchool/core/maps/map/map_screen.dart';
import 'package:ourESchool/core/maps/util/map_style.dart';

class MapView extends WidgetView<MapScreen, MapScreenController> {
  MapView(MapScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        buttonHeroTag: "mapsScreen",
        child: kBackBtn(context),
        onPressed: () {
          kbackBtn(context);
        },
        title: "School Bus Route",
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(state.playing ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          state.manageMarkerMovement();
        },
      ),
      body: GoogleMap(
        markers: state.polyLinePoints.isNotEmpty
            ? Set.of({state.startMarker, state.endMarker, state.movingMarker})
            : Set(),
        initialCameraPosition: CameraPosition(
            target: state.initialPosition,
            zoom: state.zoom,
            tilt: MapScreenController.TILT),
        onMapCreated: (mapController) {
          mapController.setMapStyle(MapStyle.mapStyles);
          state.completer.complete(mapController);
          state.initializeMapComponents();
        },
        onCameraMove: (position) {
          state.zoom = position.zoom;
        },
        zoomControlsEnabled: false,
        polylines:
            state.polyline == null ? Set() : Set<Polyline>.of({state.polyline}),
      ),
    );
  }
}
