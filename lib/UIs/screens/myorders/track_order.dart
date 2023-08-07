import 'package:flutter/material.dart';
import 'package:main/UIs/screens/myorders/cancel.dart';
import 'package:main/UIs/screens/myorders/orders_1.dart';
import 'package:main/UIs/screens/myorders/process.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Text(
                'My Orders',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                color: Colors.black,
              )
            ],
            bottom: const TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)), // Creates border
                  color: Colors.black,
              ),
              unselectedLabelColor: Colors.black,
              // Color: Colors.white,
              tabs: [
                Text(
                    'Delivered',
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
                Text(
                    'Processing',
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
                Text(
                    'Cancelled',
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Deliver(),
              Process(),
              Cancel()
            ],
          ),
        ),
      ),
    );
  }


}