import 'package:flutter/material.dart';

class SpesifikasiWidgets extends StatelessWidget {
  final List<dynamic> spesifikasi;
  const SpesifikasiWidgets({super.key, required this.spesifikasi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 106,
                  child: Text("Dsiplay"),
                ),
                Expanded(
                  child: Text("hsdhfdsh sfhksjdhfjkdsh jkshdjfhdsf jh"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
