import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List checked = [];
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //     super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final cartList =
        ModalRoute.of(context)!.settings.arguments as Map<int, dynamic>;
    List toListproduct = cartList.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("List Pruduct"),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 70),
          itemCount: toListproduct.length,
          itemBuilder: (context, index) {
            final data = toListproduct[index];
            checked.add(false);
            print(data);
            return Column(
              children: [
                Container(
                  height: 96,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Checkbox(
                          value: checked[index],
                          onChanged: (value) {
                            setState(() {
                              checked[index] == false
                                  ? checked[index] = true
                                  : checked[index] = false;
                            });
                          },
                        ),
                      ),
                      Image.asset(
                        data["image"],
                        width: 54,
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                data["name"],
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(2),
                                          backgroundColor: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Container(
                                      height: 24,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: Color(0xFFD9D9D9)),
                                              bottom: BorderSide(
                                                  color: Color(0xFFD9D9D9)))),
                                      child: Center(
                                        child: Text(
                                          data["jumlah"].toString(),
                                          style: TextStyle(),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(2),
                                          backgroundColor: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 252, 127, 105),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Divider()
              ],
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE45429),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
