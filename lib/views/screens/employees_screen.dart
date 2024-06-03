import 'package:flutter/material.dart';
import 'package:lesson49/notifiers/company_notifier.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final companiesViewModel = CompanyNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Employees"),
      ),
      body: ListView.builder(
        itemCount: companiesViewModel.employees.length,
        itemBuilder: (ctx, index) {
          final employee = companiesViewModel.employees[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(employee.firstname),
            ),
          );
        },
      ),
    );
  }
}
