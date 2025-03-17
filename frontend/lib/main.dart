import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/ui/screens/home_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ListCubit(),
      child: MyApp(),
    ),
  );
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
      // home: BlocProvider<ListCubit>(
      //   create: (context) => ListCubit(),
      //   child: 
      home:HomeScreen(),
      //),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/features/Home/logic/cubit/shopping_cubit.dart';
// import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
// import 'package:frontend/features/home/ui/screens/home_screen.dart';
// import 'package:frontend/features/home/ui/screens/shopping_cart_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => ItemCubit()..fetchItems()),
//         BlocProvider(create: (context) => CartCubit()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: ItemListScreen(),
//       ),
//     );
//   }
// }

// // Model Class
// class Item {
//   //final int id;
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;

//   Item({/*required this.id,*/ required this.name, required this.description, required this.price, required this.imageUrl});

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       //id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       price: json['price'].toDouble(),
//       imageUrl: json['imageUrl'],
//     );
//   }
// }

// // Item Cubit for fetching data
// class ItemCubit extends Cubit<List<Item>> {
//   ItemCubit() : super([]);
//   final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
//   bool endpointworking=true;
//   Future<void> fetchItems() async {
//     try {
//       if (endpointworking){
//         final Map<String, dynamic> data = {
//           "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2N2Q4MjFiZDRkNGNmNGFhMWEzZDVhZTUiLCJpYXQiOjE3NDIyMTgxMjUsImV4cCI6MTc0MjQ3NzMyNX0._yqjqp0uKSJit4J9P4s5KUNnkoGUVjbCBT7f4zK-3Zc"
//         };
//       final response = await _dio.get('/items', data:data);
//         List<Item> items = (response.data as List).map((json) => Item.fromJson(json)).toList();
//         emit(items);
//       }else{
//         List<Item> items= mockItems;
//         emit(items); 
//       }
//     } catch (e) {
//       print("Error fetching items: $e");
//     }

//   }

// }




// List<Item> mockItems = [
//   Item(
//     name: 'Margherita Pizza',
//     description: 'Classic pizza topped with fresh tomatoes, mozzarella cheese, and basil.',
//     price: 8.99,
//     imageUrl: 'https://placehold.co/300x300?text=Margherita+Pizza',
//   ),
//   Item(
//     name: 'Cheeseburger',
//     description: 'Juicy grilled beef patty with cheddar cheese, lettuce, and tomato.',
//     price: 7.49,
//     imageUrl: 'https://placehold.co/300x300?text=Cheeseburger',
//   ),
//   Item(
//     name: 'Caesar Salad',
//     description: 'Crisp romaine lettuce with Caesar dressing, croutons, and Parmesan cheese.',
//     price: 5.99,
//     imageUrl: 'https://placehold.co/300x300?text=Caesar+Salad',
//   ),
//   Item(
//     name: 'Spaghetti Bolognese',
//     description: 'Spaghetti pasta served with a rich and savory beef Bolognese sauce.',
//     price: 10.50,
//     imageUrl: 'https://placehold.co/300x300?text=Spaghetti+Bolognese',
//   ),
//   Item(
//     name: 'Grilled Chicken Sandwich',
//     description: 'Grilled chicken breast served on a toasted bun with lettuce and mayo.',
//     price: 6.75,
//     imageUrl: 'https://placehold.co/300x300?text=Grilled+Chicken+Sandwich',
//   ),
//   Item(
//     name: 'French Fries',
//     description: 'Crispy golden fries served with ketchup.',
//     price: 3.49,
//     imageUrl: 'https://placehold.co/300x300?text=French+Fries',
//   ),
//   Item(
//     name: 'Chocolate Milkshake',
//     description: 'Creamy chocolate milkshake topped with whipped cream.',
//     price: 4.99,
//     imageUrl: 'https://placehold.co/300x300?text=Chocolate+Milkshake',
//   ),
//   Item(
//     name: 'Pepperoni Pizza',
//     description: 'Pizza topped with mozzarella cheese and spicy pepperoni slices.',
//     price: 9.50,
//     imageUrl: 'https://placehold.co/300x300?text=Pepperoni+Pizza',
//   ),
//   Item(
//     name: 'Veggie Burger',
//     description: 'Delicious burger made with a plant-based patty and fresh veggies.',
//     price: 7.99,
//     imageUrl: 'https://placehold.co/300x300?text=Veggie+Burger',
//   ),
//   Item(
//     name: 'Chicken Tacos',
//     description: 'Soft tortillas filled with seasoned chicken, lettuce, and salsa.',
//     price: 6.25,
//     imageUrl: 'https://placehold.co/300x300?text=Chicken+Tacos',
//   ),
//   Item(
//     name: 'Strawberry Smoothie',
//     description: 'Refreshing smoothie made with fresh strawberries and yogurt.',
//     price: 4.75,
//     imageUrl: 'https://placehold.co/300x300?text=Strawberry+Smoothie',
//   ),
//   Item(
//     name: 'Grilled Salmon',
//     description: 'Grilled salmon fillet served with lemon butter sauce and vegetables.',
//     price: 14.99,
//     imageUrl: 'https://placehold.co/300x300?text=Grilled+Salmon',
//   ),
//   Item(
//     name: 'Pancakes with Syrup',
//     description: 'Fluffy pancakes served with maple syrup and butter.',
//     price: 5.49,
//     imageUrl: 'https://placehold.co/300x300?text=Pancakes+with+Syrup',
//   ),
//   Item(
//     name: 'Iced Coffee',
//     description: 'Cold brewed coffee served over ice with cream.',
//     price: 3.99,
//     imageUrl: 'https://placehold.co/300x300?text=Iced+Coffee',
//   ),
//   Item(
//     name: 'Chicken Caesar Wrap',
//     description: 'Grilled chicken with romaine lettuce, Parmesan, and Caesar dressing in a wrap.',
//     price: 6.95,
//     imageUrl: 'https://placehold.co/300x300?text=Chicken+Caesar+Wrap',
//   ),
//   Item(
//     name: 'Margarita Cocktail',
//     description: 'Classic margarita cocktail with tequila, lime juice, and triple sec.',
//     price: 8.50,
//     imageUrl: 'https://placehold.co/300x300?text=Margarita+Cocktail',
//   ),
//   Item(
//     name: 'Beef Burrito',
//     description: 'Flour tortilla stuffed with seasoned beef, rice, beans, and cheese.',
//     price: 7.49,
//     imageUrl: 'https://placehold.co/300x300?text=Beef+Burrito',
//   ),
//   Item(
//     name: 'Greek Salad',
//     description: 'Fresh salad with cucumbers, tomatoes, feta cheese, olives, and vinaigrette.',
//     price: 5.99,
//     imageUrl: 'https://placehold.co/300x300?text=Greek+Salad',
//   ),
//   Item(
//     name: 'Lemonade',
//     description: 'Freshly squeezed lemonade served over ice.',
//     price: 2.99,
//     imageUrl: 'https://placehold.co/300x300?text=Lemonade',
//   ),
//   Item(
//     name: 'Chocolate Brownie',
//     description: 'Rich chocolate brownie with a gooey center and crispy edges.',
//     price: 3.50,
//     imageUrl: 'https://placehold.co/300x300?text=Chocolate+Brownie',
//   ),
// ];

// // List<Item> mockShoppingItems = [
// //   Item(
// //     id:1,
// //     name: "Apple iPhone 15",
// //     price: 999.99,
// //     description: "Latest Apple iPhone with A17 Bionic chip and 120Hz display.",
// //     imageUrl: "https://example.com/iphone15.jpg",
// //   ),
// //   Item(
// //     id:2,
// //     name: "Samsung Galaxy S23",
// //     price: 849.99,
// //     description: "Samsung's flagship phone with a stunning AMOLED display.",
// //     imageUrl: "https://example.com/galaxy_s23.jpg",
// //   ),
//   // Item(
//   //   id:3,
//   //   name: "Sony WH-1000XM5 Headphones",
//   //   price: 399.99,
//   //   description: "Industry-leading noise canceling wireless headphones.",
//   //   imageUrl: "https://example.com/sony_headphones.jpg",
//   // ),
//   // Item(
//   //   id:4,
//   //   name: "Apple MacBook Pro 16-inch",
//   //   price: 2499.99,
//   //   description: "Powerful M3 Pro chip with Liquid Retina XDR display.",
//   //   imageUrl: "https://example.com/macbook_pro.jpg",
//   // ),
//   // Item(
//   //   id:5,
//   //   name: "Nike Air Max 270",
//   //   price: 150.00,
//   //   description: "Stylish and comfortable sneakers with a large air unit.",
//   //   imageUrl: "https://example.com/nike_airmax.jpg",
//   // ),
//   // Item(
//   //   id:6,
//   //   name: "Amazon Echo Dot (5th Gen)",
//   //   price: 49.99,
//   //   description: "Smart speaker with Alexa voice assistant and improved sound.",
//   //   imageUrl: "https://example.com/echo_dot.jpg",
//   // ),
//   // Item(
//   //   id:7,
//   //   name: "Logitech MX Master 3S",
//   //   price: 99.99,
//   //   description: "Advanced wireless mouse with precision tracking.",
//   //   imageUrl: "https://example.com/logitech_mx_master.jpg",
//   // ),
//   // Item(
//   //   id:8,
//   //   name: "Samsung 55-inch 4K Smart TV",
//   //   price: 699.99,
//   //   description: "Crystal UHD display with HDR10+ and smart features.",
//   //   imageUrl: "https://example.com/samsung_4k_tv.jpg",
//   // ),
//   // Item(
//   //   id:9,
//   //   name: "Dyson V11 Cordless Vacuum",
//   //   price: 599.99,
//   //   description: "High-power suction vacuum cleaner for deep cleaning.",
//   //   imageUrl: "https://example.com/dyson_vacuum.jpg",
//   // ),
//   // Item(
//   //   id:10,
//   //   name: "Bose SoundLink Revolve+",
//   //   price: 299.99,
//   //   description: "360-degree portable Bluetooth speaker with deep bass.",
//   //   imageUrl: "https://example.com/bose_speaker.jpg",
//   // ),
// //];

// // Cart Cubit for managing selected items
// class CartCubit extends Cubit<List<Item>> {
//   CartCubit() : super([]);

//   void addItem(Item item) {
//     final updatedCart = List<Item>.from(state)..add(item);
//     emit(updatedCart);
//   }

//   void removeItem(Item item) {
//     final updatedCart = List<Item>.from(state)..remove(item);
//     emit(updatedCart);
//   }
// }




// //Item List Screen
// class ItemListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Items"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
//             ),
//           ),
//         ],
//       ),
//       body: BlocBuilder<ItemCubit, List<Item>>(
//         builder: (context, items) {
//           if (items.isEmpty) return Center(child: CircularProgressIndicator());
//           return GestureDetector(
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final item = items[index];
//                 return ListTile(
//                   leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
//                   title: Text(item.name),
//                   subtitle: Text(item.description),
//                   trailing: IconButton(
//                     icon: Icon(Icons.add),
//                     onPressed: () => context.read<CartCubit>().addItem(item),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // Shopping Cart Screen
// class ShoppingCartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Shopping Cart")),
//       body: BlocBuilder<CartCubit, List<Item>>(
//         builder: (context, cartItems) {
//           if (cartItems.isEmpty) return Center(child: Text("Cart is empty"));
//           return ListView.builder(
//             itemCount: cartItems.length,
//             itemBuilder: (context, index) {
//               final item = cartItems[index];
//               return ListTile(
//                 leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
//                 title: Text(item.name),
//                 subtitle: Text(item.description),
//                 trailing: IconButton(
//                   icon: Icon(Icons.remove),
//                   onPressed: () => context.read<CartCubit>().removeItem(item),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

