import 'package:flutter/material.dart';
import 'package:hazen_cell_mobile/model/productList.dart';

class ProductDetailPage extends StatelessWidget {
  final int idProduct;
  final String nameProduct;
  final String hargaProduct;
  const ProductDetailPage(
      {super.key,
      required this.idProduct,
      required this.nameProduct,
      required this.hargaProduct});

  @override
  Widget build(BuildContext context) {
    Map<int, dynamic> description = ProductList().description;
    Map<String, dynamic> spesifikasi = description[idProduct]["spesifikasi"];
    String deskripsi = description[idProduct]["deskripsi"];
    List images = description[idProduct]["images"];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 383,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 55,
                        ),
                        Container(
                          height: 240,
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          child: PageView(
                            children: images
                                .map((url) => Image.network(
                                      url,
                                    ))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 0, bottom: 5, left: 15, right: 15),
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.indigo,
                                  alignment: Alignment.topLeft,
                                  height: 30,
                                  child: Text(
                                    this.nameProduct,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  // color: Colors.amberAccent,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "Rp. ${this.hargaProduct}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1D7B54)),
                                      )),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () {},
                                              icon: Icon(Icons
                                                  .favorite_border_rounded),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              padding: EdgeInsets.all(0),
                                              icon: Icon(Icons.share),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 30,
                    child: Container(
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
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
              color: const Color.fromARGB(255, 233, 233, 233),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 223, 223, 223),
                      child: TabBar(
                        labelColor: Color(0xFF3FC7F2),
                        indicatorColor: Color(0xFF3FC7F2),
                        dividerColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 14),
                        tabs: [
                          SizedBox(
                              height: 30,
                              child: Center(child: Text('Spesifikasi'))),
                          SizedBox(
                              height: 30,
                              child: Center(child: Text('Deskripsi'))),
                        ], // Menampilkan daftar tab
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 80),
                        child: TabBarView(
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: ListView(
                                children: [
                                  for (var element in spesifikasi.entries) ...[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 110,
                                            child: Text(
                                              element.key.replaceAll("_", " "),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF474747)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              element.value,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF474747)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Color.fromARGB(255, 233, 233, 233),
                                    )
                                  ]
                                ],
                              ),
                            ), // Menampilkan konten sesuai dengan tab aktif
                            // SpesifikasiWidgets(spesifikasi: []),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                deskripsi,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF474747)),
                              ),
                            ), // Menampilkan konten sesuai dengan tab aktif
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE45429),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.shopping_cart_checkout,
                    size: 32,
                    color: Colors.white,
                  ),
                  Text(
                    "Beli Sekarang",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
