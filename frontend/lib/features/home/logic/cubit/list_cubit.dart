import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/data/services/api_service.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  List<Item>? items ;
  List<Item> selectedItems=[];
  ListCubit() : super(ListInitial());
  final apiService = ApiService();

    Future<void> getAllItems() async {
    try {
      emit(ListLoading());
      final fetchedItems = await apiService.getAllItems();
      items=fetchedItems;
      emit(ListLoaded(fetchedItems));
    } catch (e) {
      emit(ListError('Failed to load items: $e'));
    }
  }

  //   void addItem(Item item) {
  //   selectedItems.add(item);
  //   emit(ShoppingUpdated(List.from(selectedItems)));
  // }

  void addItem(Item item) {
  if (state is ListLoaded || state is ShoppingUpdated) {
    selectedItems.add(item);
    emit(ShoppingUpdated(List.from(selectedItems))); 
  }
}

  
  void shoppingCartButton() {
    emit(ShoppingUpdated(List.from(selectedItems)));
  }
  

}



// void removeItemByName(List<Item> items, String nameToRemove) {
//   items.removeWhere((item) => item.name == nameToRemove);
//   emit(CartState());
// }
// void backclicked(){emit(ShoppingInitial());}
// void shoppingcartbutton(){emit(CartState());}
