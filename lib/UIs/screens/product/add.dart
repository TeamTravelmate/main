import 'package:flutter/material.dart';
import 'package:main/UIs/screens/product/update.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  get selectedOption => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.only(
                    top: 45.0,
                    bottom: 10.0
                ),
                elevation: 5.0,
                shadowColor: Colors.black,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.menu),
                      SizedBox(width: 100.0,),
                      Text(
                        'Add Product',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left:40.0,
                    right: 40.0,
                    bottom: 2.0,
                    top: 15.0
                ),
                child: Row(
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                  ),
                  // You can add more customization to the TextField if needed
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left:40.0,
                  right: 40.0,
                  bottom: 2.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Product Category',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: DropdownButton<String>(
                  hint: selectedOption == null ? Text('Hiking')
                      : Text(
                    selectedOption,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0),
                  isExpanded: true,
                  iconSize: 35.0,
                  items: ['Hiking', 'Camping', 'Surfing'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {

                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left:40.0,
                  right: 40.0,
                  bottom: 2.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Unit Price',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'USD',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                  ),
                  // You can add more customization to the TextField if needed
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left:40.0,
                  right: 40.0,
                  bottom: 2.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: DropdownButton<String>(
                  hint: selectedOption == null ? Text('1')
                      : Text(
                    selectedOption,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0),
                  isExpanded: true,
                  iconSize: 35.0,
                  items: ['1', '2', '3', '4', '5', '6'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {

                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left:40.0,
                  right: 40.0,
                  bottom: 2.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Add photo',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'No image chosen',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                  ),
                  // You can add more customization to the TextField if needed
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left:40.0,
                  right: 40.0,
                  bottom: 2.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Colour',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Colour',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                  ),
                  // You can add more customization to the TextField if needed
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left:40.0,
                  right: 40.0,
                  bottom: 2.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Size',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: DropdownButton<String>(
                  hint: selectedOption == null ? Text('L')
                      : Text(
                    selectedOption,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0),
                  isExpanded: true,
                  iconSize: 35.0,
                  items: ['S', 'M', 'L', 'XL'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {

                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    top: 10.0,
                    bottom: 10.0
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    SizedBox(width: 5.0,),
                    Text(
                      'I agree to the ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0
                      ),
                    ),
                    Text(
                      'Terms ans Conditions',
                      style: TextStyle(
                          color: Color(0xFF2FACBB),
                          fontSize: 12.0
                      ),
                    )
                  ],
                ),
              ),

              Container(
                width: 250, // Custom width
                height: 50, // Custom height
                child: ElevatedButton(
                    onPressed: () {
                      // Add your button action here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Update())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Color(0xff0C1C33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Adjust the radius here
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 60.0
                          ),
                          child: Text(
                            'Add Product',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )

                ),
              ),
            ],
          ),
        )
    );
  }

  void setState(Null Function() param0) {}
}