import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';
import '../details_page.dart';
import 'create_route_method.dart';

Row boxAnimatedMethod(BuildContext context, int index) {
  return Row(
    children: [
      AnimatedContainer(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              context.watch<HomeProvider>().solarSystemData[index].gif!,
            ),
          ),
        ),
        width: (index == context.watch<HomeProvider>().boxIndex) ? 200 : 100,
        duration: Duration(seconds: 2),
      ),
      SizedBox(width: 10),
      AnimatedContainer(
        duration: Duration(seconds: 2),
        height: (index == context.watch<HomeProvider>().boxIndex) ? 200 : 150,
        width: 160,
        // color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.watch<HomeProvider>().solarSystemData[index].name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
                Text(
                  context
                      .watch<HomeProvider>()
                      .solarSystemData[index]
                      .description!,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(createRoute());
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width:
                        (context.watch<HomeProvider>().boxIndex == index)
                            ? 115
                            : 0,
                    height:
                        (context.watch<HomeProvider>().boxIndex == index)
                            ? 50
                            : 0,
                    decoration: BoxDecoration(
                      color:
                          (context.watch<HomeProvider>().boxIndex == index)
                              ? Colors.white30
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "Show More!",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
