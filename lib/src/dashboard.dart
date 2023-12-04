import 'package:coffee/src/order.dart';
import 'package:coffee/src/marketing.dart';
import 'package:coffee/src/sidebar.dart';
import 'package:coffee/src/tes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee/bundle.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false, 
        backgroundColor: Color.fromARGB(255, 181, 57, 5),
        drawer: Sidebar(),
        appBar: AppBar(
      
   
          leading: Builder(
            builder: (context) => IconButton( icon: Icon(Icons.sort,size: 30,color: Colors.white,),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
         
          backgroundColor: Color.fromARGB(255, 181, 57, 5),
        ),
        body: Column(children: [
          Container(
            height: 90,
            width: 380,
            child: Center(
              child: Text(
                'HIGHLAND',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            height:505,
            width: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Orders',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 69, 68, 68)
                                .withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      CupertinoButton(
                          child: Row(
                            children: [
                              Text(
                                'History order',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 181, 57, 5),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Color.fromARGB(255, 181, 57, 5),
                              )
                            ],
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(initialPage: 0,)));}),
                    
                    ],
                  ),
                
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color.fromARGB(
                                          255, 181, 57, 5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.sticky_note_2,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        'Waiting Confirm',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return Order(initialPage: 0, );
                                  }));
                                }),
                            CupertinoButton(
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color.fromARGB(
                                          255, 181, 57, 5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fact_check,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        'Delivered',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return Order(initialPage: 2, );
                                  }));
                                })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color.fromARGB(
                                          255, 181, 57, 5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.subtitles_off,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        'Cancelled',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return Order(initialPage: 3, );
                                  }));
                                }),
                            CupertinoButton(
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color.fromARGB(
                                          255, 181, 57, 5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.rate_review,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        'Reviews',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return Order(initialPage: 4, );
                                  }));
                                
                                })
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 180,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 249, 230, 230).withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 4,
                              
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Text('Store',  style: TextStyle(
                                color: const Color.fromARGB(255, 69, 68, 68)
                                    .withOpacity(0.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              CupertinoButton(child: Column(children: [
                                Icon(Icons.view_cozy,color: const Color.fromARGB(
                                          255, 181, 57, 5),size: 30,),
                                Text('My Product', style: TextStyle(
                                            color: const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),)
                                
                              ],), onPressed: (){Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Myproduct(initialPage: 0)));}),
                              CupertinoButton(child: Column(children: [
                                Icon(Icons.leaderboard,color: const Color.fromARGB(
                                          255, 181, 57, 5),size: 30,),
                                Text('Revenue', style: TextStyle(
                                            color: const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),)
                                
                              ],), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));}),
                              CupertinoButton(child: Column(children: [
                                Icon(Icons.api_sharp,color: const Color.fromARGB(
                                          255, 181, 57, 5),size: 30,),
                                Text('Maketing', style: TextStyle(
                                            color: const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),)
                                
                              ],), onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Marketing(containSelectedBox: [],)));}),
                             
                            ],),
                             Padding(
                               padding: const EdgeInsets.only(left: 24),
                               child: CupertinoButton(child: Column(children: [
                                  Icon(Icons.app_registration,color: const Color.fromARGB(
                                            255, 181, 57, 5),size: 30,),
                                  Text('Blogs', style: TextStyle(
                                              color: const Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),)
                                  
                                ],), onPressed: (){}),
                             )
                          ],),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ]),
  bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                child: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 181, 57, 5),
                  size: 25,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Myproduct(initialPage: 0)));
                },
                child: Icon(
                  Icons.view_cozy,
                  color: Colors.grey,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));},
                child: Icon(
                  Icons.leaderboard,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Marketing(containSelectedBox: [],)));
                },
                child: Icon(
                  Icons.api_sharp,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                 
                },
                child: Icon(
                  Icons.app_registration,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
   
        );
  }
}
