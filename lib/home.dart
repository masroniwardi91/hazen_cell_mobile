import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  height: 266 - 70,
                  margin: const EdgeInsets.only(
                      top: 50, left: 10, right: 10, bottom: 20),
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
                        child: Image.asset(
                          'assets/images/splash_screen.png',
                          height: 43,
                          alignment: Alignment.topLeft,
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
                              ]),
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
                childAspectRatio: .40,
                padding: const EdgeInsets.all(10),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[
                  Container(
                    height: 347,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              offset: const Offset(3, 2),
                              blurRadius: 7)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                "assets/images/products/apple-iphone-12-pro-max.jpg",
                                width: double.infinity,
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: 45,
                          child: const Text(
                            "Iphone 14 Pro dsfsdf sdfsdf sdfsdf sdfsdf sd fsdf sdsdfdsf dfgdf fg gd gdfg g fd gf d",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 221, 221, 221)))),
                        ),
                        const Text(
                          "Rp. 12.500.000,-",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(29, 123, 84, 1)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Rp. 565656565"),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                icon: const Icon(Icons.add_shopping_cart),
                                onPressed: () {})
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
