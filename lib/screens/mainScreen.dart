import 'package:flutter/material.dart';
import 'package:flutter_doctor24/screens/DepartmentScreen.dart';
import 'package:flutter_doctor24/screens/DoctorsScreen.dart';
import 'package:flutter_doctor24/screens/add_Department.dart';
import 'add_doctors_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Map<String, Object>> _pages = [
    {
      'page':  AddDoctorScreen(),
      'title':'Add Doctor',
    },
    {
      'page': DoctorsScreen(),
      'title': 'Doctors',
    },
    {
      'page': DepartmentScreen(),
      'title': 'Department',
    },
    {
      'page': AddDepartmentScreen(),
      'title': 'Add Dept',
    },
  ];

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _getBottomNavigationBar(),
      body: _pages[_selectedPageIndex]["page"],
    );
  }

  Widget _getBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.red,
      currentIndex: _selectedPageIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add_outlined),
          label: 'Add Doctor',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account_sharp),
          label: 'Doctors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.data_usage),
          label: 'Department',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Add Dept',
        ),
      ],
    );
  }
}
