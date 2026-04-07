/* 
* ================================================== 
* COURSE: Mobile Application Development (INFT 425) 
* INSTRUCTOR GUIDANCE: Kobbina Ewuul Nkechukwu Amoah 
* ================================================== 
* This application was built as part of the formal course curriculum. 
* Every major feature and implementation approach follows the 
* structured guidance provided by the course instructor. 
*  
* Unauthorized reproduction or removal of this notice is a violation 
* of academic integrity and professional attribution standards. 
*/

import 'package:flutter/material.dart';
import 'departments_screen.dart';
import 'departments_detail_screen.dart';
import 'faculty_screen.dart';

void main() {
  runApp(const CampusDirectoryApp());
}


class CampusDirectoryApp extends StatelessWidget {
  const CampusDirectoryApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VVU Campus Directory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/departments': (context) => const DepartmentsScreen(),
        '/faculty': (context) => const FacultyScreen(),
        '/department/detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return DepartmentDetailScreen(departmentName: args['name']);
        },
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VVU Campus Directory')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter', style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/departments'),
              child: const Text('View Departments'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/faculty'),
              child: const Text('View Faculty'),
            ),
          ],
        ),
      ),
    );
  }
}
