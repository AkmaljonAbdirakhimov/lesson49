import 'package:flutter/material.dart';
import 'package:lesson49/models/company.dart';
import 'package:lesson49/models/employee.dart';

class CompaniesViewmodel with ChangeNotifier {
  final List<Company> _list = [
    Company(
      name: "Apple",
      employees: [
        Employee("Steve Jobs"),
        Employee("Tim Cook"),
        Employee("Harry Potter"),
      ],
    ),
    Company(
      name: "Microsoft",
      employees: [
        Employee("Bill Gates"),
      ],
    ),
    Company(
      name: "Google",
      employees: [
        Employee("Sundar Pichae"),
        Employee("Larry Page"),
      ],
    ),
  ];

  List<Company> get list {
    return [..._list];
  }

  void addCompany() {
    _list.add(
      Company(name: "Amazon", employees: []),
    );
    notifyListeners();
  }

  void addEmployee() {
    _list[0].employees.add(
          Employee("Jeff Bezos"),
        );
    notifyListeners();
  }

  int getEmployeesNumber() {
    int counter = 0;
    for (var company in _list) {
      counter += company.employees.length;
    }

    return counter;
  }

  List<Employee> get employees {
    List<Employee> e = [];
    for (var company in _list) {
      e.addAll(company.employees);
    }
    return e;
  }
}
