import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/items.dart';

class CardItems extends StatefulWidget {
  ItemsModel? model;

  CardItems({this.model});

  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {
  Widget estrellas(int valor) {
    switch (valor) {
      case 10:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;
      case 20:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 30:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 40:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 50:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 60:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 70:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 80:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.white, size: 30),
          ],
        );
        break;

      case 90:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
          ],
        );
        break;

      case 100:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
            Icon(Icons.star, color: Colors.amber, size: 30),
          ],
        );
        break;
      default:
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.star, color: Colors.amber, size: 30),
        Icon(Icons.star, color: Colors.amber, size: 30),
        Icon(Icons.star, color: Colors.amber, size: 30),
        Icon(Icons.star, color: Colors.white, size: 30),
        Icon(Icons.star, color: Colors.white, size: 30),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 10, right: 10),
      color: Colors.white12,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print("hola ");
            },
            child: Container(
              height: 130,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.model!.titulo,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      Text(widget.model!.porcentaje.toString(),
                          style: TextStyle(fontSize: 20)),
                      Text("%", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  estrellas(10)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
