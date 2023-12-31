import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/addCard/paycard.dart';
import '../../../themes/colors.dart';
import 'onlinePayment.dart';

class publicTripForm extends StatefulWidget {
  @override
  _publicTripFormState createState() => _publicTripFormState();
}

class _publicTripFormState extends State<publicTripForm> {
  final formKey = GlobalKey<FormState>();
  int _counter1 = 1;
  int _counter2 = 0;
  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _decrementCounter1() {
    setState(() {
      if (_counter1 != 0) {
        _counter1--;
      }
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _decrementCounter2() {
    setState(() {
      if (_counter2 != 0) {
        _counter2--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Join Public Trip',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'Available slots: 10',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'No. of adults: ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              onPressed: _decrementCounter1,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 38,
                              height: 39,
                              padding: const EdgeInsets.only(top: 5),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorsTravelMate.secundary),
                              child: Text(
                                '$_counter1',
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              alignment: Alignment.center,
                              onPressed: _incrementCounter1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'No. of children: ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              onPressed: _decrementCounter2,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 38,
                              height: 39,
                              padding: const EdgeInsets.only(top: 5),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorsTravelMate.secundary),
                              child: Text(
                                '$_counter2',
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              alignment: Alignment.center,
                              onPressed: _incrementCounter2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Enter your address: ',
                          labelStyle: TextStyle(color: Colors.black)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Text(
                          'Rs. 7500 ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Please note that the amount will not be refundable if you inform the tour guide in less than 7 days!',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OnlinePayment()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: const Color(0xff0C1C33),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                        ),
                        child: const Text('Proceed for payment'),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
