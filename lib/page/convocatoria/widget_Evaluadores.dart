import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardEvaluadores extends StatelessWidget {
  const CardEvaluadores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 5.0,
      child: Column(
        children: [
          ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.supervised_user_circle_outlined,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Evaluadores",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            minVerticalPadding: 10,
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Juan Alaber Sanchez alarcon"),
                          Text(
                            "75197145",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow[300],
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow[300],
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
          //botones
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30,
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.edit,
                    size: 15,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), padding: EdgeInsets.all(5)),
                ),
              ),
              Container(
                width: 30,
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), padding: EdgeInsets.all(5)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
