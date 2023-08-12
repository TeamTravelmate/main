import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Data/controller/global_controller.dart';
import '../../themes/colors.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  var data;

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(
      globalController.getLattitude().value,
      globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
                  height: 80,
                ),
                Text(
                  city,
                  style:
                      const TextStyle(fontSize: 30, color: ColorsTravelMate.primary),
                ),
                Text(
                  date,
                  style:
                      const TextStyle(fontSize: 15, color: ColorsTravelMate.primary),
                ),
                const SizedBox(
                  height: 20,
                ),
      ],
    );
  }
}