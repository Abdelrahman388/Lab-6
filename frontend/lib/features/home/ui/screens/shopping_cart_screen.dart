import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/logic/cubit/shopping_cubit.dart';
import 'package:frontend/features/Home/data/models/item_model.dart';
import 'package:frontend/features/home/ui/widgets/shopping_cart_card.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Shopping Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ShoppingCubit, ShoppingState>(
        builder: (context, state) {
          final cartItems = context.watch<ShoppingCubit>().selecteditems;
          return cartItems.isEmpty
              ? const Center(child: Text("Your cart is empty"))
              : ShoppingCartCard(items: cartItems as List<Item>);
        },
      ),
    );
  }
}
