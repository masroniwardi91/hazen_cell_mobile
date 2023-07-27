import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final int idProduct;
  const ProductDetailPage({super.key, required this.idProduct});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text("Id Product ${widget.idProduct}"),
        ),
      ),
    );
  }
}
