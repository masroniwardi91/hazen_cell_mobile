
import 'package:flutter/material.dart';

class SpesifikastionTabViewWidget extends StatelessWidget {
  const SpesifikastionTabViewWidget({
    super.key,
    required this.spesifikasi,
    required this.deskripsi,
  });

  final Map<String, dynamic> spesifikasi;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
              child: TabBarView(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 80),
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10),
                                    child: Text(
                                      element.value,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF474747)),
                                    ),
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
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      padding: EdgeInsets.only(top: 15, bottom: 80),
                      children: [
                        Text(
                          deskripsi,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF474747)),
                        )
                      ],
                    ),
                  ), // Menampilkan konten sesuai dengan tab aktif
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
