import 'package:flutter/material.dart';
import 'package:main/UIs/screens/search/search_result_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  List<String> searchHistory = []; // List to store past search queries.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Search',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform the search and navigate to the results page.
              searchHistory.add(query);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResultsPage(query: query),
                ),
              );
            },
            child: Text('Search'),
          ),
          // Display past search history here, e.g., as a list of buttons.
          ...searchHistory.map((history) => ElevatedButton(
                onPressed: () {
                  // Populate the search field with the selected history item.
                  setState(() {
                    query = history;
                  });
                },
                child: Text(history),
              )),
        ],
      ),
    );
  }
}
