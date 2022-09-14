import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/items.dart';
import 'package:flutter_proyecto_1/page/convocatoria/form_items.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardItems extends StatefulWidget {
  ConvocatoriaModel? modelConvo;
  ItemsModel? modelItems;
  int? itemsPorcentajeTotal;
  CardItems({this.modelConvo, this.modelItems, this.itemsPorcentajeTotal});

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

  double numeroEstrellas(int valor) {
    double valor_1 = valor / 10;
    double valor_2 = valor_1 / 2;
    return valor_2;
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FormItems(
                            modelConvo: widget.modelConvo,
                            modelItems: widget.modelItems,
                            modelItemsConvo: widget.modelConvo!,
                          )));
            },
            child: Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent.withOpacity(0.6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.modelItems!.titulo,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.modelItems!.porcentaje.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                              fontWeight: FontWeight.w800)),
                      const Text(" %",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: RatingBar.builder(
                            initialRating:
                                numeroEstrellas(widget.modelItems!.porcentaje),
                            minRating: 0.5,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                      ),
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
