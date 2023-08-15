import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/backend/firebase.dart';
import 'package:untitled1/screens/product%20screen.dart';

class  Recentview extends StatelessWidget {
  const Recentview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery
        .of(context)
        .size;

    return FutureBuilder(
      future: FireBase().getTopProduct(),
      builder: (context,prd) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 15),

            height: 321,
            width: screen.width * 3,
            child: Column(children: [
              Row(children: [
                const SizedBox(width: 10),
                const Text("Recently Viewed", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Expanded(child: Container()),
                Text("See all", style: TextStyle(color: Colors.blueGrey[500]),),
                const SizedBox(width: 10,),
              ]),
              const SizedBox(height: 10,),

              Expanded(child: ListView.builder(
                  // itemCount:product_url.prd_list.length,
                  itemCount:7,

                  scrollDirection: Axis.horizontal, itemBuilder: (context, index)
                 {
                   var Prd=prd.data![index];

                             return InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, ProductScreen.route,
                                    arguments: Prd),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.08),
                                            spreadRadius: 0.8,
                                            blurRadius: 5,
                                            offset: const Offset(
                                                -3, 0), // shadow on left side
                                          ),
                                          BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.08),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(
                                                3, 0), // shadow on right side
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      width: screen.width * 0.49,
                                      height: 300,
                                      child: Column(
                                        children: [
                                          ClipRRect(

                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image(
                                                height: screen.width * 0.44 ,
                                                  fit: BoxFit.fitHeight,
                                                  image: NetworkImage(Prd.prdlink[0]))),
                                                  // image: NetworkImage("https://digitalsynopsis.com/wp-content/uploads/2014/11/creative-product-packaging-design-32.jpg"))),
                                          const SizedBox(
                                            height: 8,

                                          ),
                                          Row(children: [
                                            Expanded(
                                                child: Column(
                                                children:  [
                                                 Text(
                                                   Prd.prdname,
                                                   style: const TextStyle(
                                                       fontWeight:
                                                           FontWeight.bold,
                                                       fontSize: 12,
                                                       fontFamily:
                                                           "Whereas recognition of the inherent dignity"),
                                                 ),
                                                 Text(
                                                   maxLines: 3,
                                                   overflow:
                                                       TextOverflow.ellipsis,
                                                Prd.prdname,
                                                   style: const TextStyle(
                                                       fontSize: 12,
                                                       color: Colors.grey),
                                                 )
                                                ],
                                              )),
                                            const IconButton(
                                              onPressed: null,
                                              icon: Icon(Icons.favorite_sharp),
                                            )
                                          ]),
                                          Row(
                                            children: [
                                          const Text(
                                            "Rs200",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Expanded(child: Container()),
                                          const IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box_rounded,
                                                color: Colors.lightBlue,
                                              ))
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }),),

          ],)

        );
      }
    );
  }
}
