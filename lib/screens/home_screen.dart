import 'package:flutter/material.dart';
import 'package:weightmate/screens/signin_screen.dart';
import 'package:weightmate/utils/colors.dart';

class HomePage extends StatefulWidget {
  final int idx;
  const HomePage({super.key, required this.idx});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Sample data for demonstration
  final List<WeightRecord> weightRecords = [
    WeightRecord(date: '2024-10-01', weight: 150.0),
    WeightRecord(date: '2024-10-02', weight: 149.5),
    WeightRecord(date: '2024-10-03', weight: 150.2),
    WeightRecord(date: '2024-10-04', weight: null), // Missed day
    WeightRecord(date: '2024-10-05', weight: 149.0),
    WeightRecord(date: '2024-10-06', weight: null), // Missed day
    WeightRecord(date: '2024-10-07', weight: 148.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_rounded),
            onPressed: () {
              updateNotificationTime(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              //await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: weightRecords.length,
        itemBuilder: (context, index) {
          final record = weightRecords[index];
          return Card(
            color: bgColor,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              subtitle: Text(
                record.date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text(
                record.weight != null
                    ? 'Weight: ${record.weight} kg'
                    : 'Missed entry',
                style: TextStyle(
                  color: record.weight != null ? Colors.black : Colors.red,
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.idx,
        backgroundColor: const Color(0xFFFFF6E7),
        //backgroundColor: Color(0xFF86b649) // light green
        unselectedItemColor: Colors.grey,
        selectedItemColor: primaryColor,
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //   ),
              // );
              break;
            case 2:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProfilePage(
              //       currentIndex: 2,
              //     ),
              //   ),
              // );
              break;
          }
        },
      ),
    );
  }

  Future<void> updateNotificationTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      //update time of notification as picked
    }
  }
}

class WeightRecord {
  final String date;
  final double? weight;

  WeightRecord({required this.date, required this.weight});
}
