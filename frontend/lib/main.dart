import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/ui/screens/home_screen.dart';
import 'package:frontend/features/home/ui/screens/list_screen.dart';
import 'package:frontend/features/home/ui/screens/shopping_cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ShoppingCubit(),
        child: Homepage(),
      ),
    );
  }
}
