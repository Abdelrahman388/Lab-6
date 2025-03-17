import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/services/api_service.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/shopping_cubit.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  List<Item> items = []; // Store items from API
  List<Item> selectedItems = [];

  final ApiService apiService;

  ShoppingCubit(this.apiService) : super(ShoppingInitial());

  /// Fetches all items from the API
  Future<void> getAllItems() async {
    try {
      emit(ShoppingLoading());
      final fetchedItems = await apiService.getAllItems();
      items = fetchedItems;
      emit(ShoppingLoaded(items));
    } catch (e) {
      emit(ShoppingError('Failed to load items: $e'));
    }
  }


  void addItem(Item item) {
    selectedItems.add(item);
    emit(ShoppingCart(List.from(selectedItems))); 
  }

  void removeItemByName(String nameToRemove) {
    selectedItems.removeWhere((item) => item.name == nameToRemove);
    emit(ShoppingCart(List.from(selectedItems)));
  }

  void backClicked() {
    emit(ShoppingInitial());
  }

  void shoppingCartButton() {
    emit(ShoppingCart(List.from(selectedItems)));
  }
}
