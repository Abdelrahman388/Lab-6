import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/logic/cubit/shopping_cubit.dart';
import 'package:frontend/features/home/data/models/item_model.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: ListView.builder(
        itemCount: mockShoppingItems.length,
        itemBuilder: (context, index) {
          final item = mockShoppingItems[index];
          return GestureDetector(
            child: ListTile(
                leading: Image.network(item.imageUrl,
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(item.name),
                subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                trailing: IconButton(icon: Icon(Icons.add),onPressed: (){context.read<ShoppingCubit>().addItem(item);},),
                onTap: () {}),
          );
        },
      ),
    );
  }
}
