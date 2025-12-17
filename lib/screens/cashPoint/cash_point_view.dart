import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'cash_point_controller.dart';

class CashPointsScreen extends StatelessWidget {
  const CashPointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CashPointsController());

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final currentPosition = controller.currentPosition.value;
        if (currentPosition == null) {
          return const Center(child: Text('Unable to get current location.'));
        }

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: currentPosition,
            zoom: 15,
          ),
          onMapCreated: controller.onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          mapType: MapType.normal,
        );
      }),
    );
  }
}
