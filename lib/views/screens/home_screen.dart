import 'package:flutter/material.dart';
import 'package:lesson49/notifiers/company_notifier.dart';
import 'package:lesson49/views/screens/companies_screen.dart';
import 'package:lesson49/views/screens/employees_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final companiesViewModel = CompanyNotifier.of(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Inherited Widget"),
        actions: [
          IconButton(
            onPressed: () {
              companiesViewModel.addCompany();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return CompaniesScreen();
                }),
              );
            },
            child: Card(
              color: Colors.blue.shade200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Companies",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListenableBuilder(
                      listenable: companiesViewModel,
                      builder: (context, child) {
                        print("Listeabble");
                        return Text(
                          "Current: ${companiesViewModel.list.length}",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return EmployeesScreen();
                }),
              );
            },
            child: Card(
              color: Colors.blue.shade200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Employees",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Current: ${companiesViewModel.getEmployeesNumber()}",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
