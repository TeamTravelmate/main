import 'package:flutter/material.dart';
import 'package:main/UIs/screens/product/update.dart';

class ProductSection {
  double unitPrice;
  String color;
  String size;
  List<String> photos;
  int quantity;

  ProductSection({required this.unitPrice, required this.color, required this.size, required this.photos, required this.quantity});
}

class Product {
  String name;
  String description;
  String category;
  List<ProductSection> sections;

  Product({required this.name, required this.description, required this.category, required this.sections});
}

class Add extends StatefulWidget {
  @override
  AddState createState() => AddState();
}
class AddState extends State<Add> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedCategory = 'Camping'; // Default category
  List<ProductSection> productSections = [];

  void addProductSection() {
    setState(() {
      productSections.add(
        ProductSection(
          unitPrice: 0.0,
          color: '',
          size: 'S',
          photos: [],
          quantity: 0,
        ),
      );
    });
  }

  void addProductToDatabase() {
    // Create the product with sections and add it to the database.
    Product product = Product(
      name: nameController.text,
      description: descriptionController.text,
      category: selectedCategory,
      sections: productSections,
    );

    // Add your database storage logic here.

    // Clear the form and sections.
    setState(() {
      nameController.clear();
      descriptionController.clear();
      selectedCategory = 'Camping';
      productSections.clear();
    });
  }

  get selectedOption => null;
  bool _isChecked = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Text(
              'Add Product',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: ['Camping', 'Hiking', 'Surfing']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Display added product sections here.
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: productSections.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductSectionWidget(
                      unitPriceController: TextEditingController(),
                      colorController: TextEditingController(),
                      selectedSize: productSections[index].size,
                      onSizeChanged: (String? newValue) {
                        setState(() {
                          productSections[index].size = newValue ?? '';
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addProductSection,
                  child: Text('Add Section'),
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
                      Checkbox(
                        activeColor: Color(0xFF0C1C33),
                        value: _isChecked,
                        // This determines the state of the checkbox
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ??
                                false; // Update the state of the checkbox when it's clicked
                          });
                        },
                      ),
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
                                builder: (context) => Update())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Color(0xff0C1C33),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the radius here
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
          ),
        )
    );
  }

// void setState(Null Function() param0) {}
}

class ProductSectionWidget extends StatelessWidget {
  final TextEditingController unitPriceController;
  final TextEditingController colorController;
  final String? selectedSize; // Update to accept nullable String
  final ValueChanged<String?> onSizeChanged;

  ProductSectionWidget({
    required this.unitPriceController,
    required this.colorController,
    required this.selectedSize,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: unitPriceController,
                  decoration: InputDecoration(
                    labelText: 'Unit Price (Rs.)',
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: colorController,
                  decoration: InputDecoration(
                    labelText: 'Color',
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedSize,
                onChanged: onSizeChanged,
                items: ['S', 'M', 'L', 'XL', 'Free']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Size',
                  border: InputBorder.none, // Remove the default border
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Photo URL',
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
