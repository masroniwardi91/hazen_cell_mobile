import 'package:flutter/material.dart';
import 'package:hazen_cell_mobile/widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cart = 0;
  void _addGlobalCart() {
    setState(() {
      _cart++;
    });
  }

  void _removeGlobalCart() {
    setState(() {
      if (_cart > 0) {
        _cart--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF093E61)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 210 - 70,
                  margin: const EdgeInsets.only(
                      top: 30, left: 10, right: 10, bottom: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/header.png"),
                      fit: BoxFit.fitHeight,
                      opacity: .45,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/splash_screen.png',
                              height: 43,
                              alignment: Alignment.topLeft,
                            ),
                            Stack(children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  color: Colors.white,
                                ),
                              ),
                              if (_cart > 0) ...[
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    padding: EdgeInsets.all(0.5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE45429),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Center(
                                      child: Text(
                                        _cart > 99 ? '99+' : _cart.toString(),
                                        style: TextStyle(
                                            fontSize: 7, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ])
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Belanja di Hazen.Cell pasti aman dan terpercaya. Segera dapatkan sekarang jangan sampai kehabisan karena kami hanya menyediakan stock terbatas.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 3.0),
                                blurRadius: 5.0,
                                color: Color.fromARGB(172, 0, 0, 0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(238, 230, 220, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: .47,
                padding: const EdgeInsets.all(10),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  for (int i = 1; i <= 5; i++) ...[
                    ProductWidget(
                      idProduct: i,
                      image:
                          "assets/images/products/apple-iphone-12-pro-max.jpg",
                      name: 'adssad',
                      cost: 234556,
                      stock: 100,
                      addGlobalCart: _addGlobalCart,
                      removeGlobalCart: _removeGlobalCart,
                      onChang: (value) {
                        setState(() {
                          _cart -= value;
                        });
                      },
                    ),
                  ],
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
