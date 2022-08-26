import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardParticipantes extends StatelessWidget {
  const CardParticipantes({Key? key}) : super(key: key);

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
                  Icons.person_pin_outlined,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Participantes",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            minLeadingWidth: 1,
            minVerticalPadding: 10,
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Juan Alaber Sanchez alarcon",
                            maxLines: 1,
                          ),
                          Text(
                            "75197145",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              color: Colors.amberAccent,
                              child: Text(
                                "Ing. Telecominicacio",
                                maxLines: 1,
                              ))),
                    ],
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
