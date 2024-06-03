import 'package:flutter/material.dart';
import 'package:lesson49/viewmodels/companies_viewmodel.dart';

class CompanyNotifier extends InheritedNotifier<CompaniesViewmodel> {
  final CompaniesViewmodel companiesViewModel;

  const CompanyNotifier({
    super.key,
    required super.child,
    required this.companiesViewModel,
  }) : super(
          notifier: companiesViewModel,
        );

  @override
  bool updateShouldNotify(covariant CompanyNotifier oldWidget) {
    return oldWidget.companiesViewModel != companiesViewModel;
  }

  static CompaniesViewmodel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CompanyNotifier>()!
        .companiesViewModel;
  }
}
