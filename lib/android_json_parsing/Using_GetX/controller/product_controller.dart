import 'package:get/get.dart';

import '../model/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var product = ProductsModel().obs;

  @override
  void onInit() {
    super.onInit();
    _fetchProduct();
  }

  Future<void> _fetchProduct() async {
    try {
      isLoading(true);
      var response = await ProductService().getProduct();
      product(response);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
