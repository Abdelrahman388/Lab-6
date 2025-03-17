import 'package:dio/dio.dart';
import 'package:frontend/features/home/data/models/item_model.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:8000', 
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ));
  }

  // Fetch all items
  Future<List<Item>> getAllItems() async {
    try {
        final Map<String, dynamic> data = {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2N2Q4MjFiZDRkNGNmNGFhMWEzZDVhZTUiLCJpYXQiOjE3NDIyMTgxMjUsImV4cCI6MTc0MjQ3NzMyNX0._yqjqp0uKSJit4J9P4s5KUNnkoGUVjbCBT7f4zK-3Zc"
  };
      final response = await _dio.get('/items', data:data);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      throw Exception('Error fetching items: $e');
    }
  }

  // Fetch shopping cart items
  Future<List<Item>> getShoppingCartItems() async {
    try {
      final response = await _dio.get('/cart');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load shopping cart items');
      }
    } catch (e) {
      throw Exception('Error fetching shopping cart items: $e');
    }
  }
}
