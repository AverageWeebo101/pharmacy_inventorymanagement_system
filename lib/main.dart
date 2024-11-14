import 'package:flutter/material.dart';
import 'package:pharmacy_inventorymanagement_system/firebase_options.dart';

import 'package:pharmacy_inventorymanagement_system/providers/db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/employee_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/inventory_item_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/log_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/manufacturer_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/medicine_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/order_item_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/order_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/product_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/sale_item_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/sale_provider.dart';
import 'package:pharmacy_inventorymanagement_system/providers/supplier_provider.dart';

import 'package:pharmacy_inventorymanagement_system/screens/auth/login_screen.dart';
import 'package:pharmacy_inventorymanagement_system/screens/dashboard/home_screen.dart';
import 'package:pharmacy_inventorymanagement_system/screens/dashboard/settings_screen.dart';
import 'package:pharmacy_inventorymanagement_system/screens/shared_widgets/app_theme.dart';

import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DBProvider.instance.database;
  runApp(const MyAppWrapper());
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppWrapperState createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleThemeMode() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyApp(
      themeMode: _themeMode,
      toggleThemeMode: toggleThemeMode,
    );
  }
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback toggleThemeMode;

  const MyApp(
      {super.key, required this.themeMode, required this.toggleThemeMode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DBProvider>(create: (_) => DBProvider.instance),
        //
        ChangeNotifierProvider<EmployeeProvider>(
            create: (_) => EmployeeProvider()),
        //
        ChangeNotifierProvider<InventoryItemProvider>(
            create: (_) => InventoryItemProvider()),
        //
        ChangeNotifierProvider<LogProvider>(create: (_) => LogProvider()),
        ChangeNotifierProvider<ManufacturerProvider>(
            create: (_) => ManufacturerProvider()),
        //
        ChangeNotifierProvider<MedicineProvider>(
            create: (_) => MedicineProvider()),
        //
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        //
        ChangeNotifierProvider<SupplierProvider>(
            create: (_) => SupplierProvider()),
        //
        ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
        //
        ChangeNotifierProvider<OrderItemProvider>(
            create: (_) => OrderItemProvider()),
        //
        ChangeNotifierProvider<SaleProvider>(create: (_) => SaleProvider()),
        //
        ChangeNotifierProvider<SaleItemProvider>(
            create: (_) => SaleItemProvider()),
        //
      ],
      child: MaterialApp(
        title: 'Pharmacy Inventory Management',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: '/home',
        routes: {
          //'/': (context) => const AuthWrapper(),
          '/home': (context) => const HomeScreen(),
          //'/employee_management': (context) => EmployeeManagementScreen(),
          //'/inventory_management': (context) => InventoryManagementScreen(),
          //'/logs': (context) => LogsScreen(),
          //'/settings': (context) => SettingsScreen(),
          //'/customer_support': (context) => CustomerSupportScreen(),
          '/login': (context) => const LoginScreen(),
          '/settings': (context) =>
              SettingsScreen(toggleThemeMode: toggleThemeMode),
        },
      ),
    );
  }
// This is for checking whether the user is logged in or not...
// Might be modified
//
// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }
//         if (snapshot.hasData) {
//           return const HomeScreen();
//         } else {
//           return LoginScreen();
//         }
//       },
//     );
//   }
//
}
