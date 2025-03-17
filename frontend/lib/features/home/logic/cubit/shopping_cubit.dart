import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/models/item_model.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  List<Item> selecteditems = [];

  ShoppingCubit() : super(ShoppingInitial());



  void removeItemByName(String name) {
    selecteditems.removeWhere((item) => item.name == name);
    emit(ShoppingUpdated(List.from(selecteditems)));
  }
}



// class ShoppingCubit extends Cubit<ShoppingState> {
//   List<Item> items = []; // Store items from API
//   List<Item> selectedItems = [];

//   final ApiService apiService;

//   ShoppingCubit(this.apiService) : super(ShoppingInitial());


//   void addItem(Item item) {
//     selectedItems.add(item);
//     emit(ShoppingCart(List.from(selectedItems))); 
//   }

//   void removeItemByName(String nameToRemove) {
//     selectedItems.removeWhere((item) => item.name == nameToRemove);
//     emit(ShoppingCart(List.from(selectedItems)));
//   }

//   void backClicked() {
//     emit(ShoppingInitial());
//   }

//   void shoppingCartButton() {
//     emit(ShoppingCart(List.from(selectedItems)));
//   }
// }
