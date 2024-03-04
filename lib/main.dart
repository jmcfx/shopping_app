import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controller/cart_provider.dart';
import 'package:shopping_app/controller/page_provider.dart';
import 'package:shopping_app/controller/product_size_provider.dart';
import 'package:shopping_app/view/screens/base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Cart Provider.....
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        //Page Notifier.....
        ChangeNotifierProvider(
          create: (create) => PageNotifier(),
        ),
        ChangeNotifierProvider(create: (create)=> ProductSizeNotifier())
      ],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: Colors.lightBlue.shade200,
          ),
          primaryColor: Colors.lightBlue.shade200,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          fontFamily: 'Lato',
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Base(),
      ),
    );
  }
}
