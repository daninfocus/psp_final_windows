import 'package:flutter/material.dart';
import 'package:psp_final_windows/models/product_response.dart';
import 'package:psp_final_windows/services/product_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: width < 1000
              ? 0.7
              : width < 700
                  ? 0
                  : 0.9,
          child: Column(
            children: [
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  alignLabelWithHint: true,
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.1,
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  alignLabelWithHint: true,
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.1,
                ),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Image URL',
                  alignLabelWithHint: true,
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.1,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Product product = Product(
                        name: nameController.text,
                        price: priceController.text,
                        image: imageController.text);
                    ProductService productService = ProductService();
                    productService.postProducts(product);
                  },
                  icon: Icon(Icons.save))
            ],
          ),
        ),
      ),
    );
  }
}
