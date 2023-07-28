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
      // appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text("Id Product ${widget.idProduct}"),
        ),
      ),
      floatingActionButton: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(top: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color.fromARGB(64, 27, 27, 27),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: Colors.white),
            ),
          )
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(Icons.close),
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size.zero,
          //     padding: EdgeInsets.all(3),
          //     backgroundColor: Colors.transparent,
          //     foregroundColor: Color.fromARGB(255, 36, 36, 36),
          //     elevation: 0,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     // and this
          //   ),
          // ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
