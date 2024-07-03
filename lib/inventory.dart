import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<InventoryItem> allRecords = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'https://api.airtable.com/v0/appgAln53ifPLiXNu/tblvBQeCreDaryIPs'),
      headers: {
        'Authorization':
            'Bearer patXmwDbTcQr2K1lJ.de9224db382239bd6b93f162a21d6b0db884233ee5f59ab1458e5851b6764451',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<InventoryItem> fetchedItems = (data['records'] as List)
          .map((record) => InventoryItem.fromJson(record))
          .toList();

      setState(() {
        allRecords = fetchedItems;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allRecords.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: allRecords.length,
              itemBuilder: (context, index) {
                final item = allRecords[index];
                return _buildInventoryCard(
                  itemName: item.itemName,
                  imageUrl: item.pictureUrl,
                  price: item.price,
                  quantity: item.quantity,
                  remaining: item
                      .quantity, // Assuming remaining is the same as quantity
                  popularity:
                      4.5, // Replace with actual popularity if available
                );
              },
            ),
    );
  }

  Widget _buildInventoryCard({
    required String itemName,
    required String imageUrl,
    required int price,
    required int quantity,
    required int remaining,
    required double popularity,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF195DAD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  itemName,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xFFA3D9FF),
              child: Row(
                children: [
                  Expanded(
                    flex: isSmallScreen ? 3 : 3,
                    child: Image.network(
                      imageUrl,
                      height: 100,
                      width: 300,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: isSmallScreen ? 5 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Price', '$price'),
                        _buildInfoRow('Quantity', quantity.toString()),
                        _buildInfoRow('Remaining', remaining.toString()),
                        _buildInfoRow('Popularity', popularity.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs. $price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement edit functionality
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF195DAD)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Inventory(),
  ));
}

class InventoryItem {
  final String id;
  final String pictureUrl;
  final String itemName;
  final int price;
  final int quantity;
  final String category;
  final String itemID;

  InventoryItem({
    required this.id,
    required this.pictureUrl,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.category,
    required this.itemID,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'],
      pictureUrl: json['fields']['Picture'][0]['url'],
      itemName: json['fields']['Item Name'],
      price: json['fields']['Price'],
      quantity: json['fields']['Quantity'],
      category: json['fields']['Category'],
      itemID: json['fields']['ItemID'],
    );
  }
}
