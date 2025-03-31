import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spesh_app/provider/home_provider.dart';
import 'component/app_bar_method.dart';
import 'component/box_animated_method.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeProvider>().getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bg.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                appBarMethod(),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        context.watch<HomeProvider>().solarSystemData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white10,
                        child: GestureDetector(
                          onTap: () {
                            context.read<HomeProvider>().setBoxIndex(index);
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height:
                                (index ==
                                        context.watch<HomeProvider>().boxIndex)
                                    ? 200
                                    : 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: boxAnimatedMethod(context, index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
