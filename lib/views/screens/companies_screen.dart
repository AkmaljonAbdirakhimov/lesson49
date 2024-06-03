import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson49/notifiers/company_notifier.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final companiesViewModel = CompanyNotifier.of(context);
    print("object");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Companies"),
        actions: [
          IconButton(
            onPressed: () {
              companiesViewModel.addEmployee();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: companiesViewModel.list.length,
        itemBuilder: (ctx, index) {
          final company = companiesViewModel.list[index];
          return ExpansionTile(
            title: Text("Company ${company.name}"),
            children: company.employees.map((employee) {
              return Card(
                color: Colors.primaries[Random().nextInt(17)],
                child: ListTile(
                  title: Text(employee.firstname),
                ),
              );
            }).toList(),
          );

          // ListenableBuilder(
          //   listenable: companiesViewModel,
          //   builder: (context, child) {
          //     return ExpansionTile(
          //       title: child!,
          //       children: company.employees.map((employee) {
          //         return Card(
          //           color: Colors.primaries[Random().nextInt(17)],
          //           child: ListTile(
          //             title: Text(employee.firstname),
          //           ),
          //         );
          //       }).toList(),
          //     );
          //   },
          //   child: Text("Company ${company.name}"),
          // );
        },
      ),
    );
    ;
  }
}
