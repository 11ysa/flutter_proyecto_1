import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItems extends StatefulWidget {
  CardItems({Key? key}) : super(key: key);
  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12,left: 10, right: 10),
       color: Colors.white12,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print("hola ");
            },
           child: Container(
              height:130,
              width: 160,
              decoration:BoxDecoration(
                color: Colors.lightGreenAccent.withOpacity(0.5),
              borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Titulo Academicos en univercidades",textAlign: TextAlign.center, style: TextStyle(fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis),
              
                  Text("60 %",style: TextStyle(fontSize:20)),
               
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: Colors.amber,size:30),
                        Icon(Icons.star,color: Colors.amber,size:30),
                        Icon(Icons.star,color: Colors.amber,size:30),
                        Icon(Icons.star,color: Colors.white,size:30),
                        Icon(Icons.star,color: Colors.white,size:30),
                      ],
                    ),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
