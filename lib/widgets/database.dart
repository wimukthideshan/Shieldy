import 'package:flutter/material.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class database extends StatefulWidget {
  const database({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<database> {
  List<Map<String, dynamic>> contactCards = [];
  List<Map<String, dynamic>> displayedContacts = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromMongoDB();
  }

  Future<void> fetchDataFromMongoDB() async {
    // Replace with your MongoDB connection details
    final db = await mongo.Db.create('mongodb://localhost:27017/Contacts');
    await db.open();

    final collection = db.collection('Numbers ');
    final documents = await collection.find().toList();

    setState(() {
      contactCards = documents.cast<Map<String, dynamic>>();
      displayedContacts = List.from(contactCards);
    });
  }

  void onQueryChanged(String newQuery) {
    setState(() {
      if (newQuery.isEmpty) {
        displayedContacts = contactCards;
      } else {
        displayedContacts = contactCards
            .where((contact) =>
                contact['location']
                    .toString()
                    .toLowerCase()
                    .contains(newQuery.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
      body: Column(
        children: [
          SearchBar(onQueryChanged: onQueryChanged),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: displayedContacts.length,
      itemBuilder: (context, index) {
        final contact = displayedContacts[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Icon(Icons.location_on, color: blueColor),
            title: Text(
              contact['location'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              contact['type'],
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.phone, color: Colors.white),
              onPressed: () {
                // Handle phone number display or call
                // e.g., showDialog(context: context, child: Text(contact['phoneNumber']));
              },
            ),
            onTap: () {
              // Handle location selection
            },
          ),
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  SearchBar({required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        onChanged: onQueryChanged,
        decoration: InputDecoration(
          labelText: 'Search from location',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}