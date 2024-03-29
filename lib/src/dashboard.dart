import 'package:coffee/ip/appcolor.dart';
import 'package:coffee/src/blog.dart';
import 'package:coffee/src/order.dart';
import 'package:coffee/src/marketing.dart';
import 'package:coffee/src/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee/bundle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
bool isACtiveOfSup = false;
  @override
  void initState() {
 getIsActiveSup();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Sidebar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/zz.png'),
              alignment: Alignment.topCenter),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromARGB(255, 181, 57, 5),
              Color.fromARGB(255, 255, 255, 255),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 380,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          FutureBuilder(
                              future: fetchProfileSupplier(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    snapshot.data!.title!.length > 20
                                        ? snapshot.data!.title!
                                                .substring(0, 20) +
                                            '...'
                                        : snapshot.data!.title!.toUpperCase(),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 233, 233),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      child: Builder(
                          builder: (context) => IconButton(
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                              icon: Icon(
                                Icons.sort,
                                size: 30,
                                color: Colors.white,
                              ))))
                ],
              ),
              Container(
                height: 495,
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
                      Row(
                        children: [
                          Text(
                            'Orders',
                            style: TextStyle(
                                color: Color.fromARGB(255, 43, 43, 44)
                                    ,
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
                                        color: AppColor.primary_color,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: AppColor.primary_color,
                                  )
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Order(
                                              initialPage: 0,
                                            )));
                              }),
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
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color.fromARGB(255, 181, 57, 5),
                                            Color.fromARGB(255, 67, 8, 33),
                                          ],
                                          tileMode: TileMode.mirror,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Order(
                                          initialPage: 0,
                                        );
                                      }));
                                    }),
                                CupertinoButton(
                                    child: Container(
                                      height: 70,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                         gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color.fromARGB(255, 181, 57, 5),
                                            Color.fromARGB(255, 67, 8, 33),
                                          ],
                                          tileMode: TileMode.mirror,
                                        ),),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Order(
                                          initialPage: 3,
                                        );
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color.fromARGB(255, 181, 57, 5),
                                            Color.fromARGB(255, 67, 8, 33),
                                          ],
                                          tileMode: TileMode.mirror,
                                        ),),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Order(
                                          initialPage: 4,
                                        );
                                      }));
                                    }),
                                CupertinoButton(
                                    child: Container(
                                      height: 70,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color.fromARGB(255, 181, 57, 5),
                                            Color.fromARGB(255, 67, 8, 33),
                                          ],
                                          tileMode: TileMode.mirror,
                                        ),),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Order(
                                          initialPage: 5,
                                        );
                                      }));
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                           isACtiveOfSup? Container(
                              height: 180,
                              width: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 213, 211, 210)
                                        .withOpacity(0.5),
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Store',
                                        style: TextStyle(
                                            color:Color.fromARGB(255, 43, 43, 44),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CupertinoButton(
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.view_cozy,
                                                color: AppColor.primary_color,
                                                size: 30,
                                              ),
                                              Text(
                                                'My Product',
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Myproduct(
                                                            initialPage: 0)));
                                          }),
                                      CupertinoButton(
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.leaderboard,
                                                color: AppColor.primary_color,
                                                size: 30,
                                              ),
                                              Text(
                                                'Revenue',
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Revenue()));
                                          }),
                                      CupertinoButton(
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.api_sharp,
                                                color: AppColor.primary_color,
                                                size: 30,
                                              ),
                                              Text(
                                                'Marketing',
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Marketing(
                                                          containSelectedBox: [],
                                                        )));
                                          }),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: CupertinoButton(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.app_registration,
                                              color: AppColor.primary_color,
                                              size: 30,
                                            ),
                                            Text(
                                              'Blogs',
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlogView(ind: 0)));
                                        }),
                                  )
                                ],
                              ),
                            ):SizedBox(height: 180,
                            child: Center(child: Text('Your Account Is Disactive.'),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    bottomNavigationBar:isACtiveOfSup? BottomAppBar(
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
                  color: AppColor.primary_color,
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Revenue()));
                },
                child: Icon(
                  Icons.leaderboard,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Marketing(
                            containSelectedBox: [],
                          )));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlogView(ind: 0)));
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
      ):SizedBox(height: 50,),
    );
  }
  getIsActiveSup() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return int
  int? isActiveS = prefs.getInt('isActiveSup');
  if(isActiveS ==1){
    setState(() {
      isACtiveOfSup = true;
    });
  }else{
    setState(() {
      isACtiveOfSup = false;
    });
  }
  return isActiveS;
}
}
