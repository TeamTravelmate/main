import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/screens/Ad%20Mate/ad_model.dart';

class AdListScreen extends StatefulWidget {
  @override
  _AdListScreenState createState() => _AdListScreenState();
}

class _AdListScreenState extends State<AdListScreen> {
  final List<Ad> ads = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad List'),
      ),
      body: ListView.builder(
        itemCount: ads.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ads[index].title),
            subtitle: Text(ads[index].description),
            trailing: Text('\$${ads[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the ad creation screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdCreationScreen(
                onSave: (ad) {
                  setState(() {
                    ads.add(ad);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AdCreationScreen extends StatefulWidget {
  final Function(Ad) onSave;

   AdCreationScreen({super.key, required this.onSave});

  @override
  _AdCreationScreenState createState() => _AdCreationScreenState();
}

class _AdCreationScreenState extends State<AdCreationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Ad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: durationController,
              decoration: const InputDecoration(labelText: 'Duration (in days)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final ad = Ad(
                  user: User(
                    name: 'John Doe',
                    email: '',
                    avatar: ''),
                  title: titleController.text,
                  description: descriptionController.text,
                  imageUrl: imageUrlController.text,
                  duration: int.parse(durationController.text),
                );
                widget.onSave(ad);
                Navigator.pop(context);
              },
              child: const Text('Create Ad'),
            ),
          ],
        ),
      ),
    );
  }
}