import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/src/features/menu/models/model_coffee_category.dart';
import 'package:flutter_coffee_shop/src/features/menu/view/menu_screen.dart';
import 'package:flutter_coffee_shop/src/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      home: const Center(
        child: MenuScreen(categories: categories),),
      
    );
  }
}