import 'package:flutter/material.dart';
import 'package:lesson49/notifiers/company_notifier.dart';
import 'package:lesson49/viewmodels/companies_viewmodel.dart';
import 'package:lesson49/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CompanyNotifier(
      companiesViewModel: CompaniesViewmodel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
