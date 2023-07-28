import 'package:flutter/material.dart';
import 'package:hazen_cell_mobile/pages/product_detail_page.dart';

class ProductWidget extends StatefulWidget {
  final String image;
  final String name;
  final String cost;
  final int stock;
  final int idProduct;
  final Function addGlobalCart;
  final Function removeGlobalCart;
  final ValueChanged<int> onChang;

  const ProductWidget(
      {super.key,
      required this.idProduct,
      required this.image,
      required this.name,
      required this.cost,
      required this.stock,
      required this.addGlobalCart,
      required this.removeGlobalCart,
      required this.onChang});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int _counter = 0;
  int _stock = 0;

  @override
  void initState() {
    _stock = widget.stock;
    super.initState();
  }

  void _addCart() {
    setState(() {
      if (_stock > 0) {
        _counter++;
        _stock--;
        widget.addGlobalCart();
      }
    });
  }

  void _removeCart() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _stock++;
        widget.removeGlobalCart();
      }
    });
  }

  void _removeAllCart() {
    setState(() {
      if (_counter > 0) {
        widget.onChang(_counter);
        _stock += _counter;
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onTap: () =>
                {Navigator.of(context).push(_createRoute(widget.idProduct))},
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    widget.image,
                    width: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 45,
                  child: Text(
                    widget.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 221, 221, 221)))),
          ),
          Text(
            "Rp. ${widget.cost}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(29, 123, 84, 1),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stock : ${_stock.toString()}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 11),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 36,
                    width: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        _removeCart();
                      },
                      onLongPress: () {
                        _showAlertDialog();
                      },
                      child: Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xFFE45429),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Color(0xFFE45429),
                          ),
                        ),
                        // and this
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    height: 36,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {
                              _addCart();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Masuk Keranjang",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 0),
                              backgroundColor: Color(0xFFE45429),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                  color: Color(0xFFE45429),
                                ),
                              ),
                              // and this
                            ),
                          ),
                        ),
                        if (_counter > 0) ...[
                          Positioned(
                            top: 1,
                            right: 1,
                            child: Container(
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF48B6B),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Center(
                                child: Text(
                                  _counter.toString(),
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Route _createRoute(int idProduct) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProductDetailPage(
        idProduct: idProduct,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        if (_counter > 0) {
          return AlertDialog(
            title: const Text('Hapus Produk'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah anda yakin ingin menghapus semua produk ini?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  _removeAllCart();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        } else {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Produk ini tidak ada di dalam keranjang?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      },
    );
  }
}
