import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PG Gather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainFeed(),
    );
  }
}

class MainFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100, // Light orange background
      appBar: AppBar(
        backgroundColor: Colors.blue, // Blue app bar
        title: Text('MAIN FEED'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // TODO: Implement chat functionality
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          // Filter Bar
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black, // Filter bar with black background
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Filter bar',
                  style: TextStyle(color: Colors.white), // White text for filter bar
                ),
                // TODO: Add more filters here
              ],
            ),
          ),
          // Post with photo
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of posts (dummy count for now)
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.account_circle), // Placeholder for org logo
                        title: Text('org_name'),
                        subtitle: Text('short description'),
                      ),
                      Container(
                        height: 200,
                        color: Colors.grey[300], // Placeholder for post image
                        child: Center(
                          child: Text('Post with photo'),
                        ),
                      ),
                      // TODO: Add post details here
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Blue bottom bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // TODO: Implement home button functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                // TODO: Implement create ad/post functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // TODO: Implement user profile functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}