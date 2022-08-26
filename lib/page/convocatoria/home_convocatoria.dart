// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

class HomeConvocatoria extends StatelessWidget {
  const HomeConvocatoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convocatoria"),
        centerTitle: true,
        backgroundColor: dcolorAppBar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 18),
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Titulo de convocatoria",
                  suffixIcon: Icon(Icons.work),
                  prefixIcon: Icon(Icons.account_balance_sharp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14))),
            ),
            const SizedBox(
              height: 10,
            ),
         
         
            Card(
              color: Colors.white54,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 5.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Evaluadores"),
                    leading: Icon(Icons.supervised_user_circle_outlined),
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("75197145"),
                                SizedBox(width:5),
                                Text("Juan Sanchez"),
                              ],
                            ),
                            
                            SizedBox(
                              width: 5,
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
                            )
                          ],
                        ),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("75197145"),
                                SizedBox(width:5),
                                Text("Juan Sanchez"),
                              ],
                            ),
                            
                            SizedBox(
                              width: 5,
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
                            )
                          ],
                        ),
                  
                  
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                          size: 15,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), padding: EdgeInsets.all(5)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          
             SizedBox(
              height: 20,
             ),
                      
            Card(
              color: Colors.white54,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 5.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Participantes"),
                    leading: Icon(Icons.person),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text("JHON SANCHEZ ALARCON"),
                                  Row(
                                    children: [
                                      Text("75197145"),
                                      SizedBox(width:8),
                                      Text("Administrador"),
                                    ],
                                  ),
                              ],
                            ),
                          
                      
                          
                          ],
                        ),
                          SizedBox(height:10),
                             Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text("JHON SANCHEZ ALARCON"),
                                  Row(
                                    children: [
                                      Text("75197145"),
                                      SizedBox(width:8),
                                      Text("Administrador"),
                                    ],
                                  ),
                              ],
                            ),
                                                   
                      
                          
                          ],
                        ),

                         SizedBox(height:10),
                             Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text("JHON SANCHEZ ALARCON"),
                                  Row(
                                    children: [
                                      Text("75197145"),
                                      SizedBox(width:8),
                                      Text("Administrador"),
                                    ],
                                  ),
                              ],
                            ),
                            
                          
                      
                          
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                          size: 15,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), padding: EdgeInsets.all(5)),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Items de Evaluacion",style: TextStyle(fontSize: 16),),
                  TextButton.icon(onPressed: () {},
                  icon: Icon(Icons.add), label:Text("Agregar"))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent
              ),
              child: Column(
                children: [
                  
                  Text("Titulos Academicos"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(children: [Text("data1")],),
                          
                          Row(children: [Text("data1")],),
                          Row(children: [Text("data1")],),
                          Row(children: [Text("data1")],)
                        ],
                      ),
                      Column(
                        children: [
                          Text("data"),
                          Text("data"),
                          Text("data"),
                        ],
                      )
                    ],
                    
                  )

                 
                ],
              ),
            )
          
          
          
          
          ],
        ),
      ),
    );
  }
}
