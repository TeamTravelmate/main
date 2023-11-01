import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/env/env.dart';
import '../../themes/colors.dart';
import '../../../Domain/models/products.dart';
import '../myorders/track_order.dart';
import '../product/add.dart';
import 'catalog.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  var products = <Products>[].obs;

  void getSurfProducts(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var response = await http.get(
      Uri.parse('$backendUrl/vendor/category/$category'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(response.body);
      print('JSON Response: $jsonResponse');

      List<dynamic> jsonList = jsonResponse['products'] ?? [];
      products.value = Products.fromJsonList(jsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            title: const Text(
              'Tour Essentials',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xff2FACBB),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Add()));
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              width: 30.0,
                              height: 30.0,
                              margin: const EdgeInsets.only(
                                  // left: 60.0,
                                  right: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TrackOrder()));
                                },
                                child: const Image(
                                  image: AssetImage('assets/img/cart.png'),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 20.0,
                          left: 20.0,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Need Help?',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Make an appoinment or chat with us',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        width: size.width * 0.8,
                        height: 115.0,
                        decoration: const BoxDecoration(
                            color: Color(0xff2FACBB),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorsTravelMate.secundary.withOpacity(0.3)),
                    child: TabBar(
                      labelColor: Colors.white,
                      indicator: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromRGBO(47, 172, 187, 35)),
                      indicatorColor: ColorsTravelMate.secundary,
                      unselectedLabelColor: ColorsTravelMate.primary,
                      labelPadding: const EdgeInsets.all(0),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      tabs: [
                        Tab(
                          child: Column(
                            children: [
                              Card(
                                  elevation: 5.0,
                                  shadowColor: Colors.black,
                                  color: const Color(0xff2FACBB),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    child: const Column(
                                      children: [
                                        Image(
                                          image:
                                              AssetImage('assets/img/grid.png'),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const Tab(text: "Camping"),
                        const Tab(text: "Hiking"),
                        const Tab(text: "Surfing"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        All(),
                        Camping(),
                        Hiking(),
                        Surfing(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> with AutomaticKeepAliveClientMixin<All> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 20),
          SurfProduct()
        ],
      ),
    );
  }
}

class Camping extends StatefulWidget {
  const Camping({Key? key}) : super(key: key);

  @override
  _CampingState createState() => _CampingState();
}

class _CampingState extends State<Camping>
    with AutomaticKeepAliveClientMixin<Camping> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 20),
          SurfProduct()
        ],
      ),
    );
  }
}

class Hiking extends StatefulWidget {
  const Hiking({Key? key}) : super(key: key);

  @override
  _HikingState createState() => _HikingState();
}

class _HikingState extends State<Hiking>
    with AutomaticKeepAliveClientMixin<Hiking> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 20),
          SurfProduct()
        ],
      ),
    );
  }
}

class Surfing extends StatefulWidget {
  const Surfing({Key? key}) : super(key: key);

  @override
  _SurfingState createState() => _SurfingState();
}

class _SurfingState extends State<Surfing>
    with AutomaticKeepAliveClientMixin<Surfing> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: const Text(
                      'Popularity',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            SurfProducts()
          ],
        ),
      ),
    );
  }
}

// all surfing products
class SurfProducts extends StatefulWidget {
  const SurfProducts({super.key});

  @override
  State<SurfProducts> createState() => _SurfProductsState();
}

class _SurfProductsState extends State<SurfProducts> {
  final ProductsController controller = Get.put(ProductsController());

  @override
  void initState() {
    super.initState();
    controller.getSurfProducts('surfing');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                      width: 320.0,
                      height: 220.0,
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 300.0,
                              height: 160.0,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/img/surfboard.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Catalog()));
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    controller.products[index].name ?? 'N/A',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                const Rating(),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    right: 220.0,
                                  ),
                                  child: Text(
                                    controller.products[index].price ?? 'N/A',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              );
            },
          ),
        ));
  }
}

// product card
class SurfProduct extends StatefulWidget {
  const SurfProduct({super.key});

  @override
  State<SurfProduct> createState() => _SurfProductState();
}

class _SurfProductState extends State<SurfProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Card(
        elevation: 5.0,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
            width: size.width * 0.8,
            height: 220.0,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: size.width * 0.7,
                    height: 160.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/img/surfboard.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Catalog()));
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(
                          'Surfing Board',
                          style: TextStyle(
                            color: Color(0xff2FACBB),
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      const Rating(),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 220.0,
                        ),
                        child: const Text(
                          'Rs.6500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// rating
class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, top: 5.0),
      child: const Row(
        children: [
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 193, 59),
            size: 15.0,
          ),
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 193, 59),
            size: 15.0,
          ),
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 193, 59),
            size: 15.0,
          ),
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 193, 59),
            size: 15.0,
          ),
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 193, 59),
            size: 15.0,
          )
        ],
      ),
    );
  }
}
