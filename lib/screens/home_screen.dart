import 'package:flutter/material.dart';
import 'compose_screen.dart';
import 'inbox_screen.dart';
import 'email_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    InboxScreen(),
    Center(child: Text('Meet Screen')),
    Center(child: Text('Chat Screen')),
    Center(child: Text('Rooms Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail Clone'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Gmail Clone'),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Inbox'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Sent'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text('Drafts'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Meet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Rooms',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComposeScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
