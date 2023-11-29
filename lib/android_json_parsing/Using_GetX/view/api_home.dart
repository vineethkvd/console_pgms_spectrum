import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else if (controller.product.value != null) {
                return Column(
                  children: [
                    Image.network(controller.product.value.image!),
                    Text('ID: ${controller.product.value.id}'),
                    Text('Title: ${controller.product.value.title}'),
                    Text('Price: \$${controller.product.value.price}'),
                    Text(
                        'Description: ${controller.product.value.description}'),
                    Text('Category: ${controller.product.value.category}'),
                    Text('Rating: ${controller.product.value.rating!.rate}'),
                  ],
                );
              } else {
                return Text('Failed to load product');
              }
            }),
          ],
        ),
      ),
    );
  }
}
